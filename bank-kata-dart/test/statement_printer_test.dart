import 'package:bank_kata/printer.dart';
import 'package:bank_kata/statement_printer.dart';
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
  });
}
