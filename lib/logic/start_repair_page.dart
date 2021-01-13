import 'dart:convert';

import 'package:crm/args/starting_repair.dart';
import 'package:http/http.dart' as http;

class StartRepairData{
  static Future startTheRepair(StartingRepair model) async {
    DateTime now = DateTime.now();
    var date = now.day.toString();
    var month = now.month.toString();
    var year = now.year.toString();
    var url = await http.get("https://script.google.com/macros/s/AKfycbyLvuW0FZKn8f6v8o5DfUXZYpEb0IpW7AgtnWgFYqJbZHjuzoOfrw8I/exec?request=uploadinvoice&serialno=" + model.serialNo +
        "&checkingfees=" + model.checkingFee + "&date=" + date + "&month=" + month + "&year=" + year + "&itemcategory=" + model.itemCategory + "&itemmodel=" + model.itemModel +
        "&reason=" + model.reason + "&ownersname=" + model.ownerName + "&address=" + model.address + "&email=" + model.phone + "&phone=" + model.phone );
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