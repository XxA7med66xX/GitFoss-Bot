import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as html;
import 'package:teledart/model.dart';
import 'package:teledart/teledart.dart';

class gitlabInfoPerpare {

  String URL = "";
  TeleDart teledart;
  TeleDartMessage message;
  
  gitlabInfoPerpare({
    required this.URL,
    required this.teledart,
    required this.message,
  });

  gitlabPrepare() async {

    var response = await http.get(Uri.parse(URL));
    var document = await html.parse(response.body);

    if(response.statusCode != 403){
    String gtitle = document.head!.querySelector('title')!.text;

    String keyword20 = '/';
    String endword20 = '·';
    int keyword20_index = gtitle.indexOf(keyword20);
    int endword20_index = gtitle.indexOf(endword20);

    String gitlab_title = gtitle.substring(keyword20_index + 1, endword20_index).trim();
        
    String gitlab_author = gtitle.substring(0, keyword20_index).trim();

    String? gitlab_description = document.querySelector('div.home-panel-description-markdown p')?.text ??'لم يضع المطور وصفاً للمشروع';
            
    String gitlab_tags_URL = '${URL + '/-/tags'}';

    var response2 = await http.get(Uri.parse(gitlab_tags_URL));
    var document2 = await html.parse(response2.body);

    String gitlab_release_version = document2.querySelector('.item-title')!.text.trim();
        

    //## The automated platform sorting was delayed becuase it's hard to extract texts of releases section
    //due to it's protection by graphql, i will retry later to fix it.

    // String gitlab_releases_URL = '${URL + '/-/releases/$gitlab_release_version'}';
    // var response22 = await http.get(Uri.parse(gitlab_releases_URL));
    // var document22 = await html.parse(response22.body);
    // var glab_release_titles = document22.querySelector('a')?.text??'لايحتوي هذا المشروع على إصدارات مبنية';

    Map<String, dynamic> gitlabProjectInfo = {
      'Pname': gitlab_title,
      'Aname': gitlab_author,
      'Pdescription': gitlab_description,
      'Rversion': gitlab_release_version,
    };

    return gitlabProjectInfo;
    } else {
      teledart.sendMessage(
        message.chat.id,
        'المشروع غير موجود، الرجاء التحقق من الرابط المُدخل',
      );
    }
  }
}
