import 'package:GitFossBOT/models/PrepareInfo/githubPrepare/utils/FlatSnap/getFlatSnap.dart';
import 'package:html/dom.dart';

class getProjectReleases {

  List<dynamic> ProjectReleases(Document document, document3) {
    
    final List<dynamic> project_Releases = document3
        .querySelectorAll(".Truncate-text.text-bold")
        .map((R_title) => R_title.text)
        .toList();
        
        project_Releases.addAll(List<String>.from(getFlatSnap().FlatSnap(document)));
        

    return project_Releases;
  }
}
