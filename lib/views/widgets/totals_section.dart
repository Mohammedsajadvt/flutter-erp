import 'package:erp/controllers/expense_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TotalsSection extends StatelessWidget {
  final ExpenseController controller;

  const TotalsSection({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
      children: [
        _buildTotalRow('Subtotal', null, value: controller.subtotal.value.toStringAsFixed(2), isBold: false, readOnly: true),
        _buildTotalRow('Discount', controller.discountPercentController, onChanged: (value) => controller.updateDiscountPercent(double.tryParse(value) ?? 0.0), amountController: controller.discountAmountController, amountOnChanged: (value) => controller.updateDiscount(double.tryParse(value) ?? 0.0), hasPercentage: true, isBold: false),
        _buildTotalRow('Charges', null, value: controller.charges.value.toStringAsFixed(2), isBold: false, readOnly: true),
        _buildTotalRow('Tax', controller.taxController, value: controller.tax.value.toStringAsFixed(2), isBold: false, readOnly: true),
        _buildTotalRow('Round Off', null, value: (controller.total.value % 1).toStringAsFixed(2), isBold: false, readOnly: true),
        _buildTotalRow('Total', controller.totalController, value: controller.total.value.toStringAsFixed(2), isBold: true, readOnly: true),
      ],
    ));
  }


  Widget _buildTotalRow(String label, TextEditingController? controller, {Function(String)? onChanged, TextEditingController? amountController, Function(String)? amountOnChanged, bool hasPercentage = false, bool isBold = false, bool readOnly = false, String? value}) {
    TextStyle style = TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.normal);

    Widget displayWidget;
    if (readOnly && value != null) {
      displayWidget = SizedBox(
        width: 80,
        child: Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              value,
              style: style,
            ),
          ),
        ),
      );
    } else if (controller != null) {
      displayWidget = SizedBox(
        width: 80,
        child: TextField(
          controller: amountController ?? controller,
          onChanged: amountOnChanged ?? onChanged,
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          style: style,
          readOnly: readOnly,
          textAlign: hasPercentage ? TextAlign.left : TextAlign.right,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            isDense: true,
            contentPadding: EdgeInsets.all(4),
          ),
        ),
      );
    } else {
      // This shouldn't happen with current usage
      displayWidget = Text('N/A');
    }

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: style),
          Row(
            children: [
              if (hasPercentage) ...[
                SizedBox(
                  width: 80,
                  child: TextField(
                    controller: controller,
                    onChanged: onChanged,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    style: style,
                    readOnly: readOnly,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      isDense: true,
                      contentPadding: EdgeInsets.all(4),
                    ),
                  ),
                ),
                Text(' % '),
              ],
              displayWidget,
            ],
          ),
        ],
      ),
    );
  }
}
