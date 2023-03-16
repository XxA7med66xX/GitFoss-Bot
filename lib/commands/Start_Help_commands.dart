import 'package:teledart/teledart.dart';
import 'package:teledart/telegram.dart';
import 'package:teledart/model.dart';

class Start_Help_Commands {
  TeleDart teledart;
  final String? BOT_TOKEN;

  Start_Help_Commands({required this.teledart,required this.BOT_TOKEN});
  Start_Help_commands() async {
    

    List<String> commands = ["start", "help"];
    
    teledart.onCommand(commands[0]).listen(
          (Message) => Message.reply(
                  "${Message.from!.firstName} أهلاً بك في البوت التجريبي يا")
              .then(
            (TeleDartMessage) => teledart.sendMessage(
              
              TeleDartMessage.chat.id,
              "هذا هو البوت المساعد الخاص بقناة الالعاب يمكنك الإنضمام إلى القناة من <a href='https://t.me/Pc4Gaming'>هنا</a>",
            parseMode: "HTML"
            ),
          ),
        );
  }
}
