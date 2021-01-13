import 'package:http/http.dart' as http;
import 'dart:convert';

class OrdersData{
  static Future getOrderNumbers() async {
    var data = await http.get("https://script.google.com/macros/s/AKfycbyLvuW0FZKn8f6v8o5DfUXZYpEb0IpW7AgtnWgFYqJbZHjuzoOfrw8I/exec?request=getschemecount");
    var jsonData = json.decode(data.body);
    List orderNumbers = [];
    orderNumbers.add(jsonData['checklistcount']);
    orderNumbers.add('checkedovercount');
    orderNumbers.add('startedcount');
    orderNumbers.add('completedcount');
    orderNumbers.add('historycount');
    return orderNumbers;
  }
}