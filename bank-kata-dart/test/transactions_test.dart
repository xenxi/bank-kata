import 'package:bank_kata/transaction.dart';
import 'package:bank_kata/transactions.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('transactions should', () {
    Transactions transactions = Transactions.empty();

    setUp(() {
      transactions = Transactions.empty();
    });

    test('store a transaction', () {
      final aGivenTransaction = Transaction(600, DateTime.now());
      final aGivenOtherTransaction =
          Transaction(600, DateTime.now().add(Duration(hours: 5)));

      transactions.add(aGivenTransaction);
      transactions.add(aGivenOtherTransaction);

      final expectedTransactions = <Transaction>[
        aGivenTransaction,
        aGivenOtherTransaction
      ];
      expect(transactions.getAll(), expectedTransactions);
    });
  });
}
