import 'package:bank_kata/printer.dart';
import 'package:bank_kata/transactions.dart';

class StatementPrinter {
  final Printer _printer;

  StatementPrinter(this._printer);
  void print(Transactions transactions) =>
      _printer.print('Date       || Amount || Balance');
}
