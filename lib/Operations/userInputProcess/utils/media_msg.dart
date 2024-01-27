import 'package:GitFossBOT/Localization/AllStrings.dart';
import 'package:teledart/model.dart';
import 'package:teledart/teledart.dart';
import 'package:teledart/util.dart';

class MediaMessage {
  
  TeleDart teledart;
  TeleDartMessage message;
  bool hasImage = false;
  bool hasGif = false;

  MediaMessage({required this.teledart, required this.message});

  Future<void> sendMedia (List<InputMediaPhoto> imageGroup, List<String> gifUrls) async {

    await imageMsg(imageGroup);
    await gifMsg(gifUrls);

    if (!hasImage && !hasGif) {
      mediaErrorMsg('null');
    } else if (!hasImage) {
      mediaErrorMsg('image');
    } else if (!hasGif) {
      mediaErrorMsg('gif');
    }

  }

  Future<void> imageMsg(List<InputMediaPhoto> imageGroup) async {

    int maxRetries = imageGroup.length; // Maximum number of retries

    if (imageGroup.isNotEmpty) {

      int retries = 0;

      while (retries < maxRetries) {

        try {
          await teledart.sendMediaGroup(message.chat.id, imageGroup);
          hasImage = true;
          break; // If successful, exit the loop
        } on HttpClientException catch (httpError) {

          String? getIndex = RegExp(r'#(\d+)').firstMatch(httpError.description)!.group(1);
              
          int index = int.parse(getIndex!);

          imageGroup.removeAt(index - 1);

          print(httpError.description);

          retries++; // Increment the retry counter
        }
      }

      if (retries == maxRetries) {
        print("Reached maximum number of retries");
      }

    } else {
      hasImage = false;
    }
  }

  Future<void> gifMsg(List<String> gifUrls) async {

    if (gifUrls.isNotEmpty) {
      
      try {

        for (String url in gifUrls) {
          await teledart.sendAnimation(message.chat.id, url);
          hasGif = true;
        }

      } on HttpClientException catch (httpError) {
        print(httpError.description);
      }
    } else {
      hasGif = false;
    }
  }

  Future<void> mediaErrorMsg(String errorName) async {

    switch (errorName) {

      case 'image':
        await teledart.sendMessage(
          message.chat.id,
          Allstrings().PhotoErrorMSG,
        );
        break;

      case 'gif':
        await teledart.sendMessage(
          message.chat.id,
          Allstrings().GifErrorMSG,
        );
        break;

      case 'null':
        await teledart.sendMessage(
          message.chat.id,
          Allstrings().NoMediaErrorMSG,
        );
    }
  }
}
