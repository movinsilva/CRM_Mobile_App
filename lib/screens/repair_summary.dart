import 'package:auto_size_text/auto_size_text.dart';
import 'package:crm/args/repair_details.dart';
import 'package:crm/global/default_background.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RepairSummary extends StatelessWidget {

  TextStyle textStyle = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.black54
  );

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final RepairDetailArgs args = ModalRoute.of(context).settings.arguments;

    return DefaultBackground(
      title: "Start a Repair",
      interior: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  AutoSizeText("Invoice Number",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                    ),),
                  SizedBox(width: size.width*0.2,),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      color: Colors.black12,
                      border: Border.all(color: Colors.grey)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical:  4),
                      child: Center(child: AutoSizeText("INV0011")),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),

              Text(args.ownerName.toString(),
              style: textStyle,),
              SizedBox(height: 10,),

              Text(args.itemModel.toString(),
                style: textStyle,),
              SizedBox(height: 10,),

              Text("Serial No : " + args.serialNo.toString(),
                style: textStyle,),
              SizedBox(height: 10,),

              Text(args.reason.toString(),
                style: textStyle,),
              SizedBox(height: 10,),

              Text("phone : " + args.phone.toString(),
                style: textStyle,),
              SizedBox(height: 10,),

              Text("Checking Fee : Rs." + args.checkingFee.toString(),
                style: textStyle,),
              SizedBox(height: 30,),

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
                          "Confirm",
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
                  "Moving to checking list",
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
