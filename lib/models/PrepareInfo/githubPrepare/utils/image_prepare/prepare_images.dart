import 'package:GitFossBOT/models/PrepareInfo/githubPrepare/utils/image_prepare/get_image_url.dart';
import 'package:teledart/model.dart';

class PrepareImageToSend {

  final List<InputMediaPhoto> imageGroup = [];

  Future<List<List<Object>>> prepareImage(String authorName, String projectName, String branchName) async {

    final imgUrls = GetImageUrls();
    await imgUrls.getImgUrl(authorName, projectName, branchName);

    await imagePrepare(imgUrls.imageUrls);

    //The reason why I didn't cover each GIF URL with InputMediaAnimation inside a List, like imageGroup, is that Telegram does not support sending a group of GIFs. Therefore, I will send them separately.

    return [imageGroup, imgUrls.gifUrls];
  }

  imagePrepare(List<String> imgUrls) {
    for (String url in imgUrls) {
      if (imageGroup.length < 10) {
        imageGroup.add(InputMediaPhoto(media: url));
      }
    }
  }
}
