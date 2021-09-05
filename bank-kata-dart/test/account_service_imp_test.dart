import 'package:bank_kata/account_service_imp.dart';
import 'package:bank_kata/date_time_getter.dart';
import 'package:bank_kata/statement_printer.dart';
import 'package:bank_kata/transaction.dart';
import 'package:bank_kata/transactions.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/scaffolding.dart';
import 'package:test/test.dart';

import 'account_service_imp_test.mocks.dart';

@GenerateMocks([DateTimeGetter, StatementPrinter, Transactions])
void main() {
  group('account service should', () {
    final transactions = MockTransactions();
    final dateGetter = MockDateTimeGetter();
    final statementPrinter = MockStatementPrinter();
    final account =
        AccountServiceImp(transactions, dateGetter, statementPrinter);
    test('store a transaction with 600 and current date when deposit 600', () {
      final aGivenTransaction = Transaction(600, DateTime.now());
      when(dateGetter.getCurrentDate())
          .thenAnswer((realInvocation) => aGivenTransaction.date);

      account.deposit(aGivenTransaction.amount);

      verify(transactions.add(aGivenTransaction));
    });
    test('store a transaction with -500 and current date when withdraw 500',
        () {
      final aGivenAmoun = 500;
      final aGivenTransaction = Transaction(-aGivenAmoun, DateTime.now());
      when(dateGetter.getCurrentDate())
          .thenAnswer((realInvocation) => aGivenTransaction.date);

      account.withdraw(aGivenAmoun);

      verify(transactions.add(aGivenTransaction));
    });

    test('print bank statement', () {
      final aGivenTransactions = <Transaction>[Transaction(1, DateTime.now())];
      when(transactions.getAll())
          .thenAnswer((realInvocation) => aGivenTransactions);

      account.printStatement();

      verify(statementPrinter.print(aGivenTransactions));
    });
  });
}
