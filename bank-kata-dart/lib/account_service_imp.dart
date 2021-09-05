import 'package:bank_kata/date_time_getter.dart';
import 'package:bank_kata/statement_printer.dart';
import 'package:bank_kata/transaction.dart';
import 'package:bank_kata/transactions.dart';

import 'account_service.dart';

class AccountServiceImp implements AccountService {
  final Transactions _transactions;
  final DateTimeGetter _date;
  final StatementPrinter _statementPrinter;
  AccountServiceImp(
    this._transactions,
    this._date,
    this._statementPrinter,
  );

  @override
  void deposit(int amount) {
    final newTransaction = Transaction(amount, _date.getCurrentDate());
    _transactions.add(newTransaction);
  }

  @override
  void printStatement() {
    _statementPrinter.print(_transactions.getAll());
  }

  @override
  void withdraw(int amount) {
    final newTransaction = Transaction(-amount, _date.getCurrentDate());
    _transactions.add(newTransaction);
  }
}
