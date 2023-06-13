import 'package:ehoa/app/data/local/data_list_model.dart';
import 'package:ehoa/app/data/local/subcategory_id.dart';
import 'package:ehoa/app/modules/blog/bindings/blog_binding.dart';
import 'package:ehoa/app/modules/blog/controllers/blog_controller.dart';
import 'package:ehoa/app/modules/blog/views/blog_view.dart';
import 'package:ehoa/app/modules/daily_ritual_details/bindings/daily_ritual_details_binding.dart';
import 'package:ehoa/app/modules/daily_ritual_details/controllers/daily_ritual_details_controller.dart';
import 'package:ehoa/app/modules/daily_ritual_details/views/daily_ritual_details_view.dart';
import 'package:ehoa/app/modules/daily_rituals/bindings/daily_rituals_binding.dart';
import 'package:ehoa/app/modules/daily_rituals/controllers/daily_rituals_controller.dart';
import 'package:ehoa/app/modules/daily_rituals/views/daily_rituals_view.dart';
import 'package:ehoa/app/modules/empower/views/empower_view.dart';
import 'package:ehoa/app/modules/play_podcast/controllers/play_podcast_controller.dart';
import 'package:ehoa/app/modules/play_podcast/views/play_podcast_view.dart';
import 'package:ehoa/app/modules/podcast/bindings/podcast_binding.dart';
import 'package:ehoa/app/modules/podcast/controllers/podcast_controller.dart';
import 'package:ehoa/app/modules/podcast/views/podcast_view.dart';
import 'package:ehoa/app/modules/podcasts_detail/bindings/podcasts_detail_binding.dart';
import 'package:ehoa/app/modules/podcasts_detail/controllers/podcasts_detail_controller.dart';
import 'package:ehoa/app/modules/podcasts_detail/views/podcasts_detail_view.dart';
import 'package:ehoa/app/modules/wisdom/controllers/wisdom_controller.dart';
import 'package:ehoa/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/apiModels/MainCategoriesResponse.dart';
import '../../../data/remote/api_interface.dart';
import '../../../data/remote/api_service.dart';
import '../../../routes/app_pages.dart';
import '../../../service/api_urls.dart';
import '../../../service/base_controller.dart';
import '../../../service/dio_client.dart';
import '../../wisdom/bindings/wisdom_binding.dart';
import '../../wisdom/views/wisdom_view.dart';
import '../model/posts.dart';
import 'dart:math' as math;

