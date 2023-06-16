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
    
    final response = await http.get(Uri.parse(URL));
    final document = html.parse(response.body);

    if (response.statusCode != 404) {

    final String title = document.head!.querySelector('title')!.text;

    final Element? flatpak_image_Element = await document.querySelector('img[data-canonical-src="https://flathub.org/assets/badges/flathub-badge-en.png"]');

    final String? flatpak_badge_URL = flatpak_image_Element?.attributes['data-canonical-src'] ?? 'flat is not supported';
          
    final Element? snap_image_Element = await document.querySelector('img[data-canonical-src="https://snapcraft.io/static/images/badges/en/snap-store-black.svg"]');
          
    final String? snap_badge_URL = snap_image_Element?.attributes['data-canonical-src'] ?? 'snp is not supported';

    final String flat_snap_Badges = document.querySelectorAll('img[data-canonical-src]')
          .map((flat_snap) => flat_snap.attributes['data-canonical-src'])
          .toString()
          .toLowerCase();

    String? flatpak_snapTextChecker = document.body!.text.toLowerCase();

    String flatpakMarker = '';
    String snapMarker = '';
    
    if (flatpak_snapTextChecker.contains('flatpak')) {
      flatpakMarker = 'flatpak';
    }
    if (flatpak_snapTextChecker.contains('snap')) {
      snapMarker = 'snap';
    }

    final String releases_URL = "$URL" + "/releases";

    final response2 = await http.get(Uri.parse(releases_URL));
    final document2 = html.parse(response2.body);

    final String? releaseVersion = document2.querySelector('div.css-truncate-target span')?.text.trim() ?? 'لايحتوي على رقم إصدار في Github.';

    final String releases_tag_url = "$releases_URL/expanded_assets/$releaseVersion";

    final response3 = await http.get(Uri.parse(releases_tag_url));
    final document3 = html.parse(response3.body);

    final List<dynamic> project_Releases =
          document3.querySelectorAll(".Truncate-text.text-bold")
              .map((R_title) => R_title.text)
              .toList();
              project_Releases.add(flat_snap_Badges);
              project_Releases.add(snap_badge_URL);
              project_Releases.add(flatpak_badge_URL);
              project_Releases.add(flatpakMarker);
              project_Releases.add(snapMarker);
      

    //Method to bring the name of project author
    const String keyword1 = '-';
    const String endword1 = '/';
    final int keyword_index1 = title.indexOf(keyword1);
    final int endword_index1 = title.indexOf(endword1);

    //Method to bring the name of project
    const String keyword2 = '/';
    const String endword2 = ':';
    final int keyword_index2 = title.indexOf(keyword2) + 1;
    final int endword_index2 = title.indexOf(endword2);

    //Method to extract the description of project
    const String keyword3 = ':';
    final int keyword_index3 = title.indexOf(keyword3);
    final int endword_index3 = title.length;

    //The result of the method's above
    final String author_name = title.substring(keyword_index1 + 2, endword_index1);
    final String project_Title = title.substring(keyword_index2, endword_index2);
    final String project_description = title.substring(keyword_index3 + 1, endword_index3);
        

    final Map<String, dynamic> projectInfo = {
      'Ptitle': project_Title,
      'Aname': author_name,
      'Pdescription': project_description,
      'ProjectReleases': project_Releases,
      'Rversion' : releaseVersion,
    };

    print(project_Releases);
    print(releaseVersion);
    return projectInfo;
    
    } else {
      teleDart.sendMessage(
        message.chat.id,
        'المشروع غير موجود، الرجاء التحقق من الرابط المُدخل',
      );
    }
  }
}
