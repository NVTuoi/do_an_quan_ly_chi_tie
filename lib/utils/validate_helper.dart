import 'package:intl/intl.dart';

class Validate{

  static  bool isEmail(String em) {
    String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(p);
    return regExp.hasMatch(em);
  }

 static bool isPhoneNoValid(String? phoneNo) {
    if (phoneNo == null) return false;
    final regExp = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
    return regExp.hasMatch(phoneNo);
  }

  static String convertTextToCurrency( String text) {
    String result = "";
    double numericValue = double.parse(text);
    NumberFormat currencyFormat = NumberFormat.currency(locale: 'vi_VN', symbol: 'Đ');
    result = currencyFormat.format(numericValue);
    return result ;
  }
}