import 'package:GitFossBOT/Localization/AllStrings.dart';
import 'package:teledart/model.dart';
import 'package:teledart/teledart.dart';

class WaitMessage {

  WaitMessage({required this.teleDart, required this.message, required this.Msg});

  final TeleDart teleDart;
  final TeleDartMessage message;
  Message Msg;

  Future<void> msg() async {
    
    Msg = await teleDart.sendMessage(message.chat.id, Allstrings().WaitMSG);
  }

  Future<void> delMsg() async {
    
    await teleDart.deleteMessage(message.chat.id, Msg.messageId);

  }

}
