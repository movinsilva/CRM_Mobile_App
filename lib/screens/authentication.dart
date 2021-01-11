import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authentication extends StatefulWidget {
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  @override
  void initState() {
    super.initState();
    getIsLogin().then((value) {
      if(value){
        Navigator.of(context).pushReplacementNamed("/home");
      } else {
        Navigator.of(context).pushReplacementNamed("/login");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image(
          image: AssetImage("assets/loading_dots.gif"),
          height: 100,
          width: 100,
        ),
      ),
    );
  }

  Future<bool> getIsLogin() async {

    final prefs = await SharedPreferences.getInstance().timeout(const Duration(seconds: 6),
        onTimeout: () =>  Navigator.of(context).pushReplacementNamed("/login"));
    final bool isLogin = prefs.getBool("isLogin");

    if(isLogin != null)
    return isLogin;
    return false;

  }
}
