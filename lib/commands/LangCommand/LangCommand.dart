import 'package:GitFossBOT/Localization/Localization.dart';
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

  LangCommand({required this.teledart}) {Languages();}
    
  bool isSent = false;
  final TeleDart teledart;

  Langcommand() async {

    final LanguageButtons = ReplyKeyboardMarkup(
      oneTimeKeyboard: true, //Used to hide the keyboard after the user choose an option.
      resizeKeyboard: true, //Used to resize keyboard depending to display res.
      isPersistent: true,
      inputFieldPlaceholder: 'اختر لغة البوت | Choose bot language',
      keyboard: [
        [
          KeyboardButton(text: 'Arabic'),
          KeyboardButton(text: 'English'),
        ],
      ],
    );

    teledart.onCommand('lang').listen(
      (message) async {

        isSent = true;

        await teledart.sendMessage(
          message.chat.id,
          'اختر لغة البوت | Choose bot language',
          replyMarkup: LanguageButtons,
        );
      },
    );
  }

  Languages() {

    //Arabic

    teledart.onMessage(keyword: 'Arabic').listen(
      (message) async {

        if (isSent) {

          await LangMap.LoadMap('ar');

          Future.value(
            teledart.sendMessage(
              message.chat.id,
              'العربية ✅',
            ),
          );

          isSent = false;
        }
      },
    );

    //English

    teledart.onMessage(keyword: 'English').listen(
      (message) async {

        if (isSent) {
          
          await LangMap.LoadMap('en');

          Future.value(
            teledart.sendMessage(
              message.chat.id,
              'English ✅',
            ),
          );

          isSent = false;
        }
      },
    );
  }
}
