import 'package:flutter/material.dart';
import 'package:pokemon/constants/app_color.dart';
import 'package:pokemon/constants/app_text.dart';
import 'package:pokemon/modules/home_page/controllers/home_controller.dart';

class Pagination extends StatelessWidget {
  const Pagination({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
            color: AppColor.white,
            onPressed: () => controller.previousPagination(),
            icon: const Icon(Icons.arrow_back_ios)),
        Text(
          '${((controller.pagination.value - 1) * 50) + 1} - ${controller.pagination.value * 50} / ${controller.pokemons.count}',
          style: AppText.font16Normal.copyWith(color: AppColor.white),
        ),
        IconButton(
            color: AppColor.white,
            onPressed: () => controller.nextPagination(),
            icon: const Icon(Icons.arrow_forward_ios)),
      ],
    );
  }
}
