import 'package:bank_kata/date_time_getter.dart';
import 'package:bank_kata/transaction.dart';
import 'package:bank_kata/transactions.dart';

import 'account_service.dart';

class AccountServiceImp implements AccountService {
  final Transactions _transactions;
  final DateTimeGetter _date;
  AccountServiceImp(
    this._transactions,
    this._date,
  );

  @override
  void deposit(int amount) {
    final newTransaction =
        Transaction(amount, _date.getCurrentDate() ?? DateTime.now());
    _transactions.add(newTransaction);
  }

  @override
  void printStatement() {
    // TODO: implement printStatement
  }

  @override
  void withdraw(int amount) {
    final newTransaction =
        Transaction(-amount, _date.getCurrentDate() ?? DateTime.now());
    _transactions.add(newTransaction);
  }
}
