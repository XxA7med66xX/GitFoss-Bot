class LinkFormatter {

  static final RegExp _githubLinkPattern = RegExp(r'^https:\/\/github\.com\/([^\/]+)\/([^\/]+)(?:\.git)?\/?.*$');

  static final RegExp _gitlabLinkPattern = RegExp(r'^https:\/\/gitlab\.com\/([^\/]+)\/([^\/]+)(?:\.git)?\/?.*$');

  List<String> defaultURLs = ['github.com', 'gitlab'];

  formatGitLink(String link) {
    
    switch (defaultURLs.indexWhere((defaultURL) => link.contains(defaultURL))) {

      case 0:
        final match = _githubLinkPattern.firstMatch(link);
        if (match != null) {
          final devName = match.group(1);
          final repository = match.group(2);
          return 'https://github.com/$devName/$repository';
        } else {
          print('Badlink');
        }

        return null;

      case 1:
        final match = _gitlabLinkPattern.firstMatch(link);
        if (match != null) {
          final devname = match.group(1);
          final repository = match.group(2);
          return 'https://gitlab.com/$devname/$repository';
        } else {
          print('Badlink');
        }
        
        return null;

      default:
        print('Badlink');
    }
  }
}
