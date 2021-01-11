import 'package:auto_size_text/auto_size_text.dart';
import 'package:crm/global/default_background.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckingFinishedListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context).settings.arguments;

    return DefaultBackground(
      title: args,
      interior: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
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
                height: 25,
              ),
              AutoSizeText("Power Supply Error",
                style: GoogleFonts.poppins(
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                    fontSize: 18
                ),),

              SizedBox(
                height: 8,
              ),
              AutoSizeText("24 days to complete",
                style: GoogleFonts.poppins(
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                    fontSize: 18
                ),),

              SizedBox(
                height: 8,
              ),
              AutoSizeText("Rs. 1200 for checking",
                style: GoogleFonts.poppins(
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                    fontSize: 18
                ),),

              SizedBox(
                height: 8,
              ),
              AutoSizeText("Rs. 3500 estimated fee",
                style: GoogleFonts.poppins(
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                    fontSize: 18
                ),),

              SizedBox(height: 30,),
              AutoSizeText("Amount depositing as advance",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600
                ),),
              Padding(
                padding: const EdgeInsets.only(left: 80, right: 60),
                child:
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 7),
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
                  "Moving to started list",
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
