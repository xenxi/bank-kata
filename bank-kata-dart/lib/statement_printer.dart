import 'package:bank_kata/printer.dart';
import 'package:bank_kata/transaction.dart';

class StatementPrinter {
  final Printer _printer;

  StatementPrinter(this._printer);
  void print(List<Transaction> transactions) =>
      _printer.print('Date       || Amount || Balance');
}
