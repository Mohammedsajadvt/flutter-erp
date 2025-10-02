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
import 'package:file_picker/file_picker.dart'; 

class ExpenseFormView extends StatelessWidget {
  final ExpenseController controller = Get.put(ExpenseController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Form'),
        backgroundColor: Colors.teal[700],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              FormHeader(),
              SizedBox(height: 20),
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(child: CustomDropdownField<String>(label: 'Doc ID:', value: controller.formData.value.docId, items: controller.docIds.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(), onChanged: (value) => controller.formData.value.docId = value)),
                      SizedBox(width: 16),
                      Expanded(child: CustomTextField(label: 'Voucher Number:', controller: controller.voucherNumberController, onChanged: (value) => controller.formData.value.voucherNumber = value)),
                      SizedBox(width: 16),
                      Expanded(child: CustomTextField(label: 'Date:', controller: controller.dateController, onChanged: (value) => controller.formData.value.date = DateTime.tryParse(value))),
                      SizedBox(width: 16),
                      Expanded(child: CustomDropdownField<String>(label: 'Driver:', value: controller.formData.value.driver, items: controller.drivers.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(), onChanged: (value) => controller.formData.value.driver = value)),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(child: CustomDropdownField<String>(label: 'Customer ID:', value: controller.formData.value.customerId, items: controller.customerIds.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(), onChanged: (value) => controller.formData.value.customerId = value)),
                      SizedBox(width: 16),
                      Expanded(child: CustomDropdownField<String>(label: 'Ship To:', value: controller.formData.value.shipTo, items: controller.shipTos.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(), onChanged: (value) => controller.formData.value.shipTo = value)),
                      SizedBox(width: 16),
                      Expanded(child: CustomDropdownField<String>(label: 'Payment Term:', value: controller.formData.value.paymentTerm, items: controller.paymentTerms.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(), onChanged: (value) => controller.formData.value.paymentTerm = value)),
                      SizedBox(width: 16),
                      Expanded(child: CustomTextField(label: 'Reference 1:', controller: controller.reference1Controller, onChanged: (value) => controller.formData.value.reference1 = value)),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(child: CustomTextField(label: 'Due Date:', controller: controller.dueDateController, onChanged: (value) => controller.formData.value.dueDate = DateTime.tryParse(value))),
                      SizedBox(width: 16),
                      Expanded(child: CustomTextField(label: 'Reference 2:', controller: controller.reference2Controller, onChanged: (value) => controller.formData.value.reference2 = value)),
                      SizedBox(width: 16),
                      Expanded(child: CustomTextField(label: 'Customer PO#:', controller: controller.customerPOController, onChanged: (value) => controller.formData.value.customerPO = value)),
                      SizedBox(width: 16),
                      Expanded(child: CustomDropdownField<String>(label: 'Salesperson:', value: controller.formData.value.salesperson, items: controller.salespersons.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(), onChanged: (value) => controller.formData.value.salesperson = value)),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(child: CustomDropdownField<String>(label: 'Vehicle:', value: controller.formData.value.vehicle, items: controller.vehicles.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(), onChanged: (value) => controller.formData.value.vehicle = value)),
                      SizedBox(width: 16),
                      Expanded(child: CustomTextField(label: 'Vehicle Name:', controller: controller.vehicleNameController, onChanged: (value) => controller.formData.value.vehicleName = value)),
                      SizedBox(width: 16),
                      Expanded(child: CustomDropdownField<String>(label: 'Shipping:', value: controller.formData.value.shipping, items: controller.shippings.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(), onChanged: (value) => controller.formData.value.shipping = value)),
                      SizedBox(width: 16),
                      Expanded(child: CustomDropdownField<String>(label: 'Tax Group:', value: controller.formData.value.taxGroup, items: controller.taxGroups.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(), onChanged: (value) => controller.formData.value.taxGroup = value)),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(child: CustomDropdownField<String>(label: 'Currency:', value: controller.formData.value.currency, items: controller.currencies.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(), onChanged: (value) => controller.formData.value.currency = value)),
                      // Add additional fields if needed to fill the row
                      SizedBox(width: 16,), // Placeholder for alignment
                    ],
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
                    flex: 3,
                    child: TotalsSection(controller: controller),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ActionButtons(controller: controller),
            ],
          ),
        ),
      ),
    );
  }
}
