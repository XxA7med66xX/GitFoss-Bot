import 'package:GitFossBOT/models/PrepareInfo/githubPerpare.dart';
import 'package:teledart/teledart.dart';

class URLfetchParseInfo {
  URLfetchParseInfo({this.URL="", required this.teledart});

  //Assigned variables
  String URL;
  TeleDart teledart;
  static const List<String> defaultURLs = ['github.com'];

  URL_fetchParseInfo() async {

    switch (defaultURLs.indexWhere((defaultURL) => URL.contains(defaultURL))) {
      case 0:
        final githubPrepare = githubInfoPerpare(URL: URL);
        return githubPrepare.githubPrepare();
    }
  }
}
