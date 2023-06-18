import 'package:GitFossBOT/models/PrepareInfo/githubPrepare/utils/GithubSubStrings.dart';
import 'package:GitFossBOT/models/PrepareInfo/githubPrepare/utils/getProjectReleases.dart';
import 'package:GitFossBOT/models/PrepareInfo/githubPrepare/utils/getReleaseVersion.dart';
import 'package:GitFossBOT/models/PrepareInfo/githubPrepare/utils/getTitle.dart';
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

    final String releases_URL = "$URL" + "/releases";

    final response2 = await http.get(Uri.parse(releases_URL));
    final document2 = html.parse(response2.body);

    final String? releaseVersion = getReleaseVersion().releaseVersion(document2);

    final String releases_tag_url = "$releases_URL/expanded_assets/$releaseVersion";

    final response3 = await http.get(Uri.parse(releases_tag_url));
    final document3 = html.parse(response3.body);
    
    final String title = getTitle().Title(document);
    final String author_name = Github_subStrings().AuthorName(title);
    final String project_Title = Github_subStrings().ProjectName(title);
    final String project_description = Github_subStrings().ProjectDescription(title);
    final List<dynamic> project_Releases = getProjectReleases().ProjectReleases(document, document3);

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
