import 'package:flutter_test/flutter_test.dart';
import 'package:todo_mvvm/utils/validation.dart';

void main() {
  group('isValidTask', () {
    test('mengembalikan false jika input kosong', () {
      expect(isValidTask(''), false);
    });

    test('mengembalikan false jika input hanya spasi', () {
      expect(isValidTask('   '), false);
    });

    test('mengembalikan false jika input kurang dari 3 karakter', () {
      expect(isValidTask('ab'), false);
    });

    test('mengembalikan true jika input 3 karakter atau lebih', () {
      expect(isValidTask('abc'), true);
      expect(isValidTask('  abc  '), true);
    });
  });
}
