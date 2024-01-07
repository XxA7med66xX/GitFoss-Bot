import 'package:GitFossBOT/Operations/userInputProcess/PostCreate/githubCreate/githubCreate.dart';
import 'package:GitFossBOT/Operations/userInputProcess/PostCreate/gitlabCreate/gitlabCreate.dart';
import 'package:GitFossBOT/Operations/userInputProcess/utils/link_formatter.dart';
import 'package:GitFossBOT/Operations/userInputProcess/utils/unsupportedMSG.dart';
import 'package:GitFossBOT/models/URLprocess/UrlErrorMsg.dart';
import 'package:teledart/model.dart';
import 'package:teledart/teledart.dart';

class userInputProcess {
  userInputProcess({
    required this.teledart,
    this.GitLink = "",
  });
  
  final TeleDart teledart;
  Message? message;
  String GitLink; //The github link that would received from user.
  static const List<String> defaultURLs = ['github.com', 'gitlab'];
  bool iscontaining = false;
  bool isreceived = false;

  SaveUserInput() async {

    teledart.onMessage(entityType: 'url').listen(
      (message) async {

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

            if(iscontaining){
              return GithubCreate.Githubpost();
            } else {
              UnsupportedMSG(teledart: teledart, message: message).msg();
            }

            break;

          case 1:
            final GitlabCreate = gitlabPost(teledart: teledart, message: message, GitLink: GitLink);

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
