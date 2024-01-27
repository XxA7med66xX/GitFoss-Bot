import 'package:GitFossBOT/models/PrepareInfo/githubPrepare/utils/getProjectReleases.dart';
import 'package:GitFossBOT/models/PrepareInfo/githubPrepare/utils/getTitle.dart';
import 'package:GitFossBOT/models/PrepareInfo/githubPrepare/utils/get_branch_name.dart';
import 'package:GitFossBOT/models/PrepareInfo/githubPrepare/utils/github_substrings.dart';
import 'package:GitFossBOT/models/PrepareInfo/githubPrepare/utils/image_prepare/prepare_images.dart';
import 'package:html/dom.dart';

class GhubGetProjectInfo {

  Future<Map<String, dynamic>> AllprojectInfo(Document document,document3,document4, String? releaseVersion) async {

    final String Title = getTitle().Title(document);

    final branchName = await GetBranchName().branchName(document4);

    final List<dynamic> projectReleases = getProjectReleases().ProjectReleases(document, document3);

    final subStrings = GithubSubStrings();
    subStrings.subStrings(Title);
    
    final projectImages = await PrepareImageToSend().prepareImage(subStrings.authorName, subStrings.projectName, branchName);
    
    final Map<String, dynamic> projectInfo = {
      'Ptitle': subStrings.projectName,
      'Aname': subStrings.authorName,
      'Pdescription': subStrings.projectDescription,
      'ProjectReleases': projectReleases,
      'Rversion' : releaseVersion,
      'Images' : projectImages[0],
      'Gifs' : projectImages[1],
    };

    return projectInfo;
  }
}