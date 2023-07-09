import 'package:GitFossBOT/commands/CreateCommand/PostCreate/githubCreate/utils/Categorys.dart';
import 'package:GitFossBOT/commands/CreateCommand/PostCreate/githubCreate/utils/getProjectDetails.dart';
import 'package:GitFossBOT/commands/CreateCommand/PostCreate/githubCreate/utils/platforms_AutoSort.dart';
import 'package:teledart/model.dart';
import 'package:teledart/teledart.dart';

class githubPost {

  githubPost({this.gitLink = '', required this.teleDart, required this.message,required this.isreceived});

  final String gitLink;
  final TeleDart teleDart;
  final TeleDartMessage message;
  bool isreceived;
  
  Githubpost() async {

    final ProjectDetails = getProjectDetails(gitLink: gitLink, teleDart: teleDart, message: message,isreceived: isreceived);
    await ProjectDetails.ProjectDetails();

    final PlatformAutoSort = PlatformsAutoSort(ProjectReleases: ProjectDetails.Project_Releases);
    PlatformAutoSort.AutoSort();
    
    final _Categorys = Categorys(ProjectReleases: ProjectDetails.Project_Releases);
    _Categorys.category();  
      print(ProjectDetails.Project_title);

    if (ProjectDetails.isreceived) {

      await teleDart.sendMessage(
          message.chat.id,
          '''
          #️⃣ <b>التصنيف</b> : ${_Categorys.categorys.join(' | ')}

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
}

