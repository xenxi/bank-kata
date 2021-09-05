import 'package:bank_kata/transaction.dart';

class Transactions {
  final List<Transaction> _transactions;

  Transactions(this._transactions);

  void add(Transaction transaction) => _transactions.add(transaction);

  List<Transaction> getAll() => _transactions;

  factory Transactions.empty() => Transactions([]);
}
