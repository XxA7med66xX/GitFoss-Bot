import 'package:teledart/model.dart';
import 'package:teledart/teledart.dart';
import 'package:GitFossBOT/models/URLprocess/URLfetchParseInfo.dart';

class githubPost {

  githubPost({this.gitLink = '', required this.teleDart, required this.message});

  String gitLink;
  TeleDart teleDart;
  TeleDartMessage message;

  Githubpost() async {

    final URLfetchParse = URLfetchParseInfo(
      teledart: teleDart,
      URL: gitLink,
    );

    Map<String, dynamic>projectInfo = await URLfetchParse.URL_fetchParseInfo();

    String Author_name = projectInfo['Aname'];
    String Project_title = projectInfo['Ptitle'];
    String Project_description = projectInfo['Pdescription'];

    await teleDart.sendMessage(
          message.chat.id,
          '''
          #️⃣ <b>التصنيف</b> : #تطبيقات_محمولة

🏷 <b>اسم البرنامج</b> : <a href='$gitLink'>$Project_title</a> 

📄 <b>الوصف</b> : $Project_description

💻 <b>المنصات المدعومة</b> : لينكس | ويندوز | ماك

👤 <b>المطور</b> : $Author_name
ㅤ
          ''',
          parseMode: 'html'
        );
  }
}
