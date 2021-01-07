import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'navigation_drawer.dart';

class DefaultBackground extends StatelessWidget {

  final interior;
  final title;

  const DefaultBackground({Key key, this.interior, this.title}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    AppBar appBar = AppBar(
      backgroundColor: Colors.transparent,
      //making the navigation drawer icon black
      iconTheme: new IconThemeData(color: Colors.black),
      elevation: 0,
      title: AutoSizeText("PSK Engineering Solutions",
      style: GoogleFonts.poppins(color: Colors.black),),

    );

    final appBarHeight = appBar.preferredSize.height;
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: appBar,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: FittedBox(
          fit: BoxFit.contain,
          child: Container(
            height: size.height-appBarHeight-statusBarHeight,
            width: size.width,
            child: interior,
          ),
        ),
      ),
    );
  }
}
