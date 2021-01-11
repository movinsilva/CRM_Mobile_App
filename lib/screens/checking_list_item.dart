import 'package:auto_size_text/auto_size_text.dart';
import 'package:crm/global/default_background.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckingListItem extends StatelessWidget {

  TextStyle textStyle = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context).settings.arguments;

    final double horizontalpaddingforTextField = 8;
    final double verticalPaddingforTextField = 4;

    const double leftOutSidePaddingforTextField = 50;
    const double rightOutSidePaddingForTextField = 70;

    return DefaultBackground(
      title: args,
      interior: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: AutoSizeText(
                      "Sharp 32 inch TV",
                      style: GoogleFonts.poppins(color: Colors.black87, fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                  ),
                  Expanded(
                      flex: 4,
                      child: AutoSizeText(
                        "Namal Perera",
                        style: GoogleFonts.poppins(
                          color: Colors.black54,
                        ),
                      )),
                  Expanded(
                      flex: 2,
                      child: AutoSizeText(
                        "INV0011",
                        maxLines: 1,
                        style: GoogleFonts.poppins(color: Colors.grey[700], fontSize: 15, fontWeight: FontWeight.w500),
                      ))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              AutoSizeText("Rs. 1200 for checking",
              style: GoogleFonts.poppins(
                color: Colors.black54,
                fontWeight: FontWeight.w500,
                fontSize: 18
              ),),

              SizedBox(height: 35,),
              AutoSizeText("Item Fault",
              style: textStyle,),
              Padding(
                padding: const EdgeInsets.only(left: leftOutSidePaddingforTextField),
                child:
                TextFormField(
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: horizontalpaddingforTextField, vertical: verticalPaddingforTextField),
                  ),
                ),
              ),


              SizedBox(height: 20,),
              AutoSizeText("Time to Complete",
                style: textStyle,),
              Padding(
                padding: const EdgeInsets.only(left: leftOutSidePaddingforTextField, right: rightOutSidePaddingForTextField),
                child:
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: horizontalpaddingforTextField, vertical: verticalPaddingforTextField),
                  ),
                ),
              ),


              SizedBox(height: 20,),
              AutoSizeText("Estimated Fee",
                style: textStyle,),
              Padding(
                padding: const EdgeInsets.only(left: leftOutSidePaddingforTextField, right: rightOutSidePaddingForTextField),
                child:
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: horizontalpaddingforTextField, vertical: verticalPaddingforTextField),
                  ),
                ),
              ),


              SizedBox(height: 20,),
              AutoSizeText("Amount to be deposited for starting",
                style: textStyle,),
              Padding(
                padding: const EdgeInsets.only(left: leftOutSidePaddingforTextField, right: rightOutSidePaddingForTextField),
                child:
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: horizontalpaddingforTextField, vertical: verticalPaddingforTextField),
                  ),
                ),
              ),


              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(13)),
                        color: Colors.orange[400]
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5),
                      child: Center(
                        child: AutoSizeText(
                          "Submit",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [ AutoSizeText(
                          "Moving to checking finished list",
                          style: GoogleFonts.poppins(
                            color: Colors.black54,
                            fontSize: 10
                          ),
                        ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
