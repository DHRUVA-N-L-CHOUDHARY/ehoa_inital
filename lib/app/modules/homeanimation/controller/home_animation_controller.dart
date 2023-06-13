import 'package:ehoa/app/data/models/animation_model.dart';
import 'package:ehoa/app/service/base_controller.dart';
import 'package:get/get.dart';

class HomeAnimationController extends GetxController with BaseController {
  AnimationModel animationModel = AnimationModel();
  RxBool isLoading = false.obs;
 void updateanim(String energy, String energydescri, String  zoomcrt)
  {
    animationModel.energy = energy;
    animationModel.energydescri = energydescri;
    animationModel.assetcurt = zoomcrt;
  }
}