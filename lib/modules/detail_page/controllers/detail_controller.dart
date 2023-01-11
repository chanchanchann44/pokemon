import 'package:get/get.dart';
import 'package:pokemon/modules/detail_page/models/pokemon_detail.dart';

import 'package:pokemon/modules/home_page/controllers/home_controller.dart';
import 'package:pokemon/services/api_services.dart';

class DetailController extends GetxController {
  final homeController = Get.put(HomeController());

  var isLoading = false.obs;
  var pokemonName = ''.obs;
  var pokemonNumber = 0.obs;
  var pokemonImagePath = ''.obs;
  var pokemonDetail = PokemonDetail(height: 0, weight: 0, types: []);

  @override
  void onInit() {
    pokemonName = homeController.pokemonName;
    pokemonImagePath = homeController.pokemonImagePath;
    pokemonNumber = homeController.pokemonNumber;
    getPokemonDetail();

    super.onInit();
  }

  Future getPokemonDetail() async {
    isLoading.value = true;
    pokemonDetail =
        (await ApiService().getPokemonDetail(index: pokemonNumber.value))!;
    isLoading.value = false;
  }
}
