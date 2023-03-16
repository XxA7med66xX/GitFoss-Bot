import 'package:html/parser.dart' as html;
import 'package:http/http.dart' as http;

class HttpFetchURL {

  URLfetch_InfoParse() async {

    var URL = "https://github.com/ahkarami/Deep-Learning-in-Production";

    var response = await http.get(Uri.parse(URL));

    var Document = html.parse(response.body);

    var title = Document.head!.querySelector('title')!.text;

    String keyword = '/';
    String Endword = ':';
    final int keywordIndex = title.indexOf(keyword) + 1;
    final int endkeywordIndex = title.indexOf(Endword);
    String substring = title.substring(keywordIndex, endkeywordIndex);
    print(substring);

  }

}