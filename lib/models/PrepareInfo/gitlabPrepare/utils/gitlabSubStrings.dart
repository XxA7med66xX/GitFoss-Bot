import 'package:GitFossBOT/models/PrepareInfo/utils/SubStringsExtractor.dart';

class gitlabSubStrings{

  String AuthorName(String Title) {

    String Authorname = SubStringsExtractor().Substring(Title,Endword: '/');
    return Authorname; 

  }
}