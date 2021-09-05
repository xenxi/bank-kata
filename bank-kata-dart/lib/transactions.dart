import 'package:bank_kata/date_time_getter.dart';
import 'package:bank_kata/transaction.dart';

class Transactions {
  final List<Transaction> _transactions;
  final DateTimeGetter _clock;
  Transactions(
    this._transactions,
    this._clock,
  );

  factory Transactions.empty(DateTimeGetter clock) => Transactions([], clock);

  List<Transaction> getAll() => _transactions;

  void add(int amount) => _transactions.add(Transaction(
      amount: amount, balance: amount, date: _clock.getCurrentDate()));
}
