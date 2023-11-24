import 'package:GitFossBOT/Operations/userInputProcess/userInputProcess.dart';
import 'package:GitFossBOT/commands/LangCommand/LangCommand.dart';
import 'package:GitFossBOT/commands/StartCommand/StartCommand.dart';
import 'package:teledart/teledart.dart';
import 'package:teledart/telegram.dart';

void main() async {

  //Initializing Bot Config
  var BOT_TOKEN = '6059435916:AAF_SWPEH02zCERYkS199NpHDKN3DInHmGI';
  final username = (await Telegram(BOT_TOKEN).getMe()).username;
  var teledart = TeleDart(BOT_TOKEN, Event(username!));
  teledart.start();
  
  //Greetings and Help message
  final Startcommand = StartCommand(teledart: teledart);
  Startcommand.Startcommand();
  
  //Create command, to create and prepare the post
  final UserInputProcess = userInputProcess(teledart: teledart);

  //Language command, to change language of the bot
  final Langcommand = LangCommand(teledart: teledart);
  
  UserInputProcess.SaveUserInput();
  Langcommand.Langcommand();
  
}