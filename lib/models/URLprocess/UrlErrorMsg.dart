import 'package:GitFossBOT/Localization/AllStrings.dart';
import 'package:teledart/model.dart';
import 'package:teledart/teledart.dart';

class UrlErrorMsg {

  TeleDart teleDart;
  TeleDartMessage message;

  UrlErrorMsg({
    required this.teleDart,
    required this.message,
  });
  
  ErrorMsg() async {
    return teleDart.sendMessage(
      message.chat.id,
      Allstrings().UrlErrorMsg,
    );
  }
  
}
