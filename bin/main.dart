import 'package:GitFossBOT/commands/LangCommand/LangCommand.dart';
import 'package:teledart/teledart.dart';
import 'package:GitFossBOT/commands/CreateCommand/CreateCommand.dart';
import 'package:GitFossBOT/commands/Start_Help_commands.dart';
import 'package:teledart/telegram.dart';

void main() async {

  //Initializing Bot Config
  var BOT_TOKEN = '6059435916:AAF_SWPEH02zCERYkS199NpHDKN3DInHmGI';
  final username = (await Telegram(BOT_TOKEN).getMe()).username;
  var teledart = TeleDart(BOT_TOKEN, Event(username!));
  teledart.start();
  
  //Greetings and Help message
  final StartHelpCommands = Start_Help_Commands(teledart: teledart, BOT_TOKEN: BOT_TOKEN);
  StartHelpCommands.Start_Help_commands();
  
  //Create command, to create and prepare the post
  final Createcommand = createCommand(teledart: teledart);

  //Language command, to change language of the bot
  final Langcommand = LangCommand(teledart: teledart);
  
  Createcommand.CreateCommand();
  Createcommand.SaveUserInput();
  Langcommand.Langcommand();
  
}