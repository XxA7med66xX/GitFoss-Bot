import 'package:GitFossBOT/commands/CreateCommand/PostCreate/githubCreate.dart';
import 'package:GitFossBOT/commands/CreateCommand/PostCreate/gitlabCreate.dart';
import 'package:teledart/teledart.dart';

class createCommand {
  createCommand({
    required this.teledart,
    this.GitLink = "",
  });
  
  final TeleDart teledart;
  String GitLink; //The github link that would received from user.
  String Project_title = '';
  String Author_name = '';
  String Project_description = '';
  static const List<String> defaultURLs = ['github.com', 'gitlab'];
  bool isCreating = false;
  
  //This function used to set /create command on the bot.
  CreateCommand() {
    teledart.onCommand('create').listen(
      (message) async {
        isCreating = true;
        await teledart.sendMessage(
          message.chat.id,
          'الرجاء إرسال رابط لمشروع على Github أو Gitlab',
        );
      },
    );
  }

  SaveUserInput() async {
    teledart.onMessage(entityType: 'url').listen(
      (message) async {
        if (!isCreating) return;
        
        GitLink = message.text!;
        
        switch (defaultURLs.indexWhere((defaultURL) => GitLink.contains(defaultURL))) {
          case 0:
            final GithubCreate = githubPost(gitLink: GitLink, teleDart: teledart, message: message);
            return GithubCreate.Githubpost();

          case 1:
            final GitlabCreate = gitlabPost(teledart: teledart, message: message, GitLink: GitLink);
            return GitlabCreate.GitlabPost();

          default:
            await teledart.sendMessage(
              message.chat.id,
              'رابط غير مدعوم، الرجاء إرسال رابط لمشروع على Github أو Gitlab',
            );
        }
      },
    );
  }
}