class EmpowerController extends GetxController with BaseController {
  ///GET POST LIST
  final postList = RxList<Posts>();
  List<String> images = List.empty(growable: true);
  int selectedIndicator = 0;
  List<DataList> podcasts = List.empty(growable: true);
  List<DataList> dailyRituals = List.empty(growable: true);
  List<DataList> widoms = List.empty(growable: true);
  int empowerNestedKey = math.Random().nextInt(10000);
  RxBool isLoading = false.obs;
  List<Category> categories = List.empty(growable: true);

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    init();
  }

  Future<void> init() async {
    getPodcast();
    getRituals();
  }

  Future<void> getPodcast() async {
    await ApiService().getEmpowerPodcasts().then((res) {
      podcasts.clear();
      if (res.isNotEmpty) {
        List<dynamic> list = res["show_latest_podcast"] as List;
        for (int i = 0; i < list.length; i++) {
          podcasts.add(DataList(
              itemId: list[i]["podcast_id"].toString(),
              itemImageUrl: list[i]["thumbnail"].toString(),
              itemName: list[i]["title"].toString(),
              map: {
                "description": list[i]['description'].toString(),
                "audio": list[i]['audio'].toString(),
                "categoryId": list[i]['category_id'].toString()
              }));
        }
      }
      update();
    }).onError((error, stackTrace) {
      debugPrint("podcastOnError => ${error.toString()}");
    });
  }

  Future<void> getRituals() async {
    await ApiService().getEmpowerRituals().then((res) {
      dailyRituals.clear();
      if (res.isNotEmpty) {
        List<dynamic> list = res["show_rituals"] as List;
        for (int i = 0; i < list.length; i++) {
          dailyRituals.add(DataList(
            itemId: list[i]["category_id"].toString(),
            itemImageUrl: list[i]["category_image"].toString(),
            itemName: list[i]["category_name"].toString(),
          ));
        }
      }
      update();
    }).onError((error, stackTrace) {
      debugPrint("daily rits error ${error.toString()}");
    });
  }

  Future<void> getWisdomTips() async {
    await ApiService().getWisdomHeaderImages(catId: "15").then((res) {
      images.clear();
      if (res.isNotEmpty) {
        List<dynamic> list = res["show_videos_sub_categories"] as List;
        for (int i = 0; i < list.length; i++) {
          images.add(ApiInterface.imgPath + list[i]["image"].toString());
        }
      }
      update();
    }).onError((error, stackTrace) {
      debugPrint("whi ${error.toString()}");
    });
  }

  Future getCategories() async {
    isLoading(true);
    await ApiService().fetchMainCategories().then((res) {
      if (res.isNotEmpty) {
        MainCategoriesResponse categoryResponse =
            MainCategoriesResponse.fromJson(res);
        categories.clear();
        categoryResponse.showCategory?.category?.forEach((element) {
          categories.add(element);
          categories[categories.length - 1].setImage =
              getCategoryImage(element);
          categories[categories.length - 1].setOnTap =
              getCategoryCallback(element);
        });
      }
      update();
      isLoading(false);
    }).onError((error, stackTrace) {
      debugPrint("category errro ${error.toString()}");
      update();
      isLoading(false);
    });
  }

  int selectedIndex = EmpowerSelection.empower;
  final pages = <String>[
    AppPages.EMPOWER, //0
    AppPages.WISDOM, //1
    AppPages.DAILY_RITUALS, //2
    AppPages.PODCASTS, //3
    AppPages.BLOG, //4
    AppPages.PODCASTS_DETAILS, //5
    AppPages.DAILY_RITUALS_DETAILS, //6,
    //AppPages.PLAY_PODCAST, //7
    //AppPages.VIEW_PAGER, //8
  ];

  void changePage(int index, {args}) {
    selectedIndex = index;
    update();
    Get.toNamed(pages[index], id: empowerNestedKey, arguments: args);
    //update();
  }

  Route? onGenerateRoute(RouteSettings settings) {
    // Get.deleteAll(force: true);
    //Get.delete<EmpowerController>();
    if (settings.name == AppPages.EMPOWER) {
      return GetPageRoute(
        settings: settings,
        page: () => const EmpowerHomeView(),
        //binding: CalendarBinding(),
      );
    }

    if (settings.name == AppPages.WISDOM) {
      Get.delete<WisdomController>(force: true);
      return GetPageRoute(
        settings: settings,
        page: () => const WisdomView(),
        binding: WisdomBinding(),
      );
    }

    if (settings.name == AppPages.BLOG) {
      Get.delete<BlogController>(force: true);
      return GetPageRoute(
        settings: settings,
        page: () => const BlogView(),
        binding: BlogBinding(),
      );
    }

    if (settings.name == AppPages.DAILY_RITUALS) {
      Get.delete<DailyRitualsController>(force: true); //}
      //Get.delete<PostsAndActivitiesVM>(force: true);
      return GetPageRoute(
        settings: settings,
        page: () => const DailyRitualsView(),
        binding: DailyRitualsBinding(),
      );
    }

    if (settings.name == AppPages.DAILY_RITUALS_DETAILS) {
      Get.delete<DailyRitualsDetailsController>(force: true); //}
      //Get.delete<PostsAndActivitiesVM>(force: true);
      return GetPageRoute(
        settings: settings,
        page: () => const DailyRitualsDetailsView(),
        binding: DailyRitualsDetailsBinding(),
      );
    }

    if (settings.name == AppPages.PODCASTS) {
      Get.delete<PodcastController>(force: true);
      return GetPageRoute(
        settings: settings,
        page: () => const PodcastView(),
        binding: PodcastBinding(),
      );
    }

    if (settings.name == AppPages.PODCASTS_DETAILS) {
      Get.delete<PodcastDetailsController>(force: true);
      return GetPageRoute(
        settings: settings,
        page: () => const PodcastDetailsView(),
        binding: PodcastDetailsBinding(),
      );
    }

    // if (settings.name == AppPages.PLAY_PODCAST) {
    //   Get.delete<PlayPodcastController>(force: true);
    //   return GetPageRoute(
    //     settings: settings,
    //     page: () => const PlayPodcastView(),
    //     binding: PlayPodcastBinding(),
    //   );
    // }

    // if (settings.name == AppPages.VIEW_PAGER) {
    //   Get.delete<ViewPagerController>(force: true);
    //   //Get.delete<PostsAndActivitiesVM>(force: true);
    //   return GetPageRoute(
    //     settings: settings,
    //     page: () => const ViewPagerView(),
    //     binding: ViewPagerBinding(),
    //   );
    // }
    //update();
    return null;
  }

  getWisdom() {
    widoms.add(DataList(
        itemId: "0",
        itemName: "Wisdom",
        itemImageUrl: AppImages.wisdomTilePng));
  }

  @override
  void onReady() async {
    getCategories();
    getWisdomTips();
    getWisdom();
    update();
    super.onReady();
  }

  String getCategoryImage(Category element) {
    if (element.categoryName!.toLowerCase().contains("wisdom")) {
      return AppImages.grouppPng;
    }
    if (element.categoryName!.toLowerCase().contains("moon phases")) {
      return AppImages.grouplpPng;
    }
    if (element.categoryName!.toLowerCase().contains("moves")) {
      return AppImages.groupgPng;
    }
    if (element.categoryName!.toLowerCase().contains("meditate")) {
      return AppImages.grouprPng;
    }
    if (element.categoryName!.toLowerCase().contains("podcast")) {
      return AppImages.groupoPng;
    }
    if (element.categoryName!.toLowerCase().contains("daily")) {
      return AppImages.groupyPng;
    }
    return AppImages.groupyPng;
  }

  VoidCallback getCategoryCallback(Category element) {
    if (element.categoryName!.toLowerCase().contains("wisdom")) {
      return () {
        SubCategoryId.setId = element.categoryId.toString();
        changePage(EmpowerSelection.wisdom);
      };
    }
    if (element.categoryName!.toLowerCase().contains("moon phases")) {
      return () {
        Get.toNamed(AppPages.MOON_PHASES);
      };
    }
    if (element.categoryName!.toLowerCase().contains("moves")) {
      return () {};
    }
    if (element.categoryName!.toLowerCase().contains("meditate")) {
      return () {};
    }
    if (element.categoryName!.toLowerCase().contains("podcast")) {
      return () {};
    }
    if (element.categoryName!.toLowerCase().contains("daily")) {
      return () {
        SubCategoryId.setId = element.categoryId.toString();
        changePage(EmpowerSelection.dailyRituals);
      };
    }
    return () {};
  }

  void showPodcast(DataList podcast) {
    final c = Get.put(PlayPodcastController());
    //for (int i = 0; i < list.length; i++) {
    c.podcastData = PodcastData(
      title: podcast.itemName,
      description: podcast.map!["description"].toString(),
      podcastId: podcast.itemId.toString(),
      thumbnail: ApiInterface.imgPath+ podcast.itemImageUrl.toString(),
      audio: podcast.map!["audio"].toString(),
    );
    update();

    Get.toNamed(AppPages.VIEW_PAGER);
    PlayPodcastView.showSheet();
    c.update();
  }
}

class EmpowerSelection {
  static const empower = 0;
  static const wisdom = 1;
  static const dailyRituals = 2;
  static const podcast = 3;
  static const blog = 4;
  static const podcastDetails = 5;
  static const dailyRitDetails = 6;
}
