import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon/constants/app_color.dart';
import 'package:pokemon/constants/app_text.dart';
import 'package:pokemon/modules/home_page/controllers/home_controller.dart';

class NoData extends StatelessWidget {
  const NoData({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.warning_rounded,
            size: Get.height / 6,
            color: AppColor.white,
          ),
          Text(
            'Something went wrong.',
            style: AppText.font24Normal.copyWith(color: AppColor.white),
          ),
          const SizedBox(
            height: 8,
          ),
          ElevatedButton(
            style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
                backgroundColor: AppColor.dark),
            onPressed: () {
              controller.getPokemons();
            },
            child: Text('Try again.',
                style: AppText.font20Normal.copyWith(color: AppColor.white)),
          ),
        ],
      ),
    );
  }
}
