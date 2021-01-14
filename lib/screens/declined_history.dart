import 'package:auto_size_text/auto_size_text.dart';
import 'package:crm/models/history_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeclinedHistory extends StatelessWidget {

  final List<HistoryModel> declinedHistoryList;

  const DeclinedHistory({Key key, this.declinedHistoryList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20,),
        ListView.builder(
          shrinkWrap: true,
            itemCount: declinedHistoryList.length,
            itemBuilder: (context, index){
              return Container(
                margin: EdgeInsets.all(15),
                child: Column(
                  children: [
                    InkWell(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 5,
                            child: AutoSizeText(
                              declinedHistoryList[index].itemModel,
                              style: GoogleFonts.poppins(color: Colors.black87, fontWeight: FontWeight.w600, fontSize: 18),
                            ),
                          ),
                          Expanded(
                              flex: 4,
                              child: AutoSizeText(
                                declinedHistoryList[index].ownerName,
                                style: GoogleFonts.poppins(
                                  color: Colors.black54,
                                ),
                              )),
                          Expanded(
                              flex: 2,
                              child: AutoSizeText(
                                declinedHistoryList[index].invoiceNo.toString(),
                                maxLines: 1,
                                style: GoogleFonts.poppins(color: Colors.grey[700], fontSize: 15, fontWeight: FontWeight.w500),
                              ))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Container(
                      height: 2,
                      width: double.infinity,
                      color: Colors.black26,
                    )
                  ],
                ),
              );
            })
      ],
    );
  }
}
