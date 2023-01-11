import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:pokemon/modules/home_page/controllers/home_controller.dart';

void main() {
  test('Home page init value', () {
    final controller = HomeController();
    Get.put(controller);
    expect(controller.pokemonName.value, '');
    expect(controller.pokemonNumber.value, 0);
    expect(controller.pokemonImagePath.value, '');
    expect(controller.pagination.value, 1);
  });

  test('Pagination (count = 1154, minPagination = 1, maxPagination = 24)', () {
    final controller = HomeController();
    Get.put(controller);
    // first page
    controller.previousPagination();
    expect(controller.pagination.value, 1);

    controller.nextPagination();
    expect(controller.pagination.value, 2);

    // last page
    controller.pagination.value = 24;
    controller.previousPagination();
    expect(controller.pagination.value, 23);

    controller.nextPagination();
    expect(controller.pagination.value, 24);
  });
}
