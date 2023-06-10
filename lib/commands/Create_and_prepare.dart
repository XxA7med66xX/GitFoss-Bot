import 'package:teledart/teledart.dart';
import 'package:GitFossBOT/models/URLprocess/HttpFetchURLInfo.dart';

class create_and_prepare {
  create_and_prepare({
    required this.teledart,
    this.GitLink = "",
  });

  //Assigned variables
  final TeleDart teledart;
  String GitLink; //The github link that would received from user.
  String Project_title = '';
  String Author_name = '';
  String Project_description = '';

  //This function used to set /create command on the bot.
  CreateCommand() {
    teledart.onCommand('create').listen(
      (message) async {
        await teledart.sendMessage(message.chat.id, 'Send github link : ');
      },
    );
  }

  SaveUserInput() async {
    teledart.onMessage(entityType: 'url').listen(
      (message) async {
        //This variable will saving the url that user entered.
        GitLink = message.text!;

        //This will give httpfetchURL function the url to parse it.
        final httpFetchURLInfo = HttpFetchURL(URL: GitLink, teledart: teledart);

        //Here we using map to handle variables, because there's more then 1 variable returned from Httpfetch function.
        Map<String, dynamic> StringX = await httpFetchURLInfo.URLfetch_InfoParse();
        Author_name = StringX['Aname'];
        Project_title = StringX['Ptitle'];
        Project_description = StringX['Pdescription'];
        
        // This function sends the final result (the post) to the user after they enter the URL.
        await teledart.sendMessage(
          message.chat.id,
          '''
          #️⃣ <b>التصنيف</b> : #تطبيقات_محمولة

🏷 <b>اسم البرنامج</b> : <a href='$GitLink'>$Project_title</a> 

📄 <b>الوصف</b> : $Project_description

💻 <b>المنصات المدعومة</b> : لينكس | ويندوز | ماك

👤 <b>المطور</b> : $Author_name
ㅤ
          ''',
          parseMode: 'html'
        );
      },
    );
  }
}
