import 'package:flutter_test/flutter_test.dart';
import 'package:football/core/utils/date_time_converter.dart';

void main() {
  group('DateTimeConverter', () {
    const dateTimeConverterOrNull = DateTimeOrNullConverter();
    const dateTimeConverter = DateTimeConverter();
    final dateTime = DateTime(2024);

    test('should convert from json to DateTime', () {
      final result =
          dateTimeConverter.fromJson(dateTime.millisecondsSinceEpoch);

      expect(result, dateTime);
    });

    test('should convert from DateTime to json', () {
      final result = dateTimeConverter.toJson(dateTime);

      expect(result, dateTime.millisecondsSinceEpoch);
    });

    test('should convert from json to DateTime', () {
      final result =
          dateTimeConverterOrNull.fromJson(dateTime.millisecondsSinceEpoch);

      expect(result, dateTime);
    });

    test('should convert from DateTime to json', () {
      final result = dateTimeConverterOrNull.toJson(dateTime);

      expect(result, dateTime.millisecondsSinceEpoch);
    });

    test('should convert from json to DateTime', () {
      final result = dateTimeConverterOrNull.fromJson(null);

      expect(result, null);
    });
  });
}
