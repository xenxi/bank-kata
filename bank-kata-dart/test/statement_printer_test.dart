import 'package:bank_kata/printer.dart';
import 'package:bank_kata/statement_printer.dart';
import 'package:bank_kata/transaction.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/scaffolding.dart';

import 'statement_printer_test.mocks.dart';

@GenerateMocks([Printer])
void main() {
  group('statement printer should', () {
    final printer = MockPrinter();
    final statementPrinter = StatementPrinter(printer);
    test('print only headers when no have any transaction', () {
      const expectedStatementStr = 'Date       || Amount || Balance';

      statementPrinter.print([]);

      verify(printer.print(expectedStatementStr));
    });
    test('print stored transactions in descending cronological order', () {
      final aGiventTransactions = [
        Transaction(amount: -500, date: DateTime(2012, 1, 14), balance: 2500),
        Transaction(amount: 2000, date: DateTime(2012, 1, 13), balance: 3000),
        Transaction(amount: 1000, date: DateTime(2012, 1, 10), balance: 1000),
      ];

      statementPrinter.print(aGiventTransactions);

      verifyInOrder([
        printer.print('Date       || Amount || Balance'),
        printer.print('14/01/2012 || -500   || 2500'),
        printer.print('13/01/2012 || 2000   || 3000'),
        printer.print('10/01/2012 || 1000   || 1000'),
      ]);
    });
  });
}
