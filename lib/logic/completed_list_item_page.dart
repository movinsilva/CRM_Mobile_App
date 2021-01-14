import 'package:http/http.dart' as http;
import 'dart:convert';

class CompletedListIemData {

  static Future<bool> moveToHistory(String invoiceNo, String amount) async {
    var url = await http.get("https://script.google.com/macros/s/AKfycbyLvuW0FZKn8f6v8o5DfUXZYpEb0IpW7AgtnWgFYqJbZHjuzoOfrw8I/exec?request=movetohistory&invoiceno=" + invoiceNo
        + "&finalamount=" + amount);

    var jsonData = json.decode(url.body);
    var isSuccess = jsonData['success'];
    return isSuccess;
  }

}

