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
      final aGivenDateTimeNow = DateTime.now();
      when(dateGetter.getCurrentDate())
          .thenAnswer((realInvocation) => aGivenDateTimeNow);
      var transaction = Transaction(600, aGivenDateTimeNow);

      account.deposit(600);

      verify(transactions.add(transaction));
    });
  });
}
