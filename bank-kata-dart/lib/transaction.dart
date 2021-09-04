class Transaction {
  final int amount;
  final DateTime date;
  Transaction(
    this.amount,
    this.date,
  );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Transaction && other.amount == amount && other.date == date;
  }

  @override
  int get hashCode => amount.hashCode ^ date.hashCode;
}
