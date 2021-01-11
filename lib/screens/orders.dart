import 'package:auto_size_text/auto_size_text.dart';
import 'package:crm/global/default_background.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Orders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    List ordersList = [
      "Checking List",
      "Checking Finished List",
      "Started List",
      "Completed List",
      "History"
    ];

    return DefaultBackground(
      title: "Orders",
      interior: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
        return InkWell(
          onTap: () => Navigator.of(context).pushNamed("/listView", arguments: ordersList[index]),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.black, blurRadius: 17, offset: Offset(0, 0), spreadRadius: -15)]
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(ordersList[index],
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 18
                  ),),
                  AutoSizeText("\t\t\t16 Orders",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                      color: Colors.black54
                    ),),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
