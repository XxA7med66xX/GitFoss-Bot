import 'package:html/dom.dart';

class getDescription {

  String? description(Document document){
    
    final String? gitlab_description = document.querySelector('div.home-panel-description-markdown p')?.text ??'لم يضع المطور وصفاً للمشروع';
    return gitlab_description;
  }

}