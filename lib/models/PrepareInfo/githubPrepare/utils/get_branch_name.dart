import 'package:html/dom.dart';

class GetBranchName {

  Future<String> branchName(Document document) async {

    final branchName = document.querySelector('div.Table__StyledTableContainer-sc-jofqvq-1.jvVQnQ div > table > tbody > tr > td > div > a > div')!.text;
    
    return branchName; 
  }
}