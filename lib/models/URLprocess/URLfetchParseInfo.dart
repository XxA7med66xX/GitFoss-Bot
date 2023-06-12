import 'package:GitFossBOT/models/PrepareInfo/githubPerpare.dart';
import 'package:GitFossBOT/models/PrepareInfo/gitlabPrepare.dart';
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
  static const List<String> defaultURLs = ['github.com','gitlab'];

  URL_fetchParseInfo() async {

    switch (defaultURLs.indexWhere((defaultURL) => URL.contains(defaultURL))) {
      case 0:
        final githubPrepare = githubInfoPerpare(URL: URL, teleDart: teledart, message: message,);
        return githubPrepare.githubPrepare();

      case 1:
        final gitlabPrepare = gitlabInfoPerpare(URL: URL, teledart: teledart, message: message);
        return gitlabPrepare.gitlabPrepare();  
    }
  }
}
