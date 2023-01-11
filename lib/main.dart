import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'modules/detail_page/bindings/detail_binding.dart';
import 'modules/detail_page/pages/detail_page.dart';
import 'modules/home_page/bindings/home_binding.dart';
import 'modules/home_page/pages/home_page.dart';

void main() {
  runApp(GetMaterialApp(
    initialRoute: '/home',
    getPages: [
      GetPage(name: '/home', page: () => const HomePage(), binding: HomeBinding()),
      GetPage(name: '/detail', page: () => const DetailPage(), binding: DetailBinding()),
    ],
  ));
}