import 'package:GitFossBOT/commands/CreateCommand/PostCreate/githubCreate/utils/platforms_AutoSort.dart';

class Categorys {

  final List<dynamic> ProjectReleases;
  final List<String> categorys = [];

  Categorys({required this.ProjectReleases});

  List<String> category() {

    final PlatformAutoSort = PlatformsAutoSort(ProjectReleases: ProjectReleases);
    PlatformAutoSort.AutoSort();
        
    if (PlatformAutoSort.isAppImage) {
      categorys.add('#تطبيقات_محمولة');
    }
    if (PlatformAutoSort.isGnome_extention) {
      categorys.add('#إضافات_جنوم');
    }
    if (PlatformAutoSort.isFlatpak) {
      categorys.add('#تطبيقات_فلاتباك');
    }
    if (PlatformAutoSort.isSnap) {
      categorys.add('#تطبيقات_سناب');
    }
    
    return categorys;
  }
}
