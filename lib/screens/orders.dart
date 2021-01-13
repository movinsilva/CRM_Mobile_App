import 'package:auto_size_text/auto_size_text.dart';
import 'package:crm/global/default_background.dart';
import 'package:crm/logic/orders_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Orders extends StatefulWidget {
  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  GlobalKey<RefreshIndicatorState> refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    List ordersList = [
      "Checking List",
      "Checking Finished List",
      "Started List",
      "Completed List",
      "History"
    ];

    return DefaultBackground(
        title: "Orders",
        interior: RefreshIndicator(
          key: refreshKey,
          onRefresh: () async {
            setState(() {});
          },
          child: FutureBuilder(
            future: OrdersData.getOrderNumbers(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.data != null) {
                  List orderNumbers = snapshot.data;
                  return ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () => Navigator.of(context).pushNamed("/listView", arguments: ordersList[index]),
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                                color: Colors.white,
                                boxShadow: [BoxShadow(color: Colors.black, blurRadius: 17, offset: Offset(0, 0), spreadRadius: -15)]
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AutoSizeText(ordersList[index],
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18
                                    ),),
                                  AutoSizeText((orderNumbers[index] is int)? "\t\t\t" + orderNumbers[index].toString() + " orders": "\t\t\t0 Orders",
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17,
                                        color: Colors.black54
                                    ),),
                                ],
                              ),
                            ),
                          ),
                        );
                      });
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
