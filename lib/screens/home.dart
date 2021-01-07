import 'package:auto_size_text/auto_size_text.dart';
import 'package:crm/global/default_background.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DefaultBackground(
      interior: Column(
        children: [
          SizedBox(
            height: 25,
          ),
          InkWell(
            onTap: () => Navigator.of(context).pushNamed("/home"),
            child: Container(
              width: size.width * 0.8,
              height: size.height * 0.12,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Color(0XFF0EE8F2), Color(0XFF1D87C8)],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.settings,
                    color: Colors.white,
                    size: 45,
                  ),
                  Container(
                    width: 3,
                    height: size.height * 0.07,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Start a\nRepair",
                    style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: size.height * 0.17,
                width: size.width * 0.42,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Colors.white,
                    boxShadow: [BoxShadow(color: Colors.black, blurRadius: 20, offset: Offset(0, 0), spreadRadius: -15)]),
                child: Column(
                  children: [
                    Image(
                      image: AssetImage("assets/tv.png"),
                      height: size.height * 0.13,
                      width: size.width * 0.32,
                    ),
                    AutoSizeText(
                      "Orders Count",
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 15),
                    )
                  ],
                ),
              ),
              Container(
                height: size.height * 0.17,
                width: size.width * 0.42,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Colors.white,
                    boxShadow: [BoxShadow(color: Colors.black, blurRadius: 20, offset: Offset(0, 0), spreadRadius: -15)]),
                child: Column(
                  children: [
                    Image(
                      image: AssetImage("assets/cart.png"),
                      height: size.height * 0.13,
                      width: size.width * 0.32,
                    ),
                    AutoSizeText(
                      "Sell Item",
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 15),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
