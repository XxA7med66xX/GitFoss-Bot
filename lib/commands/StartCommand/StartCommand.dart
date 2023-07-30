import 'package:GitFossBOT/Localization/AllStrings.dart';
import 'package:GitFossBOT/commands/LangCommand/LangCommand.dart';
import 'package:teledart/teledart.dart';

class StartCommand {

  TeleDart teledart;
  List<String> commands = ["start", "help"];

  StartCommand({required this.teledart});

  Startcommand() async {

    teledart.onCommand(commands[0]).listen(
      (message) async {
        await LangCommand(teledart: teledart).showLanguageChooser(message);
      },
    );

    teledart.onCallbackQuery().listen(
      (Callback) async {

        await Future.delayed(Duration(milliseconds: 30));

        switch (Callback.data) {

          case null:

          default:
            teledart.sendMessage(
                  Callback.message!.chat.id,
                  "${Allstrings().WellcomeMSG} ­ ${Callback.from.firstName}",
                )
                .then(
                  (message) => teledart.sendMessage(
                    message.chat.id,
                    Allstrings().DescriptionMSG,
                  ),
                );
        }
      },
    );
  }
}              
          
        
 

