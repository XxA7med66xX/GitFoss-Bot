import 'package:GitFossBOT/models/PrepareInfo/gitlabPrepare/utils/getDescription.dart';
import 'package:GitFossBOT/models/PrepareInfo/utils/regex_extractor.dart';
import 'package:html/dom.dart';

class GitlabSubStrings{
  
  String authorName = '';
  String projectName = '';
  String projectDescription = '';

  subStrings(String title, {Document? document}) {

    authorName = RegexExtractor().targetText(title, '^(.*?)/');

    projectName = RegexExtractor().targetText(title, '\/(.*?)·');

    projectDescription = getDescription().description(document!)!;
  }
}