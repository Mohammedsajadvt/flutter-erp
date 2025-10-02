import 'package:erp/controllers/expense_controller.dart';
import 'package:erp/models/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataTableWidget extends StatelessWidget {
  final ExpenseController controller;

  // ignore: use_key_in_widget_constructors
  const DataTableWidget({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        children: [
          Row(
            children: [
              _buildTab('ITEMS', true),
              _buildTab('CHARGES', false),
            ],
          ),
          Container(
            color: Colors.teal[100],
            child: Row(
              children: [
                Expanded(flex: 2, child: _buildHeaderCell('Expense Code')),
                Expanded(flex: 3, child: _buildHeaderCell('Description')),
                Expanded(flex: 1, child: _buildHeaderCell('Ref')),
                Expanded(flex: 1, child: _buildHeaderCell('Tax')),
                Expanded(flex: 1, child: _buildHeaderCell('Quantity')),
                Expanded(flex: 2, child: _buildHeaderCell('Amount')),
                Expanded(flex: 1, child: _buildHeaderCell('Action')),
              ],
            ),
          ),
          Obx(() => Column(
            children: controller.items.map((item) => _buildTableRow(item)).toList(),
          )),
          _buildInputRow(),
          _buildEmptyRow(),
        ],
      ),
    );
  }

  Widget _buildTab(String title, bool isActive) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      decoration: BoxDecoration(
        color: isActive ? Colors.teal[100] : Colors.grey[200],
        border: Border(right: BorderSide(color: Colors.grey)),
      ),
      child: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildHeaderCell(String text) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(text, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
    );
  }

  Widget _buildTableRow(ExpenseItem item) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
      ),
      child: Row(
        children: [
          Expanded(flex: 2, child: _buildCell(item.expenseCode)),
          Expanded(flex: 3, child: _buildCell(item.description)),
          Expanded(flex: 1, child: _buildCell(item.ref)),
          Expanded(flex: 1, child: _buildCell(item.tax.toString())),
          Expanded(flex: 1, child: _buildCell(item.quantity.toString())),
          Expanded(flex: 2, child: _buildCell(item.amount.toString())),
          Expanded(flex: 1, child: Padding(padding: EdgeInsets.all(8.0), child: IconButton(icon: Icon(Icons.edit, size: 16), onPressed: (){}, ), )),
        ],
      ),
    );
  }

  Widget _buildEmptyRow() {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
      ),
      child: Row(
        children: [
          Expanded(flex: 2, child: _buildCell('')),
          Expanded(flex: 3, child: _buildCell('')),
          Expanded(flex: 1, child: _buildCell('')),
          Expanded(flex: 1, child: _buildCell('0')),
          Expanded(flex: 1, child: _buildCell('0')),
          Expanded(flex: 2, child: _buildCell('0.00')),
          Expanded(flex: 1, child: _buildCell('')),
        ],
      ),
    );
  }

  Widget _buildInputRow() {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
      ),
      child: Row(
        children: [
          Expanded(flex: 2, child: _buildTextField(controller.newExpenseCodeController)),
          Expanded(flex: 3, child: _buildTextField(controller.newDescriptionController)),
          Expanded(flex: 1, child: _buildTextField(controller.newRefController)),
          Expanded(flex: 1, child: _buildNumberField(controller.newTaxController)),
          Expanded(flex: 1, child: _buildNumberField(controller.newQuantityController)),
          Expanded(flex: 2, child: _buildNumberField(controller.newAmountController)),
          Expanded(flex: 1, child: Container(alignment: Alignment.center, child: IconButton(icon: Icon(Icons.add, size: 16), onPressed: controller.addNewItem))),
        ],
      ),
    );
  }

  Widget _buildNumberField(TextEditingController controller) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        style: TextStyle(fontSize: 12),
        decoration: InputDecoration(
          border: InputBorder.none,
          isDense: true,
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        style: TextStyle(fontSize: 12),
        decoration: InputDecoration(
          border: InputBorder.none,
          isDense: true,
        ),
      ),
    );
  }

  Widget _buildCell(String text) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(text, style: TextStyle(fontSize: 12)),
    );
  }
}
