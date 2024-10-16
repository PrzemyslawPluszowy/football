import 'package:flutter_test/flutter_test.dart';
import 'package:football/core/failures/failure.dart';

void main() {
  group('Failure Equality Tests', () {
    test('NetworkFailure instances with same values should be equal', () {
      final failure1 = NetworkFailure(e: 'Error', s: StackTrace.current);
      final failure2 = NetworkFailure(e: 'Error', s: StackTrace.current);

      expect(failure1, equals(failure2));
    });

    test('NotFoundFailure instances with same values should be equal', () {
      final failure1 = NotFoundFailure(e: 'Not Found', s: StackTrace.current);
      final failure2 = NotFoundFailure(e: 'Not Found', s: StackTrace.current);

      expect(failure1, equals(failure2));
    });

    test('ServerFailure instances with same values should be equal', () {
      final failure1 = ServerFailure(e: 'Server Error', s: StackTrace.current);
      final failure2 = ServerFailure(e: 'Server Error', s: StackTrace.current);

      expect(failure1, equals(failure2));
    });

    test('UnknownFailure instances with same values should be equal', () {
      final failure1 = UnknownFailure(e: 'Unknown Error', s: StackTrace.current);
      final failure2 = UnknownFailure(e: 'Unknown Error', s: StackTrace.current);

      expect(failure1, equals(failure2));
    });
  });
}
