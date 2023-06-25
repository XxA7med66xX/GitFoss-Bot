import 'package:GitFossBOT/models/PrepareInfo/utils/SubStringsExtractor.dart';

class gitlabSubStrings{

  String AuthorName(String Title) {

    final String Authorname = SubStringsExtractor().Substring(Title,Endword: '/');
    return Authorname; 

  }

  String? ProjectName(String Title) {

    final RegExp ProjectNamePN = RegExp(r"/\s*([\w-]+)\s*·");

    final String? Projectname = ProjectNamePN.firstMatch(Title)?.group(1);

    return Projectname;
  }
}