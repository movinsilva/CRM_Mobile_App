
import 'package:crm/models/list_view_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class ListViewData{

  static String type;

  static Future getListData(String listType) async{
    if(listType == "Checking List") {
      type = "getchecklist";

    } else if(listType == "Checking Finished List"){
      type = "getcheckedoverlist";

    } else if(listType == "Started List"){
      type = "getstartedlist";

    } else if(listType == "Completed List"){
      type = "getendedlist";

    } else if(listType == "History"){
      type = "gethistorylist";

    }

    var data = await http.get("https://script.google.com/macros/s/AKfycbyLvuW0FZKn8f6v8o5DfUXZYpEb0IpW7AgtnWgFYqJbZHjuzoOfrw8I/exec?request=" + type);
    var jsonData = json.decode(data.body);
    var map = ListViewModel.fromJson(jsonData);
    return map;

  }

}