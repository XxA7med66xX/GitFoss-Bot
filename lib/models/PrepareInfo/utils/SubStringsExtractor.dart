class SubStringsExtractor {

  Substring(String Title,{String Keyword='',String Endword='',int keyNUM = 0,int endNUM = 0}) {

    final length = Endword.contains('length');

    switch (length) {
      case true:

      final int keywordindex = Title.indexOf(Keyword);
      final int endwordindex = Title.length;
      final String TEXT = Title.substring(keywordindex + keyNUM, endwordindex + endNUM).trim();

      return TEXT;    
        
      case false:

      final int keywordindex = Title.indexOf(Keyword);
      final int endwordindex = Title.indexOf(Endword);
      final String TEXT = Title.substring(keywordindex + keyNUM, endwordindex + endNUM).trim();
          
      return TEXT;

    }

  }
  
}