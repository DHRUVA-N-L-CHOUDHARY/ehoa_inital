import 'package:ehoa/app/modules/empower/controllers/empower_controller.dart';
import 'package:ehoa/app/modules/view_pager/views/view_pager_view.dart';
import 'package:ehoa/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../service/base_controller.dart';

class ViewPagerController extends GetxController with BaseController {
  List<ViewPagerData> pageList = List.empty(growable: true);
  final empowerCtrl = Get.put(EmpowerController());
  final pageController = PageController(
    initialPage: 0,
  );
  int selectedPage = 0;
  bool? showMoon = false;

  @override
  void onReady() async {
    super.onReady();
    //getPageList();
    
  }

  void getPageList() {
    pageList.add(ViewPagerData(
        id: "0",
        title: "Journal Prompts to start observing the Maramataka",
        description:
            "The best way to begin connecting to Maramataka is to begin observing your environment as well as your own energy and start journaling what you notice - here are some starter questions for you:",
        image: AppImages.blogHeaderPng,
        isBuy: false,
        isShare: true));
    pageList.add(ViewPagerData(
        id: "1",
        title: "Journal Prompts to start observing the Maramataka",
        description:
            "The best way to begin connecting to Maramataka is to begin observing your environment as well as your own energy and start journaling what you notice - here are some starter questions for you:",
        image: AppImages.podcastHeaderPng,
        isBuy: false,
        isShare: false));
    pageList.add(ViewPagerData(
        id: "2",
        title: "Journal Prompts to start observing the Maramataka",
        description:
            "The best way to begin connecting to Maramataka is to begin observing your environment as well as your own energy and start journaling what you notice - here are some starter questions for you:",
        image: AppImages.blogHeaderPng,
        isBuy: false,
        isShare: false));
    pageList.add(ViewPagerData(
        id: "3",
        title: "Journal Prompts to start observing the Maramataka",
        description:
            "The best way to begin connecting to Maramataka is to begin observing your environment as well as your own energy and start journaling what you notice - here are some starter questions for you:",
        image: AppImages.blogHeaderPng,
        isBuy: true,
        isShare: false));
    update();
  }
}

class ViewPagerData {
  ViewPagerData(
      {this.id = "",
      this.title = "",
      this.description = "",
      this.image = "",
      this.isBuy = false,
      this.isShare = false});
  String? id;
  String? title;
  String? image;
  String? description;
  bool? isBuy;
  bool? isShare;
}
