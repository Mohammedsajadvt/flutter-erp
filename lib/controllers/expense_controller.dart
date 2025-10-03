import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/expense_form_data.dart';
import '../models/expense_item.dart';

class ExpenseController extends GetxController {
  var formData = ExpenseFormData().obs;
  var items = <ExpenseItem>[].obs;

  var subtotal = 0.0.obs;
  var discount = 0.0.obs;
  var discountPercent = 0.0.obs;
  var charges = 0.0.obs;
  var tax = 0.0.obs;
  var total = 0.0.obs;

  TextEditingController voucherNumberController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController dueDateController = TextEditingController();
  TextEditingController reference1Controller = TextEditingController();
  TextEditingController reference2Controller = TextEditingController();
  TextEditingController customerPOController = TextEditingController();
  TextEditingController vehicleNameController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  TextEditingController selectedFileController = TextEditingController();
final TextEditingController billToController = TextEditingController();
  TextEditingController subtotalController = TextEditingController(text: '0.00');
  TextEditingController discountAmountController = TextEditingController(text: '0.00');
  TextEditingController discountPercentController = TextEditingController(text: '0');
  TextEditingController chargesController = TextEditingController(text: '0.00');
  TextEditingController taxController = TextEditingController(text: '0.00');
  TextEditingController roundOffController = TextEditingController(text: '0.00');
  TextEditingController totalController = TextEditingController(text: '0.00');

  TextEditingController newExpenseCodeController = TextEditingController();
  TextEditingController newDescriptionController = TextEditingController();
  TextEditingController newRefController = TextEditingController();
  TextEditingController newTaxController = TextEditingController(text: '0');
  TextEditingController newQuantityController = TextEditingController(text: '1');
  TextEditingController newAmountController = TextEditingController(text: '0.00');

  var docIds = ['DOC1', 'DOC2'].obs;
  var customerIds = ['CUST1', 'CUST2'].obs;
  var drivers = ['Driver1', 'Driver2'].obs;
  var vehicles = ['Vehicle1', 'Vehicle2'].obs;
  var shipTos = ['ShipTo1', 'ShipTo2'].obs; 
  var paymentTerms = ['Term1', 'Term2'].obs; 
  var salespersons = ['Sales1', 'Sales2'].obs; 
  var shippings = ['Shipping1', 'Shipping2'].obs; 
  var taxGroups = ['TaxGroup1', 'TaxGroup2'].obs; 
  var currencies = ['USD', 'EUR'].obs; 

  void addItem(ExpenseItem item) {
    items.add(item);
    calculateTotals();
  }

  void removeItem(int index) {
    items.removeAt(index);
    calculateTotals();
  }

  void updateItem(int index, ExpenseItem item) {
    items[index] = item;
    calculateTotals();
  }

  void calculateTotals() {
    double totalAmount = items.fold(0.0, (sum, item) => sum + item.amount * item.quantity);
    subtotal.value = totalAmount;
    tax.value = items.fold(0.0, (sum, item) => sum + (item.amount * item.quantity * item.tax / 100));
    total.value = subtotal.value + tax.value + charges.value - discount.value;

    subtotalController.text = subtotal.value.toStringAsFixed(2);
    chargesController.text = charges.value.toStringAsFixed(2);
    taxController.text = tax.value.toStringAsFixed(2);
    totalController.text = total.value.toStringAsFixed(2);
    roundOffController.text = (total.value % 1).toStringAsFixed(2);
    discountPercent.value = subtotal.value != 0 ? (discount.value / subtotal.value) * 100 : 0;
    discountPercentController.text = discountPercent.value.toStringAsFixed(0);
    discountAmountController.text = discount.value.toStringAsFixed(2);
  }

  void updateDiscount(double value) {
    discount.value = value;
    discountPercent.value = subtotal.value != 0 ? (value / subtotal.value) * 100 : 0;
    calculateTotals();
  }

  void updateCharges(double value) {
    charges.value = value;
    calculateTotals();
  }

  void updateDiscountPercent(double percent) {
    discountPercent.value = percent;
    discount.value = subtotal.value * percent / 100;
    calculateTotals();
  }

  void saveForm() {
    Get.snackbar('Success', 'Form saved successfully');
  }

  void cancelForm() {
    items.clear();
    formData.value = ExpenseFormData();
    calculateTotals();
    voucherNumberController.clear();
    dateController.clear();
    dueDateController.clear();
    reference1Controller.clear();
    reference2Controller.clear();
    customerPOController.clear();
    vehicleNameController.clear();
    noteController.clear();
    selectedFileController.clear();
    subtotalController.text = '0.00';
    discountAmountController.text = '0.00';
    discountPercentController.text = '0';
    chargesController.text = '0.00';
    taxController.text = '0.00';
    roundOffController.text = '0.00';
    totalController.text = '0.00';
    newExpenseCodeController.clear();
    newDescriptionController.clear();
    newRefController.clear();
    newTaxController.text = '0';
    newQuantityController.text = '1';
    newAmountController.text = '0.00';
  }

  void voidForm() {
    Get.snackbar('Void', 'Form voided');
  }

  void deleteForm() {
    Get.defaultDialog(
      title: 'Confirm Delete',
      middleText: 'Are you sure you want to delete?',
      onConfirm: () {
        Get.back();
      },
    );
  }

  void addNewItem() {
    try {
      var item = ExpenseItem(
        expenseCode: newExpenseCodeController.text,
        description: newDescriptionController.text,
        ref: newRefController.text,
        tax: double.parse(newTaxController.text),
        quantity: int.parse(newQuantityController.text),
        amount: double.parse(newAmountController.text),
      );
      addItem(item);
      newExpenseCodeController.clear();
      newDescriptionController.clear();
      newRefController.clear();
      newTaxController.text = '0';
      newQuantityController.text = '1';
      newAmountController.text = '0.00';
    } catch (e) {
      Get.snackbar('Error', 'Invalid input data');
    }
  }
}
