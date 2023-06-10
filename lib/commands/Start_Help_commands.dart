import 'package:teledart/teledart.dart';

class Start_Help_Commands {

  TeleDart teledart;
  final String? BOT_TOKEN;
  List<String> commands = ["start", "help"];

  Start_Help_Commands({required this.teledart, required this.BOT_TOKEN});

  Start_Help_commands() async {

    teledart.onCommand(commands[0]).listen(
          (Message) => Message.reply(
            "${Message.from!.firstName} أهلاً بك في البوت التجريبي يا",
          ).then(
            (TeleDartMessage) => teledart.sendMessage(Message.chat.id,
                "هذا هو البوت المساعد الخاص بقناة الالعاب يمكنك الإنضمام إلى القناة من <a href='https://t.me/Pc4Gaming'>هنا</a>",
                parseMode: 'html'),
          ),
        );
  }
}              
          
        
 

