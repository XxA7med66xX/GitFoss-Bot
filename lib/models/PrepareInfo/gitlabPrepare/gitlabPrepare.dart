import 'package:GitFossBOT/models/PrepareInfo/gitlabPrepare/utils/GlabGetProjectInfo.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as html;
import 'package:teledart/model.dart';
import 'package:teledart/teledart.dart';

class gitlabInfoPerpare {

  String URL = "";
  final TeleDart teledart;
  final TeleDartMessage message;
  
  gitlabInfoPerpare({
    required this.URL,
    required this.teledart,
    required this.message,
  });

  gitlabPrepare() async {

    var response = await http.get(Uri.parse(URL));
    var document = await html.parse(response.body);

    if(response.statusCode != 403){
    
    String gitlab_tags_URL = '${URL + '/-/tags'}';

    var response2 = await http.get(Uri.parse(gitlab_tags_URL));
    var document2 = await html.parse(response2.body);

    //## The automated platform sorting was delayed becuase it's hard to extract texts of releases section
    //due to it's protection by graphql, i will retry later to fix it.

    // String gitlab_releases_URL = '${URL + '/-/releases/$gitlab_release_version'}';
    // var response22 = await http.get(Uri.parse(gitlab_releases_URL));
    // var document22 = await html.parse(response22.body);
    // var glab_release_titles = document22.querySelector('a')?.text??'لايحتوي هذا المشروع على إصدارات مبنية';

    final Map<String, dynamic> gitlabProjectInfo = GlabGetProjectInfo().AllProjectInfo(document, document2);

    return gitlabProjectInfo;
    
    } else {
      teledart.sendMessage(
        message.chat.id,
        'المشروع غير موجود، الرجاء التحقق من الرابط المُدخل',
      );
    }
  }
}
