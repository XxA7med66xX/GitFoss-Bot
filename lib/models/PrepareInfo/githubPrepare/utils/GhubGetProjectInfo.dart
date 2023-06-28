import 'package:GitFossBOT/models/PrepareInfo/githubPrepare/utils/GithubSubStrings.dart';
import 'package:GitFossBOT/models/PrepareInfo/githubPrepare/utils/getProjectReleases.dart';
import 'package:GitFossBOT/models/PrepareInfo/githubPrepare/utils/getTitle.dart';
import 'package:html/dom.dart';

class GhubGetProjectInfo {

  Map<String,dynamic> AllprojectInfo(Document document,document3, String? releaseVersion) {

    final String title = getTitle().Title(document);
    final String author_name = Github_subStrings().AuthorName(title);
    final String project_Title = Github_subStrings().ProjectName(title);
    final String project_description = Github_subStrings().ProjectDescription(title);
    final List<dynamic> project_Releases = getProjectReleases().ProjectReleases(document, document3);

    final Map<String, dynamic> projectInfo = {
      'Ptitle': project_Title,
      'Aname': author_name,
      'Pdescription': project_description,
      'ProjectReleases': project_Releases,
      'Rversion' : releaseVersion,
    };

    return projectInfo;
  }
}