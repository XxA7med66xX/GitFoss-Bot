import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as html;
import 'package:markdown/markdown.dart';

class GetImageUrls {
  
  // In the 'imageUrls' list, any image URL that is not in SVG format will be added to the list.
  final List<String> imageUrls = [];
  final List<String> gifUrls = [];

  Future<void> getImgUrl(String devname, String projectname, String branchName) async {

    final String url = 'https://raw.githubusercontent.com/$devname/$projectname/$branchName/README.md';

    //As named, it contains links that should not be added to any list.
    const List<String> blocklist = [
      'https://img.shields.io',
      'https://flathub.org',
      'https://snapcraft.io',
      'https://dl.flathub.org',
      'https://hosted.weblate.org',
      'https://www.codefactor.io',
      'https://stopthemingmy.app',
      'badge'
    ];

    final List<String> imgUrls = await getImgUrls(url);

    for (String url in imgUrls) {

      // The rules that will extract the URLs from a list of String (URLs).

      // Check the following before add urls to the list:
      // - [checkBlocklist] Filter image URLs based on the block list.
      // - [isSvg] To detect SVG images using URL header (to avoid it, because it's not supported by telegram api).
      // - [checkStatuscode] If image URL is valid (response code not equal to 404).
      // - [imgSizeLimit] If imageSize is bigger then 100KB.
      // - [isGif & isGif 2] to detect GIF images in two methods 1 using URL header & 2 using URL extention.

      bool checkBlocklist = false;
      bool isSvg = false;
      bool isGif = false;
      final bool isGif2 = url.contains('.gif');
      int checkStatuscode = 0;
      bool imgSizeLimit = false;
      http.Response imgurlResponse;
      String urlFromRepo = '';
      String contentType = '';

      if (url.startsWith('http')) {

        imgurlResponse = await http.get(Uri.parse(url));

        checkBlocklist = !blocklist.any((blockedURL) => url.contains(blockedURL));
            
        contentType = imgurlResponse.headers['content-type']!;

        checkStatuscode = imgurlResponse.statusCode;

        isSvg = contentType.contains('svg');

        isGif = contentType.contains('gif');

        imgSizeLimit = calcImgSize(imgurlResponse.headers['content-length'] ?? '102400') > 0.05;
                
      } else {

        //This process handles the images uploaded to the repo
        //those attached directly from the repository like (./images/demo.png).

        final String imageName = url.replaceFirst('./', '');

        urlFromRepo = 'https://github.com/$devname/$projectname/blob/$branchName/$imageName?raw=true';

        imgurlResponse = await http.get(Uri.parse(urlFromRepo));

        checkBlocklist = !blocklist.any((blockedURL) => url.contains(blockedURL));

        checkStatuscode = imgurlResponse.statusCode;

        contentType = imgurlResponse.headers['content-type']!;

        isSvg = contentType.endsWith('svg');

        isGif = contentType.contains('gif');

        imgSizeLimit = calcImgSize(imgurlResponse.headers['content-length'] ?? '102400') > 0.05;
                
      }

      if (checkBlocklist && checkStatuscode != 404) {

        // In case there is an image attached directly from the repository, it will check its URL firstly.

        if (urlFromRepo.isEmpty) {

          if (imgSizeLimit && !isSvg && !isGif && !isGif2) {
            imageUrls.add(url);
          }

          if (isGif | isGif2) {
            gifUrls.add(url);
          }

        } else {

          if (imgSizeLimit && !isSvg && !isGif && !isGif2) {
            imageUrls.add(urlFromRepo);
          }

          if (isGif | isGif2) {
            gifUrls.add(urlFromRepo);
          }
          
        }
      }
    }
    print(imageUrls);
    print('===###====');
    print('===###====');
    print(gifUrls);
  }

  Future<List<String>> getImgUrls(String url) async {

    final response = await http.get(Uri.parse(url));

    final document = html.parse(response.body);

    // Convert any string in Markdown format in the README.md file to HTML format.

    final convertedMd = markdownToHtml(document.body!.innerHtml,extensionSet: ExtensionSet.gitHubFlavored);

    // Convert it back to a document.

    final convertToDoc = html.parse(convertedMd);

    // Lastly, extract image URLs from all attached images in README.md.

    return convertToDoc.querySelectorAll('img').map((img) => img.attributes['src']!).toList();
        
  }

  double calcImgSize(String sizeInBytes) {
    //A function to convert image size from bytes to megabytes
    int sizeAsInt = int.parse(sizeInBytes);
    return sizeAsInt / (1024 * 1024);
  }
}
