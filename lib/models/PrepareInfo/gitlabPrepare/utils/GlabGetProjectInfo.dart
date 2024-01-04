import 'package:GitFossBOT/models/PrepareInfo/gitlabPrepare/utils/getReleaseVersion.dart';
import 'package:GitFossBOT/models/PrepareInfo/gitlabPrepare/utils/gitlab_substrings.dart';
import 'package:html/dom.dart';
import '../../githubPrepare/utils/getTitle.dart';

class GlabGetProjectInfo {

  Map<String,dynamic> AllProjectInfo(Document document, document2) {

    final String title = getTitle().Title(document);

    final gitlabSubStrings = GitlabSubStrings();
    gitlabSubStrings.subStrings(title,document: document);

    final String gitlabReleaseVersion = getReleaseVersion().releaseVersion(document2);

    final Map<String, dynamic> gitlabProjectInfo = {
      'Pname': gitlabSubStrings.projectName,
      'Aname': gitlabSubStrings.authorName,
      'Pdescription': gitlabSubStrings.projectDescription,
      'Rversion': gitlabReleaseVersion,
    };

    return gitlabProjectInfo;
        
  }
}
