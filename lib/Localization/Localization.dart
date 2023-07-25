import 'dart:convert';
import 'dart:io';

class Localization {
  dynamic JsonContent;

  localization([String LangCode = '']) async {
    //Arabic

    if (LangCode.contains('ar')) {

      final String JsonPath = await File('lib/Localization/ar.json').readAsString();
      JsonContent = await jsonDecode(JsonPath);

      final Map<String, dynamic> arMap = Map.of(JsonContent);

      return arMap;
    }

    //English

    if (LangCode.contains('en')) {

      final String JsonPath = await File('lib/Localization/en.json').readAsString();
      JsonContent = await jsonDecode(JsonPath);

      final Map<String, dynamic> enMap = Map.of(JsonContent);

      return enMap;
    }

    return {};
  }
}
