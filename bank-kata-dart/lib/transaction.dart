class Transaction {
  final int amount;
  final DateTime date;
  final int balance;
  Transaction(
      {required this.amount, required this.date, required this.balance});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Transaction &&
        other.amount == amount &&
        other.date == date &&
        other.balance == balance;
  }

  @override
  int get hashCode => amount.hashCode ^ date.hashCode ^ balance.hashCode;
}
