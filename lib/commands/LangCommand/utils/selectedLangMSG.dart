import 'package:teledart/model.dart';
import 'package:teledart/teledart.dart';
import 'package:teledart/util.dart';

class SelectedLangMSG {

  Future<Message> MSG(TeleDart teledart, Message ChooseMSG, InlineKeyboardMarkup IKM, String text) async {

    try {

      return await teledart.editMessageText(
        text,
        chatId: ChooseMSG.chat.id,
        messageId: ChooseMSG.messageId,
      );

    } on HttpClientException catch (e) {

      if (e.code == 400) {
        return ChooseMSG;
      } else {
        rethrow;
      }
      
    }
  }
}
