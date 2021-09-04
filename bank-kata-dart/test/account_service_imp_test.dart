import 'package:bank_kata/account_service.dart';
import 'package:bank_kata/account_service_imp.dart';
import 'package:bank_kata/transaction.dart';
import 'package:bank_kata/transactions.dart';
import 'package:mockito/mockito.dart';
import 'package:test/scaffolding.dart';

class MockTransactions extends Mock implements Transactions {}

void main() {
  group('account service should', () {
    final transactions = MockTransactions();
    final account = AccountServiceImp();
    test('store a transaction with 500 and current date when deposit 500', () {
      final aGivenDateTimeNow = DateTime.now();
      var transaction = Transaction(600, aGivenDateTimeNow);

      account.deposit(500);

      verify(transactions.add(transaction));
    });
  });
}
