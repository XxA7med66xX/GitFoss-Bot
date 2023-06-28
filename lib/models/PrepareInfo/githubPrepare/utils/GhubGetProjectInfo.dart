import 'package:GitFossBOT/models/PrepareInfo/githubPrepare/utils/GithubSubStrings.dart';
import 'package:GitFossBOT/models/PrepareInfo/githubPrepare/utils/getProjectReleases.dart';
import 'package:GitFossBOT/models/PrepareInfo/githubPrepare/utils/getTitle.dart';
import 'package:html/dom.dart';

class GhubGetProjectInfo {

  Map<String,dynamic> AllprojectInfo(Document document,document3, String? releaseVersion) {

    final String Title = getTitle().Title(document);
    final List<dynamic> project_Releases = getProjectReleases().ProjectReleases(document, document3);
    final Substrings = Github_subStrings();
    Substrings.ghubSubstrings(Title);

    final Map<String, dynamic> projectInfo = {
      'Ptitle': Substrings.ProjectName,
      'Aname': Substrings.Author_name,
      'Pdescription': Substrings.ProjectDescription,
      'ProjectReleases': project_Releases,
      'Rversion' : releaseVersion,
    };

    return projectInfo;
  }
}