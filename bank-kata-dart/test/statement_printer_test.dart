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
        Transaction(-500, DateTime.parse('14/01/2012')),
        Transaction(2000, DateTime.parse('13/01/2012')),
        Transaction(1000, DateTime.parse('10/01/2012')),
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
