import 'package:ehoa/utils/constants.dart';
import 'package:get/get.dart';

import '../../../../config/translations/strings_enum.dart';

class PaywallController extends GetxController {
  int index = SubscriptionType.premium;

  List<Feature> premiumFeatures = List.empty(growable: true);
  List<Feature> freeFeatures = List.empty(growable: true);

  @override
  void onInit() {
    super.onInit();
    getPremiumFeatures();
    getFreeFeatures();
    update();
  }

  void getPremiumFeatures() {
    premiumFeatures.add(Feature(
        featureId: "0",
        featureName: Strings.commonFeature1,
        featureIconSvg: AppIcons.kPF1Icon));
    premiumFeatures.add(Feature(
        featureId: "1",
        featureName: Strings.premiumFeature2,
        featureIconSvg: AppIcons.kPF2Icon));
    premiumFeatures.add(Feature(
        featureId: "2",
        featureName: Strings.premiumFeature3,
        featureIconSvg: AppIcons.kPF3Icon));
    premiumFeatures.add(Feature(
        featureId: "3",
        featureName: Strings.premiumFeature4,
        featureIconSvg: AppIcons.kPF4Icon));
    premiumFeatures.add(Feature(
        featureId: "4",
        featureName: Strings.premiumFeature5,
        featureIconSvg: AppIcons.kPF5Icon));
    premiumFeatures.add(Feature(
        featureId: "5",
        featureName: Strings.premiumFeature6,
        featureIconSvg: AppIcons.kPF6Icon));
  }

  void getFreeFeatures() {
    freeFeatures.add(Feature(
        featureId: "0",
        featureName: Strings.commonFeature1,
        featureIconSvg: AppIcons.kFF1Icon));
  }

  
}

class SubscriptionType {
  static const premium = 0;
  static const free = 1;
}

class Feature {
  Feature({this.featureId, this.featureName, this.featureIconSvg});

  String? featureName;
  String? featureIconSvg;
  String? featureId;
}
