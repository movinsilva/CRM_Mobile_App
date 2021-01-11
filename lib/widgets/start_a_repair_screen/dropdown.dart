import 'package:crm/screens/start_a_repair.dart';
import 'package:flutter/material.dart';

class Dropdown extends StatefulWidget {

  @override
  _DropdownState createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  List listItem = ["TV", "Radio", "Speakers", "Computers", "Monitors", "Air Conditioner"];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(12)), border: Border.all(color: Colors.black38)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: DropdownButton<String>(
          hint: Text("Select"),
          items: listItem.map((valueItem) {
            return DropdownMenuItem<String>(
              child: Text(valueItem),
              value: valueItem,
            );
          }).toList(),
          onChanged: (newValue) {
            setState(() {
              StartARepair.valueChoose = newValue;
            });
          },
          value: StartARepair.valueChoose,
        ),
      ),
    );
  }
}
