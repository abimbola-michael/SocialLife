import 'package:flutter_test/flutter_test.dart';
import 'package:sociallife/test/calculator.dart';

void main() {
  group("Calculation", () {
    test("Addition", () {
      final calc = Calculator();
      expect(calc.add(6, 2), 8);
    });
  });

  test("Subtraction", () {
    final calc = Calculator();
    expect(calc.subtract(6, 2), 9);
  });

  test("Division", () {
    final calc = Calculator();
    expect(calc.divide(6, 2), 3);
  });
}
