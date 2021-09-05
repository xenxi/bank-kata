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
    final statementPrinter = MockStatementPrinter();
    final account = AccountServiceImp(transactions, statementPrinter);
    test('store a transaction with 600 and current date when deposit 600', () {
      var aGivenAmount = 600;

      account.deposit(aGivenAmount);

      verify(transactions.add(aGivenAmount));
    });
    test('store a transaction with -500 and current date when withdraw 500',
        () {
      final aGivenAmoun = 500;

      account.withdraw(aGivenAmoun);

      final expectedAmount = -aGivenAmoun;
      verify(transactions.add(expectedAmount));
    });

    test('print bank statement', () {
      final aGivenTransactions = <Transaction>[
        Transaction(amount: 1, date: DateTime.now(), balance: 0)
      ];
      when(transactions.getAll())
          .thenAnswer((realInvocation) => aGivenTransactions);

      account.printStatement();

      verify(statementPrinter.print(aGivenTransactions));
    });
  });
}
