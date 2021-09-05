import 'package:bank_kata/printer.dart';
import 'package:bank_kata/transaction.dart';

class StatementPrinter {
  final _header = 'Date       || Amount || Balance';

  final Printer _printer;
  StatementPrinter(this._printer);
  void print(List<Transaction> transactions) {
    _printer.print(_header);
    transactions.forEach((transaction) {
      _printer.print(
          '${_dateFormat(transaction.date)} || ${_amountFormat(transaction.amount)}|| ${transaction.balance}');
    });
  }

  String _dateFormat(DateTime date) => '';

  _amountFormat(int amount) {}
}
// Date       || Amount || Balance
// 14/01/2012 || -500   || 2500
// 13/01/2012 || 2000   || 3000
// 10/01/2012 || 1000   || 1000d