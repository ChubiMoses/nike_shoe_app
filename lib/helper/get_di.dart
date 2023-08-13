

import 'package:challenge/controllers/controller.dart';
import 'package:challenge/data/repo/shoe_repo.dart';
import 'package:get/get.dart';

Future<void> init() async {

  // Repository
  Get.lazyPut(() => ShoesRepository(), fenix: true);
 
  // controller
  Get.lazyPut(() => ShoesController(shoesRepository:Get.find<ShoesRepository>()),fenix: true);
 
}
