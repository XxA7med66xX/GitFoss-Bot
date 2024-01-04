import 'package:GitFossBOT/models/PrepareInfo/utils/regex_extractor.dart';

class GithubSubStrings {

  String authorName = '';
  String projectName = '';
  String projectDescription = '';

  subStrings(String title) {

    authorName = RegexExtractor().targetText(title, '[-\/]+(.*?)\/');

    projectName = RegexExtractor().targetText(title, '\/([^\/:]+)');

    projectDescription = RegexExtractor().targetText(title, ':([^:]+)\$');
  }

}
