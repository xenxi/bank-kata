import 'package:bank_kata/statement_printer.dart';
import 'package:bank_kata/transactions.dart';

import 'account_service.dart';

class AccountServiceImp implements AccountService {
  final Transactions _transactions;
  final StatementPrinter _statementPrinter;
  AccountServiceImp(
    this._transactions,
    this._statementPrinter,
  );

  @override
  void deposit(int amount) => _transactions.add(amount);

  @override
  void printStatement() => _statementPrinter.print(_transactions.getAll());

  @override
  void withdraw(int amount) => _transactions.add(-amount);
}
