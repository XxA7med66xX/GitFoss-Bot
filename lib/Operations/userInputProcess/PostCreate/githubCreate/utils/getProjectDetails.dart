import 'package:GitFossBOT/models/URLprocess/URLfetchParseInfo.dart';
import 'package:teledart/model.dart';
import 'package:teledart/teledart.dart';

class getProjectDetails {

  String Author_name = '';
  String Project_title = '';
  String Project_description = '';
  String Release_version = '';
  List<InputMediaPhoto> preveiwImages = [];
  List<String> preveiwGifs = [];
  List<dynamic> Project_Releases = [];
  String gitLink;
  TeleDart teleDart;
  TeleDartMessage message;
  bool isreceived;
  getProjectDetails({
    this.gitLink = '',
    required this.teleDart,
    required this.message,
    required this.isreceived
  });

  ProjectDetails() async {
    
    final URLfetchParse = URLfetchParseInfo(
      teledart: teleDart,
      URL: gitLink,
      message: message,
    );

    Map<String, dynamic>? projectInfo = await URLfetchParse.URL_fetchParseInfo();

    if (projectInfo != null) {
      Author_name = projectInfo['Aname'];
      Project_title = projectInfo['Ptitle'];
      Project_description = projectInfo['Pdescription'];
      Project_Releases = projectInfo['ProjectReleases'];
      Release_version = projectInfo['Rversion'];
      preveiwImages = projectInfo['Images'];
      preveiwGifs = projectInfo['Gifs'];
      isreceived = true;
    }    
    
  }

}
