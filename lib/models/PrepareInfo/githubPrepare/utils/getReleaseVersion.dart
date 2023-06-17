import 'package:html/dom.dart';

class getReleaseVersion {

  String releaseVersion(Document document2) {

    final String releaseVersion =
        document2.querySelector('div.css-truncate-target span')?.text.trim() ??
            'لايحتوي على رقم إصدار في Github.';
            
    return releaseVersion;
  }
  
}
