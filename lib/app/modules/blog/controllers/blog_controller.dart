import 'package:ehoa/app/data/local/play_list_model.dart';
import 'package:ehoa/app/modules/empower/controllers/empower_controller.dart';
import 'package:ehoa/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/local/subcategory_id.dart';
import '../../../data/remote/api_interface.dart';
import '../../../data/remote/api_service.dart';
import '../../../routes/app_pages.dart';
import '../../../service/base_controller.dart';
import '../../play_podcast/controllers/play_podcast_controller.dart';
import '../../play_podcast/views/play_podcast_view.dart';
import '../../view_pager/controllers/view_pager_controller.dart';
import '../../view_pager/views/view_pager_view.dart';

class BlogController extends GetxController with BaseController {
  final empowerCtrl = Get.put(EmpowerController());
  List<Tabs> tabs = List.empty(growable: true);
  List<PlayListData> blogList = List.empty(growable: true);
  List<PlayListData> podcasts = List.empty(growable: true);
  List<PlayListData> videos = List.empty(growable: true);
  int selectedTab = 0;
  static String catId = "";

  @override
  void onReady() async {
    super.onReady();
    init();
  }

  // @override
  // void onReady() {

  //   init();
  //   super.onReady();
  // }

  void init() {
    getTabs();
    getBlogs();
    getPodcasts();
    getVideos();
    update();
  }

  Future<void> getVideos() async {
    Map<String, dynamic> res = await ApiService().getWisdomVideos(catId: catId);
    videos.clear();

    //Missing fields
    //Video length,
    //title Category.
    if (res.isNotEmpty) {
      List<dynamic> list = res["show_wisdom_videos"] as List;
      for (int i = 0; i < list.length; i++) {
        videos.add(PlayListData(
            id: list[i]["video_id"].toString(),
            imageUrl: ApiInterface.imgPath + list[i]["thumbnails"].toString(),
            title: list[i]["title"].toString(),
            titleCategory: list[i]["title"] //tittle Category.
                .toString(),
            otherInfo: list[i]["description"]
                .toString()
                .substring(0, 15) //video length
            ));
      }
    }
    update();
  }

  Future<void> getBlogs() async {
    Map<String, dynamic> res = await ApiService().getWisdomBlogs(catId: catId);
    blogList.clear();

    //Missing fields
    //title Category.
    if (res.isNotEmpty) {
      List<dynamic> list = res["show_wisdom_blogs"] as List;
      for (int i = 0; i < list.length; i++) {
        blogList.add(PlayListData(
            id: list[i]["blog_id"].toString(),
            imageUrl: ApiInterface.imgPath + list[i]["image"].toString(),
            title: list[i]["title"].toString(),
            titleCategory: list[i]["title"] //tittle Category.
                .toString(),
            otherInfo: "Written by " + list[i]["author_name"].toString(),
            map: {
              "slideTitle": list[i]["slide_title"],
              "slideId": list[i]["slide_id"].toString(),
              "slideDescription": list[i]["slide_description"].toString(),
              "slideImage": list[i]["slide_image"].toString(),
              "productUrl": list[i]["product_url"].toString()
            } //video length
            ));
      }
    }
    update();
  }

  Future<void> getPodcasts() async {
    Map<String, dynamic> res =
        await ApiService().getWisdomPodcasts(catId: catId);
    podcasts.clear();

    //Missing fields
    //Video length,
    //title Category.
    if (res.isNotEmpty) {
      List<dynamic> list = res["show_wisdom_podcasts"] as List;
      for (int i = 0; i < list.length; i++) {
        podcasts.add(PlayListData(
            id: list[i]["podcast_id"].toString(),
            imageUrl: ApiInterface.imgPath + list[i]["thumbnail"].toString(),
            title: list[i]["title"].toString(),
            titleCategory: list[i]["title"] //tittle Category.
                .toString(),
            otherInfo: list[i]["description"]
                .toString()
                .substring(0, 15) //video length
            ,
            map: {
              "audio":list[i]["audio"],
              "description":list[i]["description"]
            }));
      }
    }
    update();
  }

  void getTabs() {
    tabs.add(Tabs(
        name: "Blogs",
        index: 0,
        onTap: () {
          selectedTab = 0;
          update();
        }));
    tabs.add(Tabs(
        name: "Podcasts",
        index: 1,
        onTap: () {
          selectedTab = 1;
          update();
        }));
    tabs.add(Tabs(
        name: "Videos",
        index: 2,
        onTap: () {
          selectedTab = 2;
          update();
        }));
  }

  Future<void> showTips({tipsId, index}) async {
    final c = Get.put(ViewPagerController());
    //List<dynamic> list = await getTipsForViewPager(tipsId: tipsId);
    c.pageList.clear();

    //for (int i = 0; i < list.length; i++) {
    c.pageList.add(ViewPagerData(
        id: blogList[index].map!["slideId"].toString(),
        title: blogList[index].map!["slideTitle"].toString(),
        description: blogList[index].map!["slideDescription"],
        image: ApiInterface.imgPath + blogList[index].map!["slideImage"],
        isBuy: false,
        isShare: true));
    //  }
    update();

    Get.toNamed(AppPages.VIEW_PAGER);
    ViewPagerView.showSheet();
    c.update();
  }

  void showPodcast(PlayListData podcast) {

    final c = Get.put(PlayPodcastController());
    //for (int i = 0; i < list.length; i++) {
    c.podcastData = PodcastData(
      title: podcast.title,
      description:  podcast.map!["description"].toString(),
      podcastId: podcast.id.toString(),
      thumbnail: podcast.imageUrl.toString(),
      audio: podcast.map!["audio"].toString(),
    );
    update();

    Get.toNamed(AppPages.VIEW_PAGER);
    PlayPodcastView.showSheet();
    c.update();
  }
}

class Tabs {
  Tabs({required this.name, required this.index, this.onTap});
  String name;
  int index;
  VoidCallback? onTap;
}
