import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Container(
            height: size.height,
            width: size.width,
            child: Column(
              children: [
                Image(image: AssetImage("assets/login_img.jpg"),
                  fit: BoxFit.fitWidth,
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Username",
                      icon: Icon(
                        Icons.person,
                        size: 30,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Password",
                      icon: Icon(
                        Icons.lock,
                        size: 30,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.2,
                ),
                InkWell(
                  onTap: () => Navigator.of(context).pushNamed("/home"),
                  child: Container(
                    width: size.width * 0.6,
                    height: size.height * 0.06,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [Color(0XFF0EE8F2), Color(0XFF1D87C8)],
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Login",
                        style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 24),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
