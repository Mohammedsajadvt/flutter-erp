import 'package:erp/controllers/expense_controller.dart';
import 'package:erp/models/expense_item.dart';
import 'package:erp/views/widgets/custom_button.dart';
import 'package:erp/views/widgets/custom_dropdown.dart';
import 'package:erp/views/widgets/custom_text_field.dart';
import 'package:erp/views/widgets/data_table_widget.dart';
import 'package:erp/views/widgets/form_header.dart';
import 'package:erp/views/widgets/totals_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExpenseFormView extends StatelessWidget {
  final ExpenseController controller = Get.put(ExpenseController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          Widget content = Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FormHeader(),
                SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Column 1: Doc ID, Customer ID, Bill to, Shipping Method
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(width: 80, child: Text('Doc ID:', style: TextStyle(fontSize: 12))),
                              SizedBox(width: 8),
                              Expanded(child: DropdownButtonFormField<String>(
                                value: controller.formData.value.docId,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade400)),
                                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade400)),
                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade600)),
                                  isDense: true,
                                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                ),
                                icon: Icon(Icons.arrow_drop_down, size: 20),
                                items: controller.docIds.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                                onChanged: (value) => controller.formData.value.docId = value,
                              )),
                            ],
                          ),
                          SizedBox(height: 12),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(width: 100, child: Text('Customer ID:', style: TextStyle(fontSize: 12))),
                              SizedBox(width: 8),
                              Expanded(child: DropdownButtonFormField<String>(
                                value: controller.formData.value.customerId,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade400)),
                                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade400)),
                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade600)),
                                  isDense: true,
                                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                ),
                                icon: Icon(Icons.arrow_drop_down, size: 20),
                                items: controller.customerIds.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                                onChanged: (value) => controller.formData.value.customerId = value,
                              )),
                            ],
                          ),
                          SizedBox(height: 12),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(width: 80, child: Text('Bill to:', style: TextStyle(fontSize: 12))),
                              SizedBox(width: 8),
                              Expanded(child: TextField(
                                controller: controller.billToController,
                                onChanged: (value) => controller.formData.value.billNo = value,
                                maxLines: 3,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  isDense: true,
                                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                ),
                              )),
                            ],
                          ),
                          SizedBox(height: 12),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(width: 100, child: Text('Shipping Method:', style: TextStyle(fontSize: 12))),
                              SizedBox(width: 8),
                              Expanded(child: DropdownButtonFormField<String>(
                                value: controller.formData.value.shipping,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade400)),
                                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade400)),
                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade600)),
                                  isDense: true,
                                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                ),
                                icon: Icon(Icons.arrow_drop_down, size: 20),
                                items: controller.shippings.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                                onChanged: (value) => controller.formData.value.shipping = value,
                              )),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                    // Column 2: Voucher Number, Ship to
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(width: 120, child: Text('Voucher Number:', style: TextStyle(fontSize: 12))),
                              SizedBox(width: 8),
                              Expanded(child: TextField(
                                controller: controller.voucherNumberController,
                                onChanged: (value) => controller.formData.value.voucherNumber = value,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  isDense: true,
                                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                ),
                              )),
                            ],
                          ),
                          SizedBox(height: 12),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(width: 80, child: Text('Ship to:', style: TextStyle(fontSize: 12))),
                              SizedBox(width: 8),
                              Expanded(child: DropdownButtonFormField<String>(
                                value: controller.formData.value.shipTo,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade400)),
                                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade400)),
                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade600)),
                                  isDense: true,
                                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                ),
                                icon: Icon(Icons.arrow_drop_down, size: 20),
                                items: controller.shipTos.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                                onChanged: (value) => controller.formData.value.shipTo = value,
                              )),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                    // Column 3: Payment Term, Due date, Tax group
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(width: 110, child: Text('Payment Term:', style: TextStyle(fontSize: 12))),
                              SizedBox(width: 8),
                              Expanded(child: DropdownButtonFormField<String>(
                                value: controller.formData.value.paymentTerm,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade400)),
                                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade400)),
                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade600)),
                                  isDense: true,
                                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                ),
                                icon: Icon(Icons.arrow_drop_down, size: 20),
                                items: controller.paymentTerms.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                                onChanged: (value) => controller.formData.value.paymentTerm = value,
                              )),
                            ],
                          ),
                          SizedBox(height: 12),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(width: 80, child: Text('Due Date:', style: TextStyle(fontSize: 12))),
                              SizedBox(width: 8),
                              Expanded(child: TextField(
                                controller: controller.dueDateController,
                                onChanged: (value) => controller.formData.value.dueDate = DateTime.tryParse(value),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  isDense: true,
                                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                ),
                              )),
                            ],
                          ),
                          SizedBox(height: 12),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(width: 80, child: Text('Tax Group:', style: TextStyle(fontSize: 12))),
                              SizedBox(width: 8),
                              Expanded(child: DropdownButtonFormField<String>(
                                value: controller.formData.value.taxGroup,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade400)),
                                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade400)),
                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade600)),
                                  isDense: true,
                                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                ),
                                icon: Icon(Icons.arrow_drop_down, size: 20),
                                items: controller.taxGroups.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                                onChanged: (value) => controller.formData.value.taxGroup = value,
                              )),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                    // Column 4: Date, Reference 1,2, Customer PO#, Salesperson, Currency
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(width: 80, child: Text('Date:', style: TextStyle(fontSize: 12))),
                              SizedBox(width: 8),
                              Expanded(child: TextField(
                                controller: controller.dateController,
                                onChanged: (value) => controller.formData.value.date = DateTime.tryParse(value),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  isDense: true,
                                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                ),
                              )),
                            ],
                          ),
                          SizedBox(height: 12),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(width: 100, child: Text('Reference 1:', style: TextStyle(fontSize: 12))),
                              SizedBox(width: 8),
                              Expanded(child: TextField(
                                controller: controller.reference1Controller,
                                onChanged: (value) => controller.formData.value.reference1 = value,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  isDense: true,
                                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                ),
                              )),
                            ],
                          ),
                          SizedBox(height: 12),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(width: 100, child: Text('Reference 2:', style: TextStyle(fontSize: 12))),
                              SizedBox(width: 8),
                              Expanded(child: TextField(
                                controller: controller.reference2Controller,
                                onChanged: (value) => controller.formData.value.reference2 = value,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  isDense: true,
                                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                ),
                              )),
                            ],
                          ),
                          SizedBox(height: 12),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(width: 100, child: Text('Customer PO#:', style: TextStyle(fontSize: 12))),
                              SizedBox(width: 8),
                              Expanded(child: TextField(
                                controller: controller.customerPOController,
                                onChanged: (value) => controller.formData.value.customerPO = value,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  isDense: true,
                                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                ),
                              )),
                            ],
                          ),
                          SizedBox(height: 12),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(width: 100, child: Text('Salesperson:', style: TextStyle(fontSize: 12))),
                              SizedBox(width: 8),
                              Expanded(child: DropdownButtonFormField<String>(
                                value: controller.formData.value.salesperson,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade400)),
                                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade400)),
                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade600)),
                                  isDense: true,
                                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                ),
                                icon: Icon(Icons.arrow_drop_down, size: 20),
                                items: controller.salespersons.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                                onChanged: (value) => controller.formData.value.salesperson = value,
                              )),
                            ],
                          ),
                          SizedBox(height: 12),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(width: 80, child: Text('Currency:', style: TextStyle(fontSize: 12))),
                              SizedBox(width: 8),
                              Expanded(child: DropdownButtonFormField<String>(
                                value: controller.formData.value.currency,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade400)),
                                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade400)),
                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade600)),
                                  isDense: true,
                                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                ),
                                icon: Icon(Icons.arrow_drop_down, size: 20),
                                items: controller.currencies.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                                onChanged: (value) => controller.formData.value.currency = value,
                              )),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                    // Column 5: Driver, Vehicle, Vehicle Name
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(width: 80, child: Text('Driver:', style: TextStyle(fontSize: 12))),
                              SizedBox(width: 8),
                              Expanded(child: DropdownButtonFormField<String>(
                                value: controller.formData.value.driver,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade400)),
                                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade400)),
                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade600)),
                                  isDense: true,
                                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                ),
                                icon: Icon(Icons.arrow_drop_down, size: 20),
                                items: controller.drivers.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                                onChanged: (value) => controller.formData.value.driver = value,
                              )),
                            ],
                          ),
                          SizedBox(height: 12),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(width: 80, child: Text('Vehicle:', style: TextStyle(fontSize: 12))),
                              SizedBox(width: 8),
                              Expanded(child: DropdownButtonFormField<String>(
                                value: controller.formData.value.vehicle,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade400)),
                                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade400)),
                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade600)),
                                  isDense: true,
                                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                ),
                                icon: Icon(Icons.arrow_drop_down, size: 20),
                                items: controller.vehicles.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                                onChanged: (value) => controller.formData.value.vehicle = value,
                              )),
                            ],
                          ),
                          SizedBox(height: 12),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(width: 110, child: Text('Vehicle Name:', style: TextStyle(fontSize: 12))),
                              SizedBox(width: 8),
                              Expanded(child: TextField(
                                controller: controller.vehicleNameController,
                                onChanged: (value) => controller.formData.value.vehicleName = value,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  isDense: true,
                                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                ),
                              )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                DataTableWidget(controller: controller),
                SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Note:', style: TextStyle(fontSize: 12)),
                              SizedBox(width: 8),
                              Expanded(
                                child: TextField(
                                  controller: controller.noteController,
                                  onChanged: (value) => controller.formData.value.note = value,
                                  maxLines: 4,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    isDense: true,
                                    contentPadding: EdgeInsets.all(8),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Row(
                            children: [
                              Text('Selected File:', style: TextStyle(fontSize: 12)),
                              SizedBox(width: 8),
                              Expanded(
                                child: TextField(
                                  controller: controller.selectedFileController,
                                  onChanged: (value) => controller.formData.value.selectedFile = value,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    isDense: true,
                                    contentPadding: EdgeInsets.all(4),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 32),
                    Expanded(
                      flex: 2,
                      child: TotalsSection(controller: controller),
                    ),
                  ],
                ),
                SizedBox(height: 20),
              ],
            ),
          );
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: constraints.maxWidth,
                maxWidth: constraints.maxWidth,
                minHeight: constraints.maxHeight,
              ),
              child: constraints.maxWidth < 900
                  ? SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(minWidth: 900),
                        child: content,
                      ),
                    )
                  : content,
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(8.0),
        child: ActionButtons(controller: controller),
      ),
    );
  }
}
