import 'package:GitFossBOT/Localization/AllStrings.dart';
import 'package:GitFossBOT/commands/CreateCommand/PostCreate/githubCreate/utils/platforms_AutoSort.dart';

class Categorys {

  final List<dynamic> ProjectReleases;
  final List<String> categorys = [];

  Categorys({required this.ProjectReleases});

  List<String> category() {

    final PlatformAutoSort = PlatformsAutoSort(ProjectReleases: ProjectReleases);
    PlatformAutoSort.AutoSort();
        
    if (PlatformAutoSort.isAppImage) {
      categorys.add(Allstrings().AppImages);
    }
    if (PlatformAutoSort.isGnome_extention) {
      categorys.add(Allstrings().GnomeExtensions);
    }
    if (PlatformAutoSort.isFlatpak) {
      categorys.add(Allstrings().FlatpakApps);
    }
    if (PlatformAutoSort.isSnap) {
      categorys.add(Allstrings().SnapApps);
    }
    
    return categorys;
  }
}
