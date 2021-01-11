import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginPageData{
  static Future<bool> loginAuthentication(String username, String password) async {
    var url = await http.get("https://script.google.com/macros/s/AKfycbyLvuW0FZKn8f6v8o5DfUXZYpEb0IpW7AgtnWgFYqJbZHjuzoOfrw8I/exec?request=auth&username=" + username + "&password=" + password,
      );
    var jsonData = json.decode(url.body);
    var isSuccess = jsonData['success'];
    if(isSuccess){
      resetIsLogin();
    }
    return isSuccess;
  }


  //sets the user as logged in by saving in shared preference
  static Future<void> resetIsLogin() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("isLogin", true);
  }

}



