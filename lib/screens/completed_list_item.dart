import 'package:auto_size_text/auto_size_text.dart';
import 'package:crm/args/started_list_item_details.dart';
import 'package:crm/global/default_background.dart';
import 'package:crm/logic/completed_list_item_page.dart';
import 'package:crm/screens/started_list_item.dart';
import 'package:crm/widgets/global/dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CompletedListIem extends StatelessWidget {

  static TextEditingController finalPaidAmountController = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    final StartedListItemDetails args = ModalRoute.of(context).settings.arguments;

    return DefaultBackground(
      title: args.title,
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
                      args.itemModel,
                      style: GoogleFonts.poppins(color: Colors.black87, fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                  ),
                  Expanded(
                      flex: 4,
                      child: AutoSizeText(
                        args.ownerName,
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
                height: 25,
              ),
              AutoSizeText(args.itemFault,
                style: GoogleFonts.poppins(
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                    fontSize: 18
                ),),


              SizedBox(
                height: 25,
              ),
              AutoSizeText("Created date : " + args.createdDate.toString().substring(0,10),
                style: GoogleFonts.poppins(
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                    fontSize: 18
                ),),

              SizedBox(
                height: 8,
              ),
              AutoSizeText(args.daysToComplete.toString() + " days to complete",
                style: GoogleFonts.poppins(
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                    fontSize: 18
                ),),

              SizedBox(
                height: 8,
              ),
              AutoSizeText("Rs. "+ args.checkingFee.toString() +" for checking",
                style: GoogleFonts.poppins(
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                    fontSize: 18
                ),),

              SizedBox(
                height: 8,
              ),
              AutoSizeText("Rs. " + args.estimatedFee.toString() + " estimated fee",
                style: GoogleFonts.poppins(
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                    fontSize: 18
                ),),


              SizedBox(
                height: 8,
              ),
              AutoSizeText("Rs. " + args.depositedAmount.toString() + " paid as advanced",
                style: GoogleFonts.poppins(
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                    fontSize: 18
                ),),


              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  AutoSizeText("Remaining Amount to be paid",
                    style: GoogleFonts.poppins(
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                        fontSize: 18
                    ),),
                  Spacer(),
                  AutoSizeText((args.checkingFee + args.estimatedFee - args.depositedAmount).toString(),
                    style: GoogleFonts.poppins(
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                        fontSize: 18
                    ),)
                ],
              ),


              SizedBox(height: 40,),
              AutoSizeText("Final paid amount",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 70),
                child:
                TextFormField(
                  controller: finalPaidAmountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  ),
                ),
              ),


              SizedBox(height: 30,),



              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {

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
                                    future: CompletedListIemData.moveToHistory(args.invoiceNo.toString(), finalPaidAmountController.text.toString()),
                                    builder: (BuildContext context, AsyncSnapshot snapshot){
                                      if(snapshot.connectionState == ConnectionState.done) {
                                        if (snapshot.data != null) {

                                          if(snapshot.data) {
                                            finalPaidAmountController.text = "";
                                            return DialogWidget(title: "Successfully Moved to History", page: "/home",);
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
                  "Moving to history",
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
