class RepairDetailArgs{
  final invoiceId;
  final itemCategory;
  final itemModel;
  final serialNo;
  final reason;
  final ownerName;
  final address;
  final email;
  final phone;
  final checkingFee;

  RepairDetailArgs(this.itemCategory, this.itemModel, this.serialNo, this.reason, this.ownerName, this.address, this.email, this.phone, this.checkingFee, this.invoiceId);


}