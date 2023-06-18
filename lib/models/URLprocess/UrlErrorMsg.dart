import 'package:teledart/model.dart';
import 'package:teledart/teledart.dart';

class UrlErrorMsg {

  TeleDart teleDart;
  TeleDartMessage message;

  UrlErrorMsg({
    required this.teleDart,
    required this.message,
  });

  ErrorMsg() {
    return teleDart.sendMessage(
      message.chat.id,
      'المشروع غير موجود، الرجاء التحقق من الرابط المُدخل',
    );
  }
  
}
