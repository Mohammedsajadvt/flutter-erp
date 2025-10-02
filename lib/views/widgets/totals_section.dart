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
        _buildTotalRow('Subtotal:', controller.subtotal.value),
        _buildTotalRow('Discount:', controller.discount.value, hasPercentage: true),
        _buildTotalRow('Charges:', controller.charges.value),
        _buildTotalRow('Tax:', controller.tax.value),
        _buildTotalRow('Round Off:', controller.total.value % 1),
        Divider(thickness: 2),
        _buildTotalRow('Total:', controller.total.value, isBold: true),
      ],
    ));
  }

  Widget _buildTotalRow(String label, double value, {bool hasPercentage = false, bool isBold = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
          Row(
            children: [
              if (hasPercentage) ...[
                SizedBox(
                  width: 40,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      isDense: true,
                      contentPadding: EdgeInsets.all(4),
                    ),
                  ),
                ),
                Text(' % '),
              ],
              SizedBox(
                width: 80,
                child: Text(
                  value.toStringAsFixed(2),
                  textAlign: TextAlign.right,
                  style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
