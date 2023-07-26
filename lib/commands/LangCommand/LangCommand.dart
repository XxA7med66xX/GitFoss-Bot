import 'package:GitFossBOT/Localization/Localization.dart';
import 'package:GitFossBOT/commands/LangCommand/utils/InitLanguages.dart';
import 'package:teledart/model.dart';
import 'package:teledart/teledart.dart';

class LangMap {

  static Map<String, dynamic>? _Map;

  static Future<void> LoadMap(String LangCode) async {

    final localization = Localization();

    _Map = await localization.localization(LangCode);
  }

  static Map<String, dynamic>? get map {
    return _Map;
  }
}

class LangCommand {

  LangCommand({required this.teledart});
    
  final TeleDart teledart;

  Langcommand() async {

    final InlineKeyboardMarkup LanguageButtons = InlineKeyboardMarkup(
      inlineKeyboard: [
        [InlineKeyboardButton(text: 'Arabic', callbackData: 'ar')],
        [InlineKeyboardButton(text: 'English', callbackData: 'en')]
      ],
    );

    teledart.onCommand('lang').listen(
      (message) async {

        final ChooseMSG = await teledart.sendMessage(
          message.chat.id,
          'اختر لغة البوت | Choose bot language',
          replyMarkup: LanguageButtons,
        );
        
        await Languages().Initialize(teledart, ChooseMSG, LanguageButtons);
      },
    );
  }


}