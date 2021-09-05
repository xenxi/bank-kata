import 'package:bank_kata/printer.dart';
import 'package:bank_kata/transaction.dart';

class StatementPrinter {
  final _header = 'Date       || Amount || Balance';

  final Printer _printer;
  StatementPrinter(this._printer);
  void print(List<Transaction> transactions) {
    _printer.print(_header);

    if (transactions.isNotEmpty) {
      _printTransactionsLines(transactions);
    }
  }

  void _printTransactionsLines(List<Transaction> transactions) {
    _orderCronologicalDescending(transactions);

    for (var transaction in transactions) {
      _printer.print(_printTransaction(transaction));
    }
  }

  void _orderCronologicalDescending(List<Transaction> transactions) {
    transactions.sort((a, b) => b.date.compareTo(a.date));
  }

  String _printTransaction(Transaction transaction) {
    final line =
        '${_dateFormat(transaction.date)} || ${_amountFormat(transaction.amount)} || ${transaction.balance}';

    return line;
  }

  String _dateFormat(DateTime date) =>
      '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';

  String _amountFormat(int amount) {
    return amount.toString().padRight(6, ' ');
  }
}
