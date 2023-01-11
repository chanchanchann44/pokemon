import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon/constants/api_const.dart';
import 'package:pokemon/modules/home_page/controllers/home_controller.dart';
import 'package:pokemon/modules/home_page/pages/widgets/custom_card.dart';
import 'package:pokemon/modules/home_page/pages/widgets/pagination.dart';

class PokemonsGrid extends StatelessWidget {
  const PokemonsGrid({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Pagination(controller: controller),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 6, right: 6, bottom: 6),
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: (Get.width > 900
                      ? 5
                      : Get.width > 600
                          ? 3
                          : 2),
                  childAspectRatio: 1.2,
                ),
                itemCount: controller.pokemons.results.length,
                itemBuilder: (BuildContext context, int index) {
                  var strings =
                      controller.pokemons.results[index].url.split('/');
                  var pokemonNumber = int.parse(strings[strings.length - 2]);
                  return GestureDetector(
                    onTap: () => controller.routeToDetailPage(
                        name: controller.pokemons.results[index].name,
                        imagePath: '${ApiConstants.imageUrl}$pokemonNumber.png',
                        number: pokemonNumber),
                    child: CustomCard(
                        controller: controller,
                        index: index,
                        pokemonNumber: pokemonNumber),
                  );
                }),
          ),
        ),
      ],
    );
  }
}
