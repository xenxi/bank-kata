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

  void add(int amount) {
    final calculeBalance = _calculeBalance(amount);
    final transaction = Transaction(
        amount: amount, balance: calculeBalance, date: _clock.getCurrentDate());

    _transactions.add(transaction);
  }

  int _calculeBalance(int amount) {
    final currentBalance = _transactions.isNotEmpty
        ? _transactions
            .map((e) => e.amount)
            .reduce((value, element) => value + element)
        : 0;
    return amount + currentBalance;
  }
}
