// Mocks generated by Mockito 5.0.15 from annotations
// in bank_kata/test/account_service_imp_test.dart.
// Do not manually edit this file.

import 'package:bank_kata/date_time_getter.dart' as _i2;
import 'package:bank_kata/statement_printer.dart' as _i3;
import 'package:bank_kata/transaction.dart' as _i4;
import 'package:bank_kata/transactions.dart' as _i5;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeDateTime_0 extends _i1.Fake implements DateTime {}

/// A class which mocks [DateTimeGetter].
///
/// See the documentation for Mockito's code generation for more information.
class MockDateTimeGetter extends _i1.Mock implements _i2.DateTimeGetter {
  MockDateTimeGetter() {
    _i1.throwOnMissingStub(this);
  }

  @override
  DateTime getCurrentDate() =>
      (super.noSuchMethod(Invocation.method(#getCurrentDate, []),
          returnValue: _FakeDateTime_0()) as DateTime);
  @override
  String toString() => super.toString();
}

/// A class which mocks [StatementPrinter].
///
/// See the documentation for Mockito's code generation for more information.
class MockStatementPrinter extends _i1.Mock implements _i3.StatementPrinter {
  MockStatementPrinter() {
    _i1.throwOnMissingStub(this);
  }

  @override
  void print(List<_i4.Transaction>? transactions) =>
      super.noSuchMethod(Invocation.method(#print, [transactions]),
          returnValueForMissingStub: null);
  @override
  String toString() => super.toString();
}

/// A class which mocks [Transactions].
///
/// See the documentation for Mockito's code generation for more information.
class MockTransactions extends _i1.Mock implements _i5.Transactions {
  MockTransactions() {
    _i1.throwOnMissingStub(this);
  }

  @override
  void add(_i4.Transaction? transaction) =>
      super.noSuchMethod(Invocation.method(#add, [transaction]),
          returnValueForMissingStub: null);
  @override
  String toString() => super.toString();
}