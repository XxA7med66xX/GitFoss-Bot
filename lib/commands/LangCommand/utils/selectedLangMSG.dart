import 'package:teledart/model.dart';
import 'package:teledart/teledart.dart';

class SelectedLangMSG {

  Future<Message> MSG(TeleDart teledart, Message ChooseMSG, InlineKeyboardMarkup IKM, String text) async {

    return teledart.editMessageText(
      text,
      chatId: ChooseMSG.chat.id,
      messageId: ChooseMSG.messageId,
    );
  }
}
