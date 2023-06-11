import 'package:html/dom.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as html;
import 'package:teledart/model.dart';
import 'package:teledart/teledart.dart';

class githubInfoPerpare {

  String URL;
  TeleDart teleDart;
  TeleDartMessage message;

  githubInfoPerpare({
    required this.URL,
    required this.teleDart,
    required this.message,
  });

  githubPrepare() async {
    
    var response = await http.get(Uri.parse(URL));
    var document = html.parse(response.body);

    if (response.statusCode != 404) {
      //Here this variable save the extracted title as a text
      var title = document.head!.querySelector('title')!.text;
    Element? flatpak_image_Element = document.querySelector('img[data-canonical-src="https://flathub.org/assets/badges/flathub-badge-en.png"]');

    String? flatpak_badge_URL = flatpak_image_Element?.attributes['data-canonical-src'] ?? 'flat is not supported';
          
    Element? snap_image_Element = document.querySelector('img[data-canonical-src="https://snapcraft.io/static/images/badges/en/snap-store-black.svg"]');
          
    String? snap_badge_URL = snap_image_Element?.attributes['data-canonical-src'] ?? 'snp is not supported';

    List<Element> flat_snap_badges_extract = document.querySelectorAll('img[data-canonical-src]');

    final flat_snap_Badges = flat_snap_badges_extract
          .map((flat_snap) => flat_snap.attributes['data-canonical-src'])
          .toString()
          .toLowerCase()
          .replaceAll(RegExp(r'[()]'), '');

    String? flatpak_snap_textChecker = document.body!.text.toLowerCase();

    String flatpak_snap_marker = '';
    if (flatpak_snap_textChecker.contains('flatpak')) {
      flatpak_snap_marker = 'flatpak';
    }
    if (flatpak_snap_textChecker.contains('snap')) {
      flatpak_snap_marker = 'snap';
    }
    String releases_URL = "$URL" + "/releases";
    var response2 = await http.get(Uri.parse(releases_URL));
    var Document2 = html.parse(response2.body);
    var release_version_extract = Document2.querySelector('div.css-truncate-target span');
        

    String release_version = "";
    String release_version_ifNULL = "";

    if (release_version_extract != null) {
      release_version =
          Document2.querySelector('div.css-truncate-target span')!
              .text
              .trim();
    } else {
      release_version_ifNULL = "لايحتوي على رقم إصدار في Github.";
    }

    String releases_tag_url = "$releases_URL/expanded_assets/$release_version";

    var response3 = await http.get(Uri.parse(releases_tag_url));
      var Document3 = html.parse(response3.body);
      List<dynamic> project_Releases =
          Document3.querySelectorAll(".Truncate-text.text-bold")
              .map((R_title) => R_title.text)
              .toList();
              project_Releases.add(flat_snap_Badges);
              project_Releases.add(snap_badge_URL);
              project_Releases.add(flatpak_badge_URL);
              project_Releases.add(flatpak_snap_marker);
              

    //Method to bring the name of project author
    String keyword1 = '-';
    String endword1 = '/';
    int keyword_index1 = title.indexOf(keyword1);
    int endword_index1 = title.indexOf(endword1);

    //Method to bring the name of project
    String keyword2 = '/';
    String endword2 = ':';
    final int keyword_index2 = title.indexOf(keyword2) + 1;
    final int endword_index2 = title.indexOf(endword2);

    //Method to extract the description of project
    String keyword3 = ':';
    int keyword_index3 = title.indexOf(keyword3);
    int endword_index3 = title.length;

    //The result of the method's above
    String author_name = title.substring(keyword_index1 + 2, endword_index1);
    String project_Title = title.substring(keyword_index2, endword_index2);
    String project_description = title.substring(keyword_index3 + 1, endword_index3);
        

    Map<String, dynamic> projectInfo = {
      'Ptitle': project_Title,
      'Aname': author_name,
      'Pdescription': project_description,
      'ProjectReleases': project_Releases,
    };

    print(project_Releases);
    print(release_version);
    print(release_version_ifNULL);
    
    return projectInfo;
    } else {
      teleDart.sendMessage(
        message.chat.id,
        'المشروع غير موجود، الرجاء التحقق من الرابط المُدخل',
      );
    }
  }
}
