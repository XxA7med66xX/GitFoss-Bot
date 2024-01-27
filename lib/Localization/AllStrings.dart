import 'package:GitFossBOT/commands/LangCommand/LangCommand.dart';

class Allstrings {

  //Basic Info
  final String ProjectName = LangMap.map?["ProjectInfo"]["Name"] ?? 'Please choose language';
  final String ProjectDescription = LangMap.map?["ProjectInfo"]["Description"] ?? 'Please choose language';
  final String ReleaseVersion = LangMap.map?["ProjectInfo"]["ReleaseVersion"] ?? 'Please choose language';
  final String AuthorName = LangMap.map?["ProjectInfo"]["Author"] ?? 'Please choose language';

  //Supported Platforms
  final String SupportedPlatforms = LangMap.map?["ProjectInfo"]["SupportedPlatforms"]["SupportedPlatforms"] ?? 'Please choose language';
  final String Linux = LangMap.map?["ProjectInfo"]["SupportedPlatforms"]["Linux"] ?? 'Please choose language';
  final String Windows = LangMap.map?["ProjectInfo"]["SupportedPlatforms"]["Windows"] ?? 'Please choose language';
  final String Mac = LangMap.map?["ProjectInfo"]["SupportedPlatforms"]["Mac"] ?? 'Please choose language';

  //Categories
  final String Category = LangMap.map?["Categories"]["Category"] ?? 'Please choose language';
  final String AppImages = LangMap.map?["Categories"]["AppImages"] ?? 'Please choose language';
  final String GnomeExtensions = LangMap.map?["Categories"]["GnomeExtentions"] ?? 'Please choose language';
  final String FlatpakApps = LangMap.map?["Categories"]["FlatpakApps"] ?? 'Please choose language';
  final String SnapApps = LangMap.map?["Categories"]["SnapApps"] ?? 'Please choose language';

  //Messages
  final String WellcomeMSG = LangMap.map?["MSGs"]["WellcomeMSG"] ?? 'Please choose language';
  final String DescriptionMSG = LangMap.map?["MSGs"]["DescriptionMSG"] ?? 'Please choose language';
  final String CreateMSG = LangMap.map?["MSGs"]["CreateMSG"] ?? 'Please choose language';
  final String WaitMSG = LangMap.map?["MSGs"]["WaitMSG"] ?? 'Please choose language';

  //Error Messages
  final String UrlErrorMsg = LangMap.map?["MSGs"]["ErrorMSGs"]["UrlErrorMsg"] ?? 'Please choose language';
  final String UnsupportedLink = LangMap.map?["MSGs"]["ErrorMSGs"]["UnsupportedLink"] ?? 'Please choose language';
  final String PhotoErrorMSG = LangMap.map?["MSGs"]["ErrorMSGs"]["MediaErrorMSG"]["PhotoErrorMSG"] ?? 'Please choose language';
  final String GifErrorMSG = LangMap.map?["MSGs"]["ErrorMSGs"]["MediaErrorMSG"]["GifErrorMSG"] ?? 'Please choose language';
  final String NoMediaErrorMSG = LangMap.map?["MSGs"]["ErrorMSGs"]["MediaErrorMSG"]["NoMediaErrorMSG"] ?? 'Please choose language';

  //Short Words
  final String JoinUS = LangMap.map?["ShortWords"]["JoinUs"]?? 'Please choose language';
  final String LangName = LangMap.map?["ShortWords"]["LangName"]?? 'Please choose language';
  final String LangCode = LangMap.map?["ShortWords"]["LangCode"]?? 'Please choose language';
  final String ChannelLink = LangMap.map?["ChannelURL"]?? 'https://Currently-There-is-No-Channel-For-This-Language.com';
}