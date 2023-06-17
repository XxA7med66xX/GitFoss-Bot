class Github_subStrings {

  String AuthorName(String title) {

    const String keyword1 = '-';
    const String endword1 = '/';
    final int keyword_index1 = title.indexOf(keyword1);
    final int endword_index1 = title.indexOf(endword1);

    final String AuthorName = title.substring(keyword_index1 + 2, endword_index1);

    return AuthorName;
  }

  String ProjectName(String title) {

    const String keyword2 = '/';
    const String endword2 = ':';
    final int keyword_index2 = title.indexOf(keyword2) + 1;
    final int endword_index2 = title.indexOf(endword2);

    final String ProjectName = title.substring(keyword_index2, endword_index2);
        
    return ProjectName;
  }

  String ProjectDescription(String title) {

    const String keyword3 = ':';
    final int keyword_index3 = title.indexOf(keyword3);
    final int endword_index3 = title.length;

    final String ProjectDescription = title.substring(keyword_index3 + 1, endword_index3);

    return ProjectDescription;
  }
}
