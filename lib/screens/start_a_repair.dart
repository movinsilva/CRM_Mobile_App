

import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:crm/args/repair_details.dart';
import 'package:crm/args/starting_repair.dart';
import 'package:crm/global/default_background.dart';
import 'package:crm/logic/start_repair_page.dart';
import 'package:crm/widgets/global/dialog_widget.dart';
import 'package:crm/widgets/start_a_repair_screen/dropdown.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sms/sms.dart';

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

                      // var map = {
                      //   "serialno": serialNoController.text,
                      //   "checkingfees": checkingFeeController.text,
                      //   "date": "hello",
                      //   "month": 1,
                      //   "year": "sandevxxxx@gmail.com",
                      //   "itemcategory": "asdidsfsdfsf",
                      //   "reason": reasonController.text,
                      //   "ownersname": ownerNameController.text,
                      //   "address": addressController.text.toString(),
                      //   "email": emailController.text,
                      //   "phone": phoneController.text
                      //
                      // };

                      StartingRepair map = new StartingRepair(serialNoController.text, checkingFeeController.text, valueChoose, itemModelController.text, reasonController.text,
                          ownerNameController.text, addressController.text, emailController.text, phoneController.text);

                      // var i = jsonEncode(map);

                      // StartRepairData.startTheRepair(map).then((value) {
                      //   if(value != null){
                      //     Navigator.of(context).pushReplacementNamed("/repair_summary",arguments: RepairDetailArgs(valueChoose, itemModelController.text, serialNoController.text, reasonController.text,
                      //         ownerNameController.text, addressController.text, emailController.text, phoneController.text, checkingFeeController.text, value));
                      //   } else{
                      //     final snackBar = SnackBar(content: Text('Error Occurred, \nPlease try again'));
                      //     Scaffold.of(context).showSnackBar(snackBar);
                      //   }
                      // });

                      TextStyle textStyle2 = GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54
                      );



                      showGeneralDialog(context: context,
                          barrierDismissible: false,
                          pageBuilder: (BuildContext context, _, __) {
                        return WillPopScope(
                          //disabling back button
                          onWillPop: () async => false,
                          child: Scaffold(
                            backgroundColor: Colors.transparent,
                            body: Center(
                              child: FutureBuilder(
                                future: StartRepairData.startTheRepair(map),
                                builder: (BuildContext context, AsyncSnapshot snapshot){
                                  if(snapshot.connectionState == ConnectionState.done) {
                                    if (snapshot.data != null) {
                                      // Navigator.of(context).pushReplacementNamed("/repair_summary",arguments: RepairDetailArgs(valueChoose, itemModelController.text, serialNoController.text, reasonController.text,
                                      //     ownerNameController.text, addressController.text, emailController.text, phoneController.text, checkingFeeController.text, snapshot.data));

                                      return Container(
                                        height: size.height*0.65,
                                        child: FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Container(
                                            height: size.height*0.63,
                                            decoration: BoxDecoration(
                                                color: Colors.grey[300],
                                                borderRadius: BorderRadius.all(Radius.circular(15))
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(vertical:25.0, horizontal: 12),
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
                                                          child: Center(child: AutoSizeText(snapshot.data.toString())),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 30,
                                                  ),

                                                  Text(ownerNameController.text.toString(),
                                                    style: textStyle2,),
                                                  SizedBox(height: 10,),

                                                  Text("category : " + valueChoose.toString(),
                                                    style: textStyle2,),
                                                  SizedBox(height: 10,),

                                                  Text(itemModelController.text.toString(),
                                                    style: textStyle2,),
                                                  SizedBox(height: 10,),

                                                  Text("Serial No : " + serialNoController.text.toString(),
                                                    style: textStyle2,),
                                                  SizedBox(height: 10,),

                                                  Text(reasonController.text.toString(),
                                                    maxLines: 5,
                                                    style: textStyle2,),
                                                  SizedBox(height: 10,),

                                                  Text("phone : " + phoneController.text.toString(),
                                                    style: textStyle2,),
                                                  SizedBox(height: 10,),

                                                  Text("Checking Fee : Rs. " + checkingFeeController.text.toString(),
                                                    style: textStyle2,),

                                                  Spacer(),

                                                  Row(
                                                    children: [
                                                      SizedBox(width: size.width*0.2,),
                                                      InkWell(
                                                        onTap: () async {

                                                          if(phoneController.text.length > 8) {

                                                            // SmsSender sender = new SmsSender();
                                                            // sender.sendSms(new SmsMessage(phoneController.text, "Your " + itemModelController.text + " is received by PSK Consultants to check."));

                                                          }


                                                          itemModelController.text = "";
                                                          serialNoController.text = "";
                                                          reasonController.text = "";
                                                          ownerNameController.text = "";
                                                          addressController.text = "";
                                                          emailController.text = "";
                                                          phoneController.text = "";
                                                          checkingFeeController.text = "";

                                                          Navigator.of(context).pushReplacementNamed("/home");
                                                        },
                                                        child: Container(
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
                                                        ),
                                                      )
                                                    ],
                                                  ),

                                                  SizedBox(height: 5,),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                    children: [
                                                      SizedBox(width: size.width*0.16,),
                                                      AutoSizeText(
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
                                        ),
                                      );

                                    } else {
                                      return DialogWidget(title: "Error Occurred\n Please try again \n(If the problem persists contact the developers)", page: "pop",);
                                    }
                                  } else {
                                    return Center(
                                      child: CircularProgressIndicator()
                                    );
                                  }
                                },),
                            ),
                          ),
                        );
                      });
                      
                      
                      // return FutureBuilder(
                      //   future: StartRepairData.startTheRepair(map),
                      // builder: (BuildContext context, AsyncSnapshot snapshot){
                      //   if(snapshot.connectionState == ConnectionState.done) {
                      //     if (snapshot.data != null) {
                      //       Navigator.of(context).pushReplacementNamed("/repair_summary",arguments: RepairDetailArgs(valueChoose, itemModelController.text, serialNoController.text, reasonController.text,
                      //           ownerNameController.text, addressController.text, emailController.text, phoneController.text, checkingFeeController.text, snapshot.data));
                      //       return null;
                      //     } else {
                      //       return Center(
                      //         child: AutoSizeText(
                      //           "Error Occurred\n Please try again \n(If the problem persists contact the developers)",
                      //           style: GoogleFonts.poppins(fontSize: 17),
                      //         )
                      //       );
                      //     }
                      //   } else {
                      //     return Center(
                      //       child: Image(
                      //         image: AssetImage("assets/loading_dots.gif"),
                      //         height: 100,
                      //         width: 100,
                      //       ),
                      //     );
                      //   }
                      // },);

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
