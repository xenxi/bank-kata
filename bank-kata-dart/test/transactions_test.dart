import 'package:bank_kata/transaction.dart';
import 'package:bank_kata/transactions.dart';
import 'package:mockito/mockito.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import 'account_service_imp_test.mocks.dart';

void main() {
  group('transactions should', () {
    final dateTimeGetter = MockDateTimeGetter();
    Transactions transactions = Transactions.empty(dateTimeGetter);

    setUp(() {
      transactions = Transactions.empty(dateTimeGetter);
    });

    test('store a transaction', () {
      final aGivenAmount = 600;
      final aGivenDate = DateTime.now();
      when(dateTimeGetter.getCurrentDate())
          .thenAnswer((realInvocation) => aGivenDate);

      transactions.add(aGivenAmount);

      final expectedTransactions = <Transaction>[
        Transaction(
            amount: aGivenAmount, date: aGivenDate, balance: aGivenAmount)
      ];
      expect(transactions.getAll(), expectedTransactions);
    });
  });
}
