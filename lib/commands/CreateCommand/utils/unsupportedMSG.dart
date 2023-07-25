import 'package:GitFossBOT/Localization/AllStrings.dart';
import 'package:teledart/model.dart';
import 'package:teledart/teledart.dart';

class UnsupportedMSG {

  UnsupportedMSG({required this.teledart, required this.message});

  TeleDart teledart;
  TeleDartMessage message;

  msg() async {

    await teledart.sendMessage(
      message.chat.id,
      Allstrings().UnsupportedLink,
    );
    
  }
  
}
