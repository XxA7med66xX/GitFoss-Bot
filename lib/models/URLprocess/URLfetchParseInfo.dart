import 'package:GitFossBOT/models/PrepareInfo/githubPrepare/githubPerpare.dart';
import 'package:GitFossBOT/models/PrepareInfo/gitlabPrepare/gitlabPrepare.dart';
import 'package:GitFossBOT/models/PrepareInfo/utils/WaitMessage.dart';
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
        final WaitMsg = WaitMessage(teleDart: teledart, message: message, Msg: message);
        dynamic ghub;

        await WaitMsg.msg()
              .then(((ghubInstance) async => ghub = await githubPrepare.githubPrepare()))
              .then((delMsg) async => await WaitMsg.delMsg());

        return Future.value(ghub);

      case 1:
        final gitlabPrepare = gitlabInfoPerpare(URL: URL, teledart: teledart, message: message);
        final WaitMsg = WaitMessage(teleDart: teledart, message: message, Msg: message);
        dynamic glab;

        await WaitMsg.msg()
            .then((glabInstance) async => glab = await gitlabPrepare.gitlabPrepare())
            .then((delMsg) async => WaitMsg.delMsg());

        return Future.value(glab);  
    }
  }
}
