import 'package:GitFossBOT/commands/CreateCommand/PostCreate/gitlabCreate/utils/GlabgetProjectDetails.dart';
import 'package:teledart/model.dart';
import 'package:teledart/teledart.dart';

class gitlabPost {

  gitlabPost({
    required this.teledart,
    required this.message,
    required this.GitLink,
  });

  final TeleDart teledart;
  final TeleDartMessage message;
  String GitLink = ''; //The gitlab link that would received from user.

  GitlabPost() async {
    
    final ProjectDetails = GlabGetProjectDetails(teledart: teledart, message: message, GitLink: GitLink);
    await ProjectDetails.ProjectDetails();

      //Auto sorting of platforms was delayed because can't fetch
      //releases info due to it's protection from gathering info from
      //that section in gitlab.

    if (ProjectDetails.isreceived) {

      await teledart.sendMessage(
        message.chat.id,
        '''
#️⃣ <b>التصنيف</b> : 

🏷 <b>اسم البرنامج</b> : <a href='$GitLink'>${ProjectDetails.projectTitle}</a> 

📄 <b>الوصف</b> : ${ProjectDetails.projectDescription}

🔢 <b>اخر إصدار (منذ النشر)</b> : ${ProjectDetails.projectVersion}

💻 <b>المنصات المدعومة</b> : لينكس | ويندوز | ماك

👤 <b>المطور</b> : ${ProjectDetails.authorName}
            ㅤ
            ''',
        parseMode: 'html',
      );
    }
  }
}
