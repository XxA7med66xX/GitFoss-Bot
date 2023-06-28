import 'package:GitFossBOT/models/PrepareInfo/utils/SubStringsExtractor.dart';

class Github_subStrings {

  String Author_name = '';
  String ProjectName = '';
  String ProjectDescription = '';

  ghubSubstrings(String Title) {

    Author_name = SubStringsExtractor().Substring(
      Title,
      Keyword: '-',
      Endword: '/',
      keyNUM: 2,
    );

    ProjectName = SubStringsExtractor().Substring(
      Title,
      Keyword: '/',
      Endword: ':',
      keyNUM: 1,
    );

    ProjectDescription = SubStringsExtractor().Substring(
      Title,
      Keyword: ':',
      Endword: 'length',
      keyNUM: 1,
    );
  }

}
