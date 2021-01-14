import 'package:crm/screens/authentication.dart';
import 'package:crm/screens/checking_finished_list_item.dart';
import 'package:crm/screens/checking_list_item.dart';
import 'package:crm/screens/completed_list_item.dart';
import 'package:crm/screens/home.dart';
import 'package:crm/screens/list_view.dart';
import 'package:crm/screens/login.dart';
import 'package:crm/screens/orders.dart';
import 'package:crm/screens/repair_summary.dart';
import 'package:crm/screens/start_a_repair.dart';
import 'package:crm/screens/started_list_item.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/login" : (context) => Login(),
        "/home" : (context) => Home(),
        "/start_a_repair" : (context) => StartARepair(),
        "/orders" : (context) => Orders(),
        "/listView" : (context) => ListViewScreen(),
        "/checking_list_item" : (context) => CheckingListItem(),
        "/checking_finished_list_item" : (context) => CheckingFinishedListItem(),
        "/repair_summary" : (context) => RepairSummary(),
        "/started_list_item" : (context) => StartedListItem(),
        "/completed_list_item" : (context) => CompletedListIem(),
      },
      home: Authentication(),
    );
  }
}


