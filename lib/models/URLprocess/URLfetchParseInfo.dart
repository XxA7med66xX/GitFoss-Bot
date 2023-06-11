import 'package:GitFossBOT/models/PrepareInfo/githubPerpare.dart';
import 'package:teledart/model.dart';
import 'package:teledart/teledart.dart';

class URLfetchParseInfo {
  URLfetchParseInfo({
    this.URL = "",
    required this.teledart,
    required this.message,
  });

  //Assigned variables
  String URL;
  TeleDart teledart;
  TeleDartMessage message;
  static const List<String> defaultURLs = ['github.com'];

  URL_fetchParseInfo() async {

    switch (defaultURLs.indexWhere((defaultURL) => URL.contains(defaultURL))) {
      case 0:
        final githubPrepare = githubInfoPerpare(URL: URL, teleDart: teledart, message: message,);
        return githubPrepare.githubPrepare();
    }
  }
}
