import 'package:html/dom.dart';

class getReleaseVersion {

  String releaseVersion(Document document2) {

    final String gitlab_release_version = document2.querySelector('.item-title')?.text.trim() ?? "لايحتوي على رقم إصدار في Gitlab.";
    return gitlab_release_version;

  }
  
}