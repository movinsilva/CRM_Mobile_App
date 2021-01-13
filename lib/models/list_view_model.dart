// To parse this JSON data, do
//
//     final listViewModel = listViewModelFromJson(jsonString);

import 'dart:convert';

ListViewModel listViewModelFromJson(String str) => ListViewModel.fromJson(json.decode(str));

String listViewModelToJson(ListViewModel data) => json.encode(data.toJson());

class ListViewModel {
  ListViewModel({
    this.success,
    this.content,
  });

  bool success;
  List<Content> content;

  factory ListViewModel.fromJson(Map<String, dynamic> json) => ListViewModel(
    success: json["success"],
    content: List<Content>.from(json["content"].map((x) => Content.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "content": List<dynamic>.from(content.map((x) => x.toJson())),
  };
}

class Content {
  Content({
    this.serialno,
    this.invoiceno,
    this.checkingfees,
    this.date,
    this.itemcategory,
    this.reason,
    this.ownersname,
    this.address,
    this.email,
    this.phone,
    this.status,
    this.itemmodel,
  });

  var serialno;
  int invoiceno;
  var checkingfees;
  dynamic date;
  String itemcategory;
  String reason;
  String ownersname;
  String address;
  dynamic email;
  dynamic phone;
  int status;
  String itemmodel;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
    serialno: json["serialno"],
    invoiceno: json["invoiceno"],
    checkingfees: json["checkingfees"],
    date: json["date"],
    itemcategory: json["itemcategory"],
    reason: json["reason"],
    ownersname: json["ownersname"],
    address: json["address"],
    email: json["email"],
    phone: json["phone"],
    status: json["status"],
    itemmodel: json["itemmodel"],
  );

  Map<String, dynamic> toJson() => {
    "serialno": serialno,
    "invoiceno": invoiceno,
    "checkingfees": checkingfees,
    "date": date,
    "itemcategory": itemcategory,
    "reason": reason,
    "ownersname": ownersname,
    "address": address,
    "email": email,
    "phone": phone,
    "status": status,
    "itemmodel": itemmodel,
  };
}
