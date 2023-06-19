import 'package:GitFossBOT/commands/CreateCommand/PostCreate/githubCreate/utils/getProjectDetails.dart';
import 'package:teledart/model.dart';
import 'package:teledart/teledart.dart';

class githubPost {

  githubPost({this.gitLink = '', required this.teleDart, required this.message});

  String gitLink;
  TeleDart teleDart;
  TeleDartMessage message;
  bool isAppImage = false;
  bool isGnome_extention = false;
  bool isFlatpak = false;
  bool isSnap = false;
  
  Githubpost() async {

    final ProjectDetails = getProjectDetails(gitLink: gitLink, teleDart: teleDart, message: message);
    await ProjectDetails.ProjectDetails();

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
          if (ProjectDetails.Project_Releases.any((releaseTitle) => releaseTitle.contains(extension))) {
            isSupported = true;
            if (extension.contains('AppImage') &&
                extension.contains('flathub')) {
              isAppImage = true;
              isFlatpak = true;
            } else if (extension.contains('AppImage')) {
              isAppImage = true;
            } else if (extension.contains('gnome-shell-extension')) {
              isGnome_extention = true;
            } else if (extension.contains('@')) {
              isGnome_extention = true;
            } else if (extension.contains('flathub')) {
              isFlatpak = true;
            } else if (extension.contains('flatpak')) {
              isFlatpak = true;
            } else if (extension.contains('snap')) {
              isSnap = true;
            } else if (extension.contains('snapcraft')) {
              isSnap = true;
            }
          }
        }
        if (isSupported) {
          supportedPlatforms.add(platform['name']);
        }
      }

      List<String> categorys = [];
      if (isAppImage) {
        categorys.add('#تطبيقات_محمولة');
      }
      if (isGnome_extention) {
        categorys.add('#إضافات_جنوم');
      }
      if (isFlatpak) {
        categorys.add('#تطبيقات_فلاتباك');
      }
      if (isSnap) {
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

💻 <b>المنصات المدعومة</b> : ${supportedPlatforms.join(' | ')}

👤 <b>المطور</b> : ${ProjectDetails.Author_name}
ㅤ
          ''',
          parseMode: 'html'
        );
    }
  }

