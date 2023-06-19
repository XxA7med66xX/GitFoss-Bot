import 'package:GitFossBOT/commands/CreateCommand/PostCreate/githubCreate/utils/getProjectDetails.dart';
import 'package:GitFossBOT/commands/CreateCommand/PostCreate/githubCreate/utils/platforms_AutoSort.dart';
import 'package:teledart/model.dart';
import 'package:teledart/teledart.dart';

class githubPost {

  githubPost({this.gitLink = '', required this.teleDart, required this.message});

  String gitLink;
  TeleDart teleDart;
  TeleDartMessage message;
  
  Githubpost() async {

    final ProjectDetails = getProjectDetails(gitLink: gitLink, teleDart: teleDart, message: message);
    await ProjectDetails.ProjectDetails();

    final PlatformAutoSort = PlatformsAutoSort(ProjectReleases: ProjectDetails.Project_Releases);
    PlatformAutoSort.AutoSort();

      List<String> categorys = [];
      if (PlatformAutoSort.isAppImage) {
        categorys.add('#تطبيقات_محمولة');
      }
      if (PlatformAutoSort.isGnome_extention) {
        categorys.add('#إضافات_جنوم');
      }
      if (PlatformAutoSort.isFlatpak) {
        categorys.add('#تطبيقات_فلاتباك');
      }
      if (PlatformAutoSort.isSnap) {
        categorys.add('#تطبيقات_سناب');
      }
      print(ProjectDetails.Project_title);

    await teleDart.sendMessage(
          message.chat.id,
          '''
          #️⃣ <b>التصنيف</b> : ${categorys.join(' | ')}

🏷 <b>اسم البرنامج</b> : <a href='$gitLink'>${ProjectDetails.Project_title}</a> 

📄 <b>الوصف</b> : ${ProjectDetails.Project_description}

🔢 <b>اخر إصدار (منذ النشر)</b> : ${ProjectDetails.Release_version}

💻 <b>المنصات المدعومة</b> : ${PlatformAutoSort.AutoSort().join(' | ')}

👤 <b>المطور</b> : ${ProjectDetails.Author_name}
ㅤ
          ''',
          parseMode: 'html'
        );
    }
  }

