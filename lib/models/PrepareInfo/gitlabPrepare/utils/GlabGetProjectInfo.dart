import 'package:GitFossBOT/models/PrepareInfo/gitlabPrepare/utils/getDescription.dart';
import 'package:GitFossBOT/models/PrepareInfo/gitlabPrepare/utils/getReleaseVersion.dart';
import 'package:html/dom.dart';
import 'package:GitFossBOT/models/PrepareInfo/gitlabPrepare/utils/gitlabSubStrings.dart';
import '../../githubPrepare/utils/getTitle.dart';

class GlabGetProjectInfo {

  Map<String,dynamic> AllProjectInfo(Document document, document2) {

    final String Title = getTitle().Title(document);
    final String? gitlab_title = gitlabSubStrings().ProjectName(Title);
    final String gitlab_author = gitlabSubStrings().AuthorName(Title);
    final String? gitlab_description = getDescription().description(document);
    final String gitlab_release_version = getReleaseVersion().releaseVersion(document2);

    final Map<String, dynamic> gitlabProjectInfo = {
      'Pname': gitlab_title,
      'Aname': gitlab_author,
      'Pdescription': gitlab_description,
      'Rversion': gitlab_release_version,
    };

    return gitlabProjectInfo;
        
  }
}
