import 'package:flutter/material.dart';
import 'package:pokemon/constants/api_const.dart';
import 'package:pokemon/constants/app_color.dart';
import 'package:pokemon/constants/app_text.dart';
import 'package:pokemon/global_widgets/fade_image_custom.dart';
import 'package:pokemon/helper/helper.dart';
import 'package:pokemon/modules/home_page/controllers/home_controller.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    required this.controller,
    required this.index,
    required this.pokemonNumber,
  }) : super(key: key);

  final HomeController controller;
  final int index;
  final int pokemonNumber;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: Colors.grey.withOpacity(0.4),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: FadeImageCustom(
                  image: '${ApiConstants.imageUrl}$pokemonNumber.png'),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              Helper.capitalizeFirstLetter(
                  controller.pokemons.results[index].name),
              style: AppText.font16Normal.copyWith(color: AppColor.white),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
