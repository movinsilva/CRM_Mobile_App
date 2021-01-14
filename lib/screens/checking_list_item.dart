import 'package:auto_size_text/auto_size_text.dart';
import 'package:crm/args/checking_list_item_details.dart';
import 'package:crm/global/default_background.dart';
import 'package:crm/logic/checking_list_item_page.dart';
import 'package:crm/widgets/global/dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckingListItem extends StatelessWidget {

  static TextEditingController itemFaultController = TextEditingController();
  static TextEditingController daysController = TextEditingController();
  static TextEditingController estimatedFeeController = TextEditingController();
  static TextEditingController depositAmountController = TextEditingController();
  static TextEditingController declinedReasonController = TextEditingController();

  TextStyle textStyle = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  @override
  Widget build(BuildContext context) {

    CheckingListItemDetails args = ModalRoute.of(context).settings.arguments;

    final double horizontalpaddingforTextField = 8;
    final double verticalPaddingforTextField = 4;

    const double leftOutSidePaddingforTextField = 50;
    const double rightOutSidePaddingForTextField = 70;

    return DefaultBackground(
      title: args.title,
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
                      args.itemModel.toString(),
                      style: GoogleFonts.poppins(color: Colors.black87, fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                  ),
                  Expanded(
                      flex: 4,
                      child: AutoSizeText(
                        args.ownerName.toString(),
                        style: GoogleFonts.poppins(
                          color: Colors.black54,
                        ),
                      )),
                  Expanded(
                      flex: 2,
                      child: AutoSizeText(
                        args.invoiceNo.toString(),
                        maxLines: 1,
                        style: GoogleFonts.poppins(color: Colors.grey[700], fontSize: 15, fontWeight: FontWeight.w500),
                      ))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              AutoSizeText("Rs. " + args.checkingFee.toString() + " for checking",
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
                  controller: itemFaultController,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: horizontalpaddingforTextField, vertical: verticalPaddingforTextField),
                  ),
                ),
              ),


              SizedBox(height: 20,),
              AutoSizeText("Estimated days to Complete",
                style: textStyle,),
              Padding(
                padding: const EdgeInsets.only(left: leftOutSidePaddingforTextField, right: rightOutSidePaddingForTextField),
                child:
                TextFormField(
                  controller: daysController,
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
                  controller: estimatedFeeController,
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
                  controller: depositAmountController,
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
                  InkWell(
                    onTap: () {
                      // CheckingListItemData.moveToCheckedOverList(args.invoiceNo.toString(), itemFaultController.text.toString(), daysController.text.toString(),
                      //     estimatedFeeController.text.toString(), depositAmountController.text.toString(), "");

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
                                    future: CheckingListItemData.moveToCheckedOverList(args.invoiceNo.toString(), itemFaultController.text.toString(), daysController.text.toString(),
                                        estimatedFeeController.text.toString(), depositAmountController.text.toString(), ""),
                                    builder: (BuildContext context, AsyncSnapshot snapshot){
                                      if(snapshot.connectionState == ConnectionState.done) {
                                        if (snapshot.data != null) {

                                          if(snapshot.data) {
                                            itemFaultController.text = "";
                                            daysController.text = "";
                                            estimatedFeeController.text = "";
                                            depositAmountController.text = "";
                                            declinedReasonController.text = "";
                                            return DialogWidget(title: "Successfully Moved", page: "/home",);
                                          } else {
                                            return DialogWidget(title: "Error Occurred while processing the request\n Please try again \n(If the problem persists contact the developers)", page: "pop",);
                                          }

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
                            "Submit",
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
                children: [ AutoSizeText(
                          "Moving to checking finished list",
                          style: GoogleFonts.poppins(
                            color: Colors.black54,
                            fontSize: 10
                          ),
                        ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(width: double.infinity,height: 2,color: Colors.grey,),

              SizedBox(height: 35,),
              AutoSizeText("Reason to decline",
                style: textStyle,),
              Padding(
                padding: const EdgeInsets.only(left: leftOutSidePaddingforTextField),
                child:
                TextFormField(
                  controller: declinedReasonController,
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
                  InkWell(
                    onTap: () {
                      // CheckingListItemData.moveToCheckedOverList(args.invoiceNo.toString(), itemFaultController.text.toString(), daysController.text.toString(),
                      //     estimatedFeeController.text.toString(), depositAmountController.text.toString(), "");

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
                                    future: CheckingListItemData.moveToCheckedOverList(args.invoiceNo.toString(), "", "",
                                        "", "", declinedReasonController.text.toString()),
                                    builder: (BuildContext context, AsyncSnapshot snapshot){
                                      if(snapshot.connectionState == ConnectionState.done) {
                                        if (snapshot.data != null) {

                                          if(snapshot.data) {

                                            itemFaultController.text = "";
                                            daysController.text = "";
                                            estimatedFeeController.text = "";
                                            depositAmountController.text = "";
                                            declinedReasonController.text = "";

                                            return DialogWidget(title: "Successfully Declined", page: "/home",);

                                          } else {

                                            return DialogWidget(title: "Error Occurred while processing the request\n Please try again \n(If the problem persists contact the developers)",
                                              page: "pop",);

                                          }

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

                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(13)),
                          color: Colors.red[400]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5),
                        child: Center(
                          child: AutoSizeText(
                            "Decline Repair",
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
                children: [ AutoSizeText(
                  "Moving to declined history",
                  style: GoogleFonts.poppins(
                      color: Colors.black54,
                      fontSize: 10
                  ),
                ),
                ],
              ),

              SizedBox(
                height: 400,
              )

            ],
          ),
        ),
      ),
    );
  }
}
