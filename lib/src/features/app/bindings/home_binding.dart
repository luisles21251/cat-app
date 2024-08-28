

import 'package:cat_flutter_project/injecction_container.dart';
import 'package:cat_flutter_project/src/features/app/controllers/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings{
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController(getBreedsCatUseCase: sl(), getImageUseCase: sl(), searchBreedUseCase: sl()));
  }


}