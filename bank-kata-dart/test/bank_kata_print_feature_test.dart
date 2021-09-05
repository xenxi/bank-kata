import 'package:bank_kata/account_service_imp.dart';
import 'package:bank_kata/statement_printer.dart';
import 'package:bank_kata/transactions.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'account_service_imp_test.mocks.dart';
import 'statement_printer_test.mocks.dart';

void main() {
  group('AccountServiceImp should', () {
    final printer = MockPrinter();
    final dateTimeGetter = MockDateTimeGetter();
    final statementPrinter = StatementPrinter(printer);
    final AccountServiceImp account =
        AccountServiceImp(Transactions.empty(dateTimeGetter), statementPrinter);

    test('print all transactions', () {
      final aGivenDates = <DateTime>[
        DateTime(2012, 1, 14),
        DateTime(2012, 1, 13),
        DateTime(2012, 1, 10),
      ];
      var callCount = 0;
      when(dateTimeGetter.getCurrentDate())
          .thenAnswer((realInvocation) => aGivenDates[callCount++]);

      account.deposit(1000);
      account.deposit(2000);
      account.withdraw(500);

      account.printStatement();

      verifyInOrder([
        printer.print('Date       || Amount || Balance'),
        printer.print('14/01/2012 || -500   || 2500'),
        printer.print('13/01/2012 || 2000   || 3000'),
        printer.print('10/01/2012 || 1000   || 1000'),
      ]);
    });
  });
}
