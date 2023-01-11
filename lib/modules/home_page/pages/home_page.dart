import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon/constants/app_color.dart';
import 'package:pokemon/modules/home_page/pages/widgets/pokemons_grid.dart';

import '../controllers/home_controller.dart';
import 'widgets/no_data.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Pokemon App')),
        backgroundColor: AppColor.dark,
      ),
      backgroundColor: AppColor.grey,
      body: SafeArea(
        child: Obx(
          () => controller.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : controller.pokemons.results.isEmpty
                  ? NoData(controller: controller)
                  : PokemonsGrid(controller: controller),
        ),
      ),
    );
  }
}
