

import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:crm/args/repair_details.dart';
import 'package:crm/global/default_background.dart';
import 'package:crm/logic/start_repair_page.dart';
import 'package:crm/widgets/start_a_repair_screen/dropdown.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartARepair extends StatelessWidget {
  static TextEditingController itemModelController = TextEditingController();
  static TextEditingController serialNoController = TextEditingController();
  static TextEditingController reasonController = TextEditingController();
  static TextEditingController ownerNameController = TextEditingController();
  static TextEditingController addressController = TextEditingController();
  static TextEditingController emailController = TextEditingController();
  static TextEditingController phoneController = TextEditingController();
  static TextEditingController checkingFeeController = TextEditingController();

  static String valueChoose;

  TextStyle textStyle = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    final double horizontalpaddingforTextField = 8;
    final double verticalPaddingforTextField = 4;

    const double leftOutSidePaddingforTextField = 50;
    const double rightOutSidePaddingForTextField = 70;

    return DefaultBackground(
      title: "Start a Repair",
      interior: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  AutoSizeText("Item Category",
                  style: textStyle,),
                  SizedBox(width: size.width*0.2,),
                  Dropdown(),
                ],
              ),


              SizedBox(height: 10,),
              AutoSizeText("Item Model",
                style: textStyle,),
              Padding(
                padding: const EdgeInsets.only(left: leftOutSidePaddingforTextField, right: rightOutSidePaddingForTextField),
                child:
                  TextFormField(
                    controller: itemModelController,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(horizontal: horizontalpaddingforTextField, vertical: verticalPaddingforTextField),
                    ),
                  ),
              ),


              SizedBox(height: 20,),
              AutoSizeText("Serial No.",
                style: textStyle,),
              Padding(
                padding: const EdgeInsets.only(left: leftOutSidePaddingforTextField, right: rightOutSidePaddingForTextField),
                child:
                TextFormField(
                  controller: serialNoController,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: horizontalpaddingforTextField, vertical: verticalPaddingforTextField),
                  ),
                ),
              ),


              SizedBox(height: 20,),
              AutoSizeText("Reason",
                style: textStyle,),
              Padding(
                padding: const EdgeInsets.only(left: leftOutSidePaddingforTextField),
                child:
                TextFormField(
                  controller: reasonController,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: horizontalpaddingforTextField, vertical: verticalPaddingforTextField),
                  ),
                ),
              ),


              SizedBox(height: 20,),
              AutoSizeText("Owner's Name",
                style: textStyle,),
              Padding(
                padding: const EdgeInsets.only(left: leftOutSidePaddingforTextField, right: rightOutSidePaddingForTextField),
                child:
                TextFormField(
                  controller: ownerNameController,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: horizontalpaddingforTextField, vertical: verticalPaddingforTextField),
                  ),
                ),
              ),


              SizedBox(height: 20,),
              AutoSizeText("Address",
                style: textStyle,),
              Padding(
                padding: const EdgeInsets.only(left: leftOutSidePaddingforTextField),
                child:
                TextFormField(
                  controller: addressController,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: horizontalpaddingforTextField, vertical: verticalPaddingforTextField),
                  ),
                ),
              ),


              SizedBox(height: 20,),
              AutoSizeText("Email",
                style: textStyle,),
              Padding(
                padding: const EdgeInsets.only(left: leftOutSidePaddingforTextField),
                child:
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: horizontalpaddingforTextField, vertical: verticalPaddingforTextField),
                  ),
                ),
              ),


              SizedBox(height: 20,),
              AutoSizeText("Phone",
                style: textStyle,),
              Padding(
                padding: const EdgeInsets.only(left: leftOutSidePaddingforTextField),
                child:
                TextFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: horizontalpaddingforTextField, vertical: verticalPaddingforTextField),
                  ),
                ),
              ),


              SizedBox(height: 20,),
              AutoSizeText("Checking Fee",
                style: textStyle,),
              Padding(
                padding: const EdgeInsets.only(left: leftOutSidePaddingforTextField),
                child:
                TextFormField(
                  controller: checkingFeeController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: horizontalpaddingforTextField, vertical: verticalPaddingforTextField),
                  ),
                ),
              ),

              SizedBox(
                height: size.height*0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: (){

                      var map = {
                        "serialno": serialNoController.text,
                        "checkingfees": checkingFeeController.text,
                        "date": "hello",
                        "month": 1,
                        "year": "sandevxxxx@gmail.com",
                        "itemcategory": "asdidsfsdfsf",
                        "reason": reasonController.text,
                        "ownersname": ownerNameController.text,
                        "address": addressController.text.toString(),
                        "email": emailController.text,
                        "phone": phoneController.text

                      };

                      var i = jsonEncode(map);

                      StartRepairData.startTheRepair(i).then((value) {
                        if(value != null){
                          Navigator.of(context).pushReplacementNamed("/repair_summary",arguments: RepairDetailArgs(valueChoose, itemModelController.text, serialNoController.text, reasonController.text,
                              ownerNameController.text, addressController.text, emailController.text, phoneController.text, checkingFeeController.text, value));
                        } else{
                          final snackBar = SnackBar(content: Text('Error Occurred, \nPlease try again'));
                          Scaffold.of(context).showSnackBar(snackBar);
                        }
                      });


                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(13)),
                        color: Colors.blue[400]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5),
                        child: Center(
                          child: AutoSizeText(
                            "Proceed",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: size.height*0.5,
              )
            ],
          ),
        ),
      ),
    );
  }
}
