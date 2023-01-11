import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pokemon/constants/app_color.dart';
import 'package:pokemon/constants/app_text.dart';
import 'package:pokemon/global_widgets/fade_image_custom.dart';
import 'package:pokemon/helper/helper.dart';
import 'package:pokemon/modules/detail_page/controllers/detail_controller.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DetailController());
    return Scaffold(
      backgroundColor: AppColor.dark,
      appBar: AppBar(
        title: Text(Helper.capitalizeFirstLetter(controller.pokemonName.value)),
        backgroundColor: AppColor.dark,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Obx(
            () => controller.isLoading.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        Center(
                          child: SizedBox(
                            height: 200,
                            child: FadeImageCustom(
                                image: controller.pokemonImagePath.value),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          Helper.capitalizeFirstLetter(
                              controller.pokemonName.value),
                          style: AppText.font24Normal
                              .copyWith(color: AppColor.white),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          '# ${controller.pokemonNumber.toString()}',
                          style: AppText.font24Normal
                              .copyWith(color: AppColor.white),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 16),
                          padding: const EdgeInsets.all(16),
                          width: Get.width,
                          decoration: BoxDecoration(
                              color: AppColor.grey,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(16))),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Wrap(
                                  children: [
                                    Text(
                                      'Type: ',
                                      style: AppText.font20Normal
                                          .copyWith(color: AppColor.white),
                                    ),
                                    for (var i = 0;
                                        i <
                                            controller
                                                .pokemonDetail.types.length;
                                        i++)
                                      Text(
                                        '${Helper.capitalizeFirstLetter(controller.pokemonDetail.types[i].type)}${(i != controller.pokemonDetail.types.length - 1 ? ", " : "")}',
                                        style: AppText.font20Normal
                                            .copyWith(color: AppColor.white),
                                      ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Height: ',
                                      style: AppText.font20Normal
                                          .copyWith(color: AppColor.white),
                                    ),
                                    Text(
                                      '${(controller.pokemonDetail.height / 10).toString()} m',
                                      style: AppText.font20Normal
                                          .copyWith(color: AppColor.white),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Weight: ',
                                      style: AppText.font20Normal
                                          .copyWith(color: AppColor.white),
                                    ),
                                    Text(
                                      '${(controller.pokemonDetail.weight / 10).toString()} kg',
                                      style: AppText.font20Normal
                                          .copyWith(color: AppColor.white),
                                    ),
                                  ],
                                ),
                              ]),
                        ),
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
