class RegexExtractor {

  String targetText(String Title,String pattern) {
    
    String text = RegExp(pattern).firstMatch(Title)!.group(1)!.trim();
          
    return text;
  }
}