import 'package:GitFossBOT/models/PrepareInfo/githubPrepare/flat_snap_selectors.dart';
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

    String? flatpak_badge_URL = FlatSnapSelectors().flatpakSelector(document);
          
    final String? snap_badge_URL = FlatSnapSelectors().snapSelector(document);

    final String? flat_snap_Badges = FlatSnapSelectors().flatpakSelector2(document);

    final String? flatpakMarker = FlatSnapSelectors().flatpakselector3(document);
    
    final String? snapMarker = FlatSnapSelectors().snapSelector2(document);

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
