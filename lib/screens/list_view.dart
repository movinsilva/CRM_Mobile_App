import 'package:auto_size_text/auto_size_text.dart';
import 'package:crm/global/default_background.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments;

    return DefaultBackground(
        title: args,
        interior: ListView.builder(
            itemCount: 6,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(15),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        if(args == "Checking List") {
                          Navigator.of(context).pushNamed("/checking_list_item", arguments: args);
                        } else if(args == "Checking Finished List"){
                          Navigator.of(context).pushNamed("/checking_finished_list_item", arguments: args);
                        }
                      },
                      child: Row(
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
            }));
  }
}
