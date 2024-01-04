import 'package:GitFossBOT/models/PrepareInfo/githubPrepare/utils/getProjectReleases.dart';
import 'package:GitFossBOT/models/PrepareInfo/githubPrepare/utils/getTitle.dart';
import 'package:GitFossBOT/models/PrepareInfo/githubPrepare/utils/github_substrings.dart';
import 'package:html/dom.dart';

class GhubGetProjectInfo {

  Map<String,dynamic> AllprojectInfo(Document document,document3, String? releaseVersion) {

    final String Title = getTitle().Title(document);
    final List<dynamic> projectReleases = getProjectReleases().ProjectReleases(document, document3);
    final subStrings = GithubSubStrings();
    subStrings.subStrings(Title);

    final Map<String, dynamic> projectInfo = {
      'Ptitle': subStrings.projectName,
      'Aname': subStrings.authorName,
      'Pdescription': subStrings.projectDescription,
      'ProjectReleases': projectReleases,
      'Rversion' : releaseVersion,
    };

    return projectInfo;
  }
}