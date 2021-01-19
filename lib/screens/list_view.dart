import 'package:auto_size_text/auto_size_text.dart';
import 'package:crm/args/checking_finished_list_item_details.dart';
import 'package:crm/args/checking_list_item_details.dart';
import 'package:crm/args/started_list_item_details.dart';
import 'package:crm/global/default_background.dart';
import 'package:crm/logic/list_view_page.dart';
import 'package:crm/models/history_model.dart';
import 'package:crm/models/list_view_model.dart';
import 'package:crm/provider_models/tab_view_model.dart';
import 'package:crm/widgets/global/tab_layout.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:intl/intl.dart';

import 'completed_history.dart';
import 'declined_history.dart';

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

                    if(args == "History"){

                      List<HistoryModel> completedHistoryList = [];
                      List<HistoryModel> declinedHistoryList = [];
                      for (var i = 0; i < listViewModel.content.length; i++){
                        HistoryModel historyModel= new HistoryModel(listViewModel.content[i].itemmodel, listViewModel.content[i].ownersname, listViewModel.content[i].invoiceno);
                        if(listViewModel.content[i].declinedreason.isEmpty){
                          completedHistoryList.add(historyModel);
                        } else {
                          declinedHistoryList.add(historyModel);
                        }
                      }


                      return Column(
                        children: <Widget>[
                          TabLayout(["Completed", "Declined"]),
                          Consumer<TabViewModel>(
                            builder: (context, model, widget) {
                              switch (model.index) {
                                case 0:
                                  return CompletedHistory(completedHistoryList: completedHistoryList,);
                                case 1:
                                  return DeclinedHistory(declinedHistoryList: declinedHistoryList,);
                                default:
                                  return Placeholder();
                              }
                            },
                          ),
                        ],
                      );

                    }  else {
                      return ListView.builder(
                          itemCount:  listViewModel.content.length,
                          itemBuilder: (context, index) {



                            return Container(
                              margin: EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () {

                                       // final DateFormat formatter = DateFormat('yyyy-MM-dd');
                                       // final String formatted = formatter.format(listViewModel.content[index].date);

                                      if (args == "Checking List") {



                                        CheckingListItemDetails map1 = CheckingListItemDetails(listViewModel.content[index].itemmodel, listViewModel.content[index].ownersname,
                                            listViewModel.content[index].invoiceno, listViewModel.content[index].checkingfees, listViewModel.content[index].date, "Checking List", listViewModel.content[index].phone);

                                        Navigator.of(context).pushNamed("/checking_list_item", arguments: map1);
                                      } else if (args == "Checking Finished List") {
                                        CheckingFinishedListItemDetails map2 = CheckingFinishedListItemDetails(
                                            listViewModel.content[index].itemmodel,
                                            listViewModel.content[index].ownersname,
                                            listViewModel.content[index].invoiceno,
                                            listViewModel.content[index].date,
                                            listViewModel.content[index].itemfault,
                                            listViewModel.content[index].timetocomplete,
                                            listViewModel.content[index].checkingfees,
                                            listViewModel.content[index].estimatedfee,
                                            args,
                                        listViewModel.content[index].phone);
                                        Navigator.of(context).pushNamed("/checking_finished_list_item", arguments: map2);
                                      } else if (args == "Started List" || args == "Completed List") {
                                        StartedListItemDetails map3 = StartedListItemDetails(
                                            listViewModel.content[index].itemmodel,
                                            listViewModel.content[index].ownersname,
                                            listViewModel.content[index].invoiceno,
                                            listViewModel.content[index].date,
                                            listViewModel.content[index].itemfault,
                                            listViewModel.content[index].timetocomplete,
                                            listViewModel.content[index].checkingfees,
                                            listViewModel.content[index].estimatedfee,
                                            listViewModel.content[index].depositamount,
                                            args,
                                        listViewModel.content[index].phone);

                                        if (args == "Started List") {
                                          Navigator.of(context).pushNamed("/started_list_item", arguments: map3);
                                        } else if (args == "Completed List") {
                                          Navigator.of(context).pushNamed("/completed_list_item", arguments: map3);
                                        }
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
                    }


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