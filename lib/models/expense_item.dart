class ExpenseItem {
  String expenseCode;
  String description;
  String ref;
  double tax;
  int quantity;
  double amount;

  ExpenseItem({
    required this.expenseCode,
    required this.description,
    required this.ref,
    required this.tax,
    required this.quantity,
    required this.amount,
  });
}