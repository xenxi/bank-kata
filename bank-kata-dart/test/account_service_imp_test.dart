import 'package:bank_kata/account_service_imp.dart';
import 'package:bank_kata/date_time_getter.dart';
import 'package:bank_kata/transaction.dart';
import 'package:bank_kata/transactions.dart';
import 'package:mockito/mockito.dart';
import 'package:test/scaffolding.dart';
import 'package:test/test.dart';

class MockTransactions extends Mock implements Transactions {}

class MockDateTimeGetter extends Mock implements DateTimeGetter {}

void main() {
  group('account service should', () {
    final transactions = MockTransactions();
    final dateGetter = MockDateTimeGetter();
    final account = AccountServiceImp(transactions, dateGetter);
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
  });
}
