
import 'package:http/http.dart' as http;
import 'dart:convert';


class CheckingFinishedListItemData{
  static Future moveToStartedList(String invoiceNo, String depositedAmount) async{
    var url = await http.get("https://script.google.com/macros/s/AKfycbyLvuW0FZKn8f6v8o5DfUXZYpEb0IpW7AgtnWgFYqJbZHjuzoOfrw8I/exec?request=movetostartedlist&invoiceno=" + invoiceNo
        + "&depositedamount" + depositedAmount);
    var jsonData = json.decode(url.body);
    var isSuccess = jsonData['success'];
    return isSuccess;
  }
}