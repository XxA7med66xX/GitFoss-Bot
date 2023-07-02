import 'package:GitFossBOT/models/URLprocess/URLfetchParseInfo.dart';
import 'package:teledart/model.dart';
import 'package:teledart/teledart.dart';

class GlabGetProjectDetails {

  GlabGetProjectDetails({
    required this.teledart,
    required this.message,
    this.GitLink = '',
  });

  String GitLink;
  TeleDart teledart;
  TeleDartMessage message;
  String projectTitle = '';
  String authorName = '';
  String projectDescription = '';
  String projectVersion = '';
  bool isreceived = false;

  ProjectDetails() async {

    final URLfetchParse = URLfetchParseInfo(
      URL: GitLink,
      teledart: teledart,
      message: message,
    );

    Map<String, dynamic>? ProjectInfo = await URLfetchParse.URL_fetchParseInfo();

    if (ProjectInfo != null) {
      projectTitle = ProjectInfo['Pname'];
      authorName = ProjectInfo['Aname'];
      projectDescription = ProjectInfo['Pdescription'];
      projectVersion = ProjectInfo['Rversion'];
      isreceived = true;
    }
  }
}
