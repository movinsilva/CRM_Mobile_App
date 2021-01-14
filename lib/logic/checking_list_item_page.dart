import 'package:http/http.dart' as http;
import 'dart:convert';


class CheckingListItemData{
  static Future<bool> moveToCheckedOverList(String invoiceNo, String itemFault,String days, String estimatedFee, String depositAmount, String declinedReason) async {
    var url = await http.get("https://script.google.com/macros/s/AKfycbyLvuW0FZKn8f6v8o5DfUXZYpEb0IpW7AgtnWgFYqJbZHjuzoOfrw8I/exec?request=movetocheckedoverlist&"
        "invoiceno=" + invoiceNo + "&itemfault=" + itemFault + "&timetocomplete=" + days + "&estimatedfee=" + estimatedFee + "&depositamount=" +depositAmount + "&declinereason=" + declinedReason);
    var jsonData = json.decode(url.body);
    var isSuccess = jsonData['success'];
    return isSuccess;
  }
}