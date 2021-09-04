import 'package:bank_kata/account_service_imp.dart';
import 'package:bank_kata/printer.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockPrinter extends Mock implements Printer {}

void main() {
  final printer = MockPrinter();
  final account = AccountServiceImp();
  test('print all transactions', () {
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
}
