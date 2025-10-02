import 'package:erp/models/expense_item.dart';

class ExpenseFormData {
  String? docId;
  String? voucherNumber;
  String? customerId;
  String? billNo;
  String? shipTo;
  String? paymentTerm;
  DateTime? dueDate;
  String? taxGroup;
  DateTime? date;
  String? reference1;
  String? reference2;
  String? customerPO;
  String? salesperson;
  String? currency;
  String? driver;
  String? vehicle;
  String? vehicleName;
  String? shippingMethod;
  String?shipping;
  String? selectedFile;
  List<ExpenseItem> items;
  String? note;
  double subtotal;
  double discount;
  double charges;
  double tax;
  double roundOff;
  double total;

  ExpenseFormData({
    this.docId,
    this.voucherNumber,
    this.customerId,
    this.billNo,
    this.shipTo,
    this.paymentTerm,
    this.dueDate,
    this.taxGroup,
    this.date,
    this.reference1,
    this.reference2,
    this.customerPO,
    this.salesperson,
    this.currency,
    this.driver,
    this.vehicle,
    this.vehicleName,
    this.shippingMethod,
    this.items = const [],
    this.note,
    this.subtotal = 0.0,
    this.discount = 0.0,
    this.charges = 0.0,
    this.tax = 0.0,
    this.roundOff = 0.0,
    this.total = 0.0,
    this.selectedFile,
    this.shipping,
  });
}