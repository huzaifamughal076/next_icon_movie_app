import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:nexticon_task/Controllers/movie_controller.dart';

class InitControllers extends Bindings{
  @override
  void dependencies() {
    Get.put(MovieController(), permanent: true);
  }

}