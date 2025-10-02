import 'package:erp/controllers/expense_controller.dart';
import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  final ExpenseController controller;

  const ActionButtons({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: controller.saveForm,
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
          child: Text('Save'),
        ),
        SizedBox(width: 8),
        OutlinedButton(
          onPressed: controller.cancelForm,
          child: Text('Cancel'),
        ),
        SizedBox(width: 8),
        OutlinedButton(
          onPressed: controller.voidForm,
          child: Text('Void'),
        ),
        SizedBox(width: 8),
        OutlinedButton(
          onPressed: controller.deleteForm,
          child: Text('Delete'),
        ),
        Spacer(),
        ElevatedButton(
          onPressed: controller.cancelForm,
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          child: Text('Cancel'),
        ),
      ],
    );
  }
}
