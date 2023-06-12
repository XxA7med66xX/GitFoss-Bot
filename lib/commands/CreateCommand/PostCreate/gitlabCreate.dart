import 'package:teledart/model.dart';
import 'package:teledart/teledart.dart';
import 'package:GitFossBOT/models/URLprocess/URLfetchParseInfo.dart';

class gitlabPost {
  gitlabPost({
    required this.teledart,
    required this.message,
    required this.GitLink,
  });

  TeleDart teledart;
  TeleDartMessage message;
  String GitLink = ''; //The gitlab link that would received from user.

  GitlabPost() async {
    final URLfetchParse = URLfetchParseInfo(
      URL: GitLink,
      teledart: teledart,
      message: message,
    );

    Map<String, dynamic>? ProjectInfo =
        await URLfetchParse.URL_fetchParseInfo();

    if (ProjectInfo != null) {
      String projectTitle = ProjectInfo['Pname'];
      String authorName = ProjectInfo['Aname'];
      String projectDescription = ProjectInfo['Pdescription'];
      String projectVersion = ProjectInfo['Rversion'];

      //Auto sorting of platforms was delayed because can't fetch
      //releases info due to it's protection from gathering info from
      //that section in gitlab.

      await teledart.sendMessage(
        message.chat.id,
        '''
#️⃣ <b>التصنيف</b> : 

🏷 <b>اسم البرنامج</b> : <a href='$GitLink'>$projectTitle</a> 

📄 <b>الوصف</b> : $projectDescription

🔢 <b>اخر إصدار (منذ النشر)</b> : $projectVersion

💻 <b>المنصات المدعومة</b> : لينكس | ويندوز | ماك

👤 <b>المطور</b> : $authorName
            ㅤ
            ''',
        parseMode: 'html',
      );
    }
  }
}
