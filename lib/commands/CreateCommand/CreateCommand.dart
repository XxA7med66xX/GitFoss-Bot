import 'package:GitFossBOT/Localization/AllStrings.dart';
import 'package:GitFossBOT/commands/CreateCommand/PostCreate/githubCreate/githubCreate.dart';
import 'package:GitFossBOT/commands/CreateCommand/PostCreate/gitlabCreate/gitlabCreate.dart';
import 'package:GitFossBOT/commands/CreateCommand/utils/linkFormatter.dart';
import 'package:GitFossBOT/commands/CreateCommand/utils/unsupportedMSG.dart';
import 'package:GitFossBOT/models/URLprocess/UrlErrorMsg.dart';
import 'package:teledart/model.dart';
import 'package:teledart/teledart.dart';

class createCommand {
  createCommand({
    required this.teledart,
    this.GitLink = "",
  });
  
  final TeleDart teledart;
  Message? message;
  String GitLink; //The github link that would received from user.
  static const List<String> defaultURLs = ['github.com', 'gitlab'];
  bool isCreating = false;
  bool iscontaining = false;
  bool isreceived = false;
  //This function used to set /create command on the bot.

  CreateCommand() {
    teledart.onCommand('create').listen(
      (message) async {
        isCreating = true;
        iscontaining = false;
        isreceived = false;
        await teledart.sendMessage(
          message.chat.id,
          Allstrings().CreateMSG,
        );
        print('iscontaining = $iscontaining');
        print('isrecieved = $isreceived');
      },
    );
  }

  SaveUserInput() async {

    teledart.onMessage(entityType: 'url').listen(
      (message) async {

        if (!isCreating) return;
        
        final String Text = message.text!;
        
        for (String defaultURL in defaultURLs) {
          if (Text.contains(defaultURL)) {
            iscontaining = true;
            GitLink = LinkFormatter().formatGitLink(message.text!) ?? 'BadLink';

            if (GitLink.contains('BadLink')) {
              UrlErrorMsg(teleDart: teledart, message: message).ErrorMsg();
            }
          }
        }

        switch (defaultURLs.indexWhere((defaultURL) => GitLink.contains(defaultURL))) {
          case 0:
            final GithubCreate = githubPost(gitLink: GitLink, teleDart: teledart, message: message,isreceived: isreceived);

            isCreating=false;
            
            if(iscontaining){
              return GithubCreate.Githubpost();
            } else {
              UnsupportedMSG(teledart: teledart, message: message).msg();
            }

            break;

          case 1:
            final GitlabCreate = gitlabPost(teledart: teledart, message: message, GitLink: GitLink);

            isCreating = false;
            
            if (iscontaining) {
              return GitlabCreate.GitlabPost();
            } else {
              UnsupportedMSG(teledart: teledart, message: message).msg();
            }

            break;

          default:
            if (!iscontaining) {
              UnsupportedMSG(teledart: teledart, message: message).msg();
            }  
        }
      },
    );
  }
}
