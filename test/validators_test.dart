import 'package:flutter_test/flutter_test.dart';
import 'package:todo_mvvm/core/utils/validators.dart';

void main() {
  test('Valid email returns true', () {
    // Arrange
    final email = 'test@example.com';

    // Act
    final result = isValidEmail(email);

    // Assert
    expect(result, true);
  });

  test('Invalid email returns false', () {
    // Arrange
    final email = 'testexample.com';

    // Act
    final result = isValidEmail(email);

    // Assert
    expect(result, false);
  });

  test('Empty email returns false', () {
    // Arrange
    final email = '';

    // Act
    final result = isValidEmail(email);

    // Assert
    expect(result, false);
  });
}
