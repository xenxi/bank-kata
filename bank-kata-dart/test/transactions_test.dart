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

    test('update balance when store transactions', () {
      final aGivenTransactions = <Transaction>[
        Transaction(amount: 100, date: DateTime.now(), balance: 100),
        Transaction(
            amount: 200,
            date: DateTime.now().add(Duration(minutes: 2)),
            balance: 300),
        Transaction(
            amount: -50,
            date: DateTime.now().add(Duration(minutes: 5)),
            balance: 250),
      ];
      final aGivenDateTime = DateTime.now().add(Duration(hours: 1));
      when(dateTimeGetter.getCurrentDate())
          .thenAnswer((realInvocation) => aGivenDateTime);

      transactions.add(100);

      final expectedTransactions = <Transaction>[
        ...aGivenTransactions,
        Transaction(amount: 100, date: aGivenDateTime, balance: 350)
      ];
      expect(transactions.getAll(), expectedTransactions);
    });
  });
}
