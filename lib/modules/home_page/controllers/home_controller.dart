import 'package:get/get.dart';

import 'package:pokemon/modules/home_page/models/pokemons.dart';
import 'package:pokemon/services/api_services.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;
  var pokemons = Pokemons(results: [], count: 0, next: '', previous: null);
  var pokemonName = ''.obs;
  var pokemonNumber = 0.obs;
  var pokemonImagePath = ''.obs;
  var pagination = 1.obs;

  @override
  void onInit() {
    isLoading.value = true;
    getPokemons();

    super.onInit();
  }

  Future getPokemons() async {
    isLoading.value = true;
    var params = {'offset': '${(pagination.value - 1) * 50}', 'limit': '50'};
    pokemons = (await ApiService().getPokemons(params: params))!;
    isLoading.value = false;
  }

  void previousPagination() {
    if (pagination.value != 1) {
      pagination.value--;
      getPokemons();
    }
  }

  void nextPagination() {
    if (pokemons.next != 'null') {
      pagination.value++;
      getPokemons();
    }
  }

  void routeToDetailPage(
      {required String name, required String imagePath, required int number}) {
    pokemonName.value = name;
    pokemonImagePath.value = imagePath;
    pokemonNumber.value = number;
    Get.toNamed('./detail');
  }
}
