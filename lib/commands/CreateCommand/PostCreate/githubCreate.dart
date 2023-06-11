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
      message: message
    );

    Map<String, dynamic>? projectInfo = await URLfetchParse.URL_fetchParseInfo();

    if(projectInfo != null){
      String Author_name = projectInfo['Aname'];
    String Project_title = projectInfo['Ptitle'];
    String Project_description = projectInfo['Pdescription'];
    List<String> project_Releases = projectInfo['ProjectReleases'];

    List<String> supportedPlatforms = [];
    
    List<Map<String, dynamic>> platforms = [
        {
          'name': 'لينكس',
          'extensions': [
            'AppImage',
            'rpm',
            'pacman',
            'Ubuntu',
            'deb',
            'linux',
            '@',
            'gnome-shell-extension',
            'flathub',
            'flatpak',
            'snap',
            'snapcraft',
            'bin',
            'wine',
          ]
        },
        {
          'name': 'ويندوز',
          'extensions': [
            'exe',
            'msi',
            'cmd',
            'bat',
            'windows',
            'win64',
            'appx',
            'msix'
          ]
        },
        {
          'name': 'ماك',
          'extensions': ['dmg', 'macos', 'mac', 'apple', 'darwin', 'bin']
        }
      ];

      for (Map<String, dynamic> platform in platforms) {
        bool isSupported = false;
        for (String extension in platform['extensions']) {
          if (project_Releases
              .any((releaseTitle) => releaseTitle.contains(extension))) {
            isSupported = true;
          }
        }
        if (isSupported) {
          supportedPlatforms.add(platform['name']);
        }
      }
    await teleDart.sendMessage(
          message.chat.id,
          '''
          #️⃣ <b>التصنيف</b> : #تطبيقات_محمولة

🏷 <b>اسم البرنامج</b> : <a href='$gitLink'>$Project_title</a> 

📄 <b>الوصف</b> : $Project_description

💻 <b>المنصات المدعومة</b> : ${supportedPlatforms.join(' | ')}

👤 <b>المطور</b> : $Author_name
ㅤ
          ''',
          parseMode: 'html'
        );
    }
  }
}
