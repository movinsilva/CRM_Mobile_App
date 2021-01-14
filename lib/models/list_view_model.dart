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
    this.itemmodel,
    this.itemfault,
    this.timetocomplete,
    this.estimatedfee,
    this.depositamount,
    this.declinedreason,
    this.finalamount,
  });

  var serialno;
  var invoiceno;
  var checkingfees;
  dynamic date;
  String itemcategory;
  String reason;
  String ownersname;
  String address;
  dynamic email;
  dynamic phone;
  String itemmodel;
  String itemfault;
  var timetocomplete;
  var estimatedfee;
  var depositamount;
  String declinedreason;
  var finalamount;

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
    itemmodel: json["itemmodel"],
    itemfault: json["itemfault"],
    timetocomplete: json["timetocomplete"],
    estimatedfee: json["estimatedfee"],
    depositamount: json["depositamount"],
    declinedreason: json["declinedreason"],
    finalamount: json["finalamount"],
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
    "itemmodel": itemmodel,
    "itemfault": itemfault,
    "timetocomplete": timetocomplete,
    "estimatedfee": estimatedfee,
    "depositamount": depositamount,
    "declinedreason": declinedreason,
    "finalamount": finalamount,
  };
}
