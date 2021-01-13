import 'package:auto_size_text/auto_size_text.dart';
import 'package:crm/global/default_background.dart';
import 'package:crm/logic/list_view_page.dart';
import 'package:crm/models/list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListViewScreen extends StatefulWidget {
  @override
  _ListViewScreenState createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {

  GlobalKey<RefreshIndicatorState> refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute
        .of(context)
        .settings
        .arguments;
    final size = MediaQuery
        .of(context)
        .size;

    return DefaultBackground(
        title: args,
        interior: RefreshIndicator(
          key: refreshKey,
          onRefresh: () async {
            setState(() {});
          },
          child: FutureBuilder(
            future: ListViewData.getListData(args),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.data != null) {
                  ListViewModel listViewModel = snapshot.data;
                  if (listViewModel.content.length > 0) {
                    return ListView.builder(
                        itemCount: listViewModel.content.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.all(15),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    if (args == "Checking List") {
                                      Navigator.of(context).pushNamed("/checking_list_item", arguments: args);
                                    } else if (args == "Checking Finished List") {
                                      Navigator.of(context).pushNamed("/checking_finished_list_item", arguments: args);
                                    }
                                  },
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 5,
                                        child: AutoSizeText(
                                          listViewModel.content[index].itemmodel,
                                          style: GoogleFonts.poppins(color: Colors.black87, fontWeight: FontWeight.w600, fontSize: 18),
                                        ),
                                      ),
                                      Expanded(
                                          flex: 4,
                                          child: AutoSizeText(
                                            listViewModel.content[index].ownersname,
                                            style: GoogleFonts.poppins(
                                              color: Colors.black54,
                                            ),
                                          )),
                                      Expanded(
                                          flex: 2,
                                          child: AutoSizeText(
                                            listViewModel.content[index].invoiceno.toString(),
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
                        });
                  } else {
                    return SingleChildScrollView(
                      child: Container(
                        height: size.height,
                        child: Center(
                          child: AutoSizeText(
                            "0 items\n Pull to refresh",
                            style: GoogleFonts.poppins(fontSize: 17),
                          ),
                        ),
                      ),
                    );
                  }
                } else {
                  return SingleChildScrollView(
                    child: Container(
                      height: size.height,
                      child: Center(
                        child: AutoSizeText(
                          "No Data \n pull to refresh",
                          style: GoogleFonts.poppins(fontSize: 17),
                        ),
                      ),
                    ),
                  );
                }
              } else {
                return Center(
                  child: Image(
                    image: AssetImage("assets/loading_dots.gif"),
                    height: 100,
                    width: 100,
                  ),
                );
              }
            },
          ),
        ));
  }
}