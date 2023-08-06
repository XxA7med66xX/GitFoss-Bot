import 'package:teledart/model.dart';

import '../../../Localization/AllStrings.dart';

class channelLinkButtons {
  channelLinkButtons();

  final InlineKeyboardMarkup ChannelLinkButton = InlineKeyboardMarkup(
    inlineKeyboard: [
      [
        InlineKeyboardButton(
          text: '${Allstrings().JoinUS} | ${Allstrings().LangName}',
          url: Allstrings().ChannelLink,
          callbackData: 'CLinkBCallback',
        ),
      ],
    ],
  );

  channellinkButton(String? callbackQuery) {
    if (callbackQuery == Allstrings().LangCode) {
      return ChannelLinkButton;
    }
  }
}
