import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon/helper/helper.dart';

void main() {
  test('capitalizeFirstLetter function', () {
    final result = Helper.capitalizeFirstLetter('capitalizefirstletter');
    expect(result, 'Capitalizefirstletter');
  });
}
