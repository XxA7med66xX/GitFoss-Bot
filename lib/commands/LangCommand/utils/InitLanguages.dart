import 'package:GitFossBOT/commands/LangCommand/utils/selectedLangMSG.dart';
import 'package:teledart/model.dart';
import 'package:teledart/teledart.dart';
import '../LangCommand.dart';

class Languages {

  Initialize(TeleDart teledart, Message ChooseMSG, InlineKeyboardMarkup IKM) async {
    await Arabic(teledart, ChooseMSG, IKM);
    await English(teledart, ChooseMSG, IKM);
  }

  Arabic(TeleDart teledart, Message ChooseMSG, InlineKeyboardMarkup IKM) async {

    teledart.onCallbackQuery().listen(
      (callback) async {
        
        switch (callback.data) {
          case 'ar':

            await LangMap.LoadMap('ar');

            await SelectedLangMSG().MSG(teledart, ChooseMSG, IKM, 'العربية ✅');

            break;
        }
      },
    );
  }

  English(TeleDart teledart, Message ChooseMSG, InlineKeyboardMarkup IKM) {

    teledart.onCallbackQuery().listen(
      (callback) async {

        switch (callback.data) {
          case 'en':
          
            await LangMap.LoadMap('en');

            await SelectedLangMSG().MSG(teledart, ChooseMSG, IKM, 'English ✅');

            break;
        }
      },
    );
  }
}
