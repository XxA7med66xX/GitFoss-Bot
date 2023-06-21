import 'package:html/dom.dart';

class getTitle {

  String Title (Document document) {

    String title = document.head!.querySelector('title')!.text;

    return title;
  }
}