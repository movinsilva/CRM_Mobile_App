import 'package:http/http.dart' as http;
import 'dart:convert';

class StartedListItemData{
  static Future moveToCompletedList(String invoiceNo) async {
    var url = await http.get("https://script.google.com/macros/s/AKfycbyLvuW0FZKn8f6v8o5DfUXZYpEb0IpW7AgtnWgFYqJbZHjuzoOfrw8I/exec?request=movetoendedlist&invoiceno=" + invoiceNo);
    var jsonData = json.decode(url.body);
    var isSuccess = jsonData['success'];
    return isSuccess;
  }
}