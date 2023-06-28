import 'package:GitFossBOT/models/PrepareInfo/githubPrepare/utils/GhubGetProjectInfo.dart';
import 'package:GitFossBOT/models/PrepareInfo/githubPrepare/utils/getReleaseVersion.dart';
import 'package:GitFossBOT/models/URLprocess/UrlErrorMsg.dart';
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
    
    final Map<String,dynamic> AllProjectInfo = GhubGetProjectInfo().AllprojectInfo(document, document3, releaseVersion);

    return AllProjectInfo;
    
    } else {
      UrlErrorMsg(teleDart: teleDart, message: message).ErrorMsg();
    }
  }
}
