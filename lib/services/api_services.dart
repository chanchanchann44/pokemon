import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:pokemon/constants/api_const.dart';
import 'package:pokemon/modules/detail_page/models/pokemon_detail.dart';
import 'package:pokemon/modules/home_page/models/pokemons.dart';

class ApiService {
  Future<Pokemons?> getPokemons({required Map<String, String> params}) async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.getPokemons)
          .replace(queryParameters: params);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        Pokemons data = pokemonsFromJson(response.body);
        return data;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
    return null;
  }

  Future<PokemonDetail?> getPokemonDetail({required int index}) async {
    try {
      var url = Uri.parse(
          '${ApiConstants.baseUrl}${ApiConstants.getPokemons}/$index');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        PokemonDetail data = pokemonDetailFromJson(response.body);
        return data;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
    return null;
  }
}
