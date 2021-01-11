import 'dart:convert';

import 'package:http/http.dart' as http;

class StartRepairData{
  static Future startTheRepair(var model) async {
    var url = await http.post("https://script.google.com/macros/s/AKfycbyLvuW0FZKn8f6v8o5DfUXZYpEb0IpW7AgtnWgFYqJbZHjuzoOfrw8I/exec?request=uploadinvoice",
    body: model,
    headers: {
      "content-type": "application/json",
      "accept": "application/json",
    },);
    var jsonData = json.decode(url.body);
    var isSuccess = jsonData['success'];
    var invoiceID = jsonData['invoiceid'];
    if(isSuccess){
      return invoiceID;
    } else {
      return null;
    }
  }
}