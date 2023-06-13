
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../controllers/shop_controller.dart';

class ShopView extends StatelessWidget {
  const ShopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShopController>(
      builder: (c) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(),
          );
      }
    );
  }
}
