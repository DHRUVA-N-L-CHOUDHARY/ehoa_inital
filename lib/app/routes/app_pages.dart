import 'package:ehoa/app/modules/about_us/bindings/about_us_binding.dart';
import 'package:ehoa/app/modules/about_us/views/about_us_view.dart';
import 'package:ehoa/app/modules/age/bindings/age_binding.dart';
import 'package:ehoa/app/modules/choose_plan/bindings/choose_plan_binding.dart';
import 'package:ehoa/app/modules/choose_plan/views/choose_plan_view.dart';
import 'package:ehoa/app/modules/cycle_len_rs/bindings/cycle_len_rs_binding.dart';
import 'package:ehoa/app/modules/cycle_len_rs/views/cycle_len_rs_view.dart';
import 'package:ehoa/app/modules/edit_email_end/views/edit_email_end_view.dart';
import 'package:ehoa/app/modules/edit_email_start/views/edit_email_start_view.dart';
import 'package:ehoa/app/modules/edit_gender/bindings/edit_gender_binding.dart';
import 'package:ehoa/app/modules/edit_gender/views/edit_gender_view.dart';
import 'package:ehoa/app/modules/edit_height/views/edit_height.dart';
import 'package:ehoa/app/modules/edit_pass/bindings/edit_pass_binding.dart';
import 'package:ehoa/app/modules/edit_pass/views/edit_pass_view.dart';
import 'package:ehoa/app/modules/edit_pronoun/bindings/edit_pronoun_binding.dart';
import 'package:ehoa/app/modules/edit_pronoun/views/edit_pronoun_view.dart';
import 'package:ehoa/app/modules/edit_weigth/views/edit_weigth_view.dart';
import 'package:ehoa/app/modules/energy_grpah/bindings/energy_grpah_binding.dart';
import 'package:ehoa/app/modules/energy_grpah/views/energy_grpah_view.dart';
import 'package:ehoa/app/modules/gender_n_pronoun/bindings/genderpronoun_binding.dart';
import 'package:ehoa/app/modules/gender_n_pronoun/views/genderpronoun_view.dart';
import 'package:ehoa/app/modules/homeanimation/binding/home_animation_binding.dart';
import 'package:ehoa/app/modules/homeanimation/view/home_animation_view.dart';
import 'package:ehoa/app/modules/journal/bindings/journal_binding.dart';
import 'package:ehoa/app/modules/journal/views/journal_view.dart';
import 'package:ehoa/app/modules/journal_details/bindings/journal_details_binding.dart';
import 'package:ehoa/app/modules/journal_details/views/journal_details_view.dart';
import 'package:ehoa/app/modules/location/views/location_country_view.dart';
import 'package:ehoa/app/modules/location/views/location_tribe_view.dart';
import 'package:ehoa/app/modules/monthy_mood/bindings/monthy_mood_binding.dart';
import 'package:ehoa/app/modules/monthy_mood/views/monthy_mood_view.dart';
import 'package:ehoa/app/modules/name/bindings/name_binding.dart';
import 'package:ehoa/app/modules/name/views/name_view.dart';
import 'package:ehoa/app/modules/paywall/bindings/paywall_binding.dart';
import 'package:ehoa/app/modules/paywall/views/paywall_view.dart';
import 'package:ehoa/app/modules/play_podcast/bindings/play_podcast_binding.dart';
import 'package:ehoa/app/modules/play_podcast/views/play_podcast_view.dart';
import 'package:ehoa/app/modules/privacy_setting/views/privacy_setting_view.dart';
import 'package:ehoa/app/modules/reporting_system/bindings/reporting_system_bindings.dart';
import 'package:ehoa/app/modules/reporting_system/views/reporting_system_view.dart';
import 'package:ehoa/app/modules/settings/bindings/settings_binding.dart';
import 'package:ehoa/app/modules/settings/views/settings_view.dart';
import 'package:ehoa/app/modules/single_cms_page/bindings/PageContentBinding.dart';
import 'package:ehoa/app/modules/single_cms_page/views/page_content_view.dart';
import 'package:ehoa/app/modules/splash/bindings/splash_binding.dart';
import 'package:ehoa/app/modules/splash/views/splash_page.dart';
import 'package:ehoa/app/modules/sync_g_cal/views/sync_g_cal_view.dart';
import 'package:get/get.dart';

import '../components/navbar/bottom_navbar.dart';
import '../components/navbar/navbar_binding.dart';
import '../modules/about_us/views/about_content_view.dart';
import '../modules/age/views/age_view.dart';
import '../modules/base/bindings/base_binding.dart';
import '../modules/base/views/base_view.dart';
import '../modules/calendar_list_view/bindings/calendar_list_view_binding.dart';
import '../modules/calendar_list_view/views/calendar_list_view.dart';
import '../modules/coupon/bindings/coupon_binding.dart';
import '../modules/coupon/views/coupon_view.dart';
import '../modules/create_account/bindings/create_account_binding.dart';
import '../modules/create_account/views/create_account_view.dart';
import '../modules/cycle_details/bindings/cycle_details_binding.dart';
import '../modules/cycle_details/views/cycle_details_view.dart';
import '../modules/cycle_len/bindings/cycle_len_binding.dart';
import '../modules/cycle_len/views/cycle_len_view.dart';
import '../modules/edit_age/bindings/edit_age_binding.dart';
import '../modules/edit_age/views/edit_age_view.dart';
import '../modules/edit_email_end/bindings/edit_email_end_binding.dart';
import '../modules/edit_email_start/bindings/edit_email_start_binding.dart';
import '../modules/edit_height/bindings/edit_height_binding.dart';
import '../modules/edit_name/bindings/edit_name_binding.dart';
import '../modules/edit_name/views/edit_name_view.dart';
import '../modules/edit_weigth/bindings/edit_weigth_binding.dart';
import '../modules/gender_n_pronoun/views/gender_view.dart';
import '../modules/gender_n_pronoun/views/pronoun_view.dart';
import '../modules/language/bindings/language_binding.dart';
import '../modules/language/views/language_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/menu/bindings/menu_binding.dart';
import '../modules/menu/views/menu_view.dart';
import '../modules/moon_phases/bindings/moon_phases_binding.dart';
import '../modules/moon_phases/views/moon_phases_view.dart';
import '../modules/moon_phases_details/bindings/moon_phases_details_binding.dart';
import '../modules/moon_phases_details/views/moon_phases_details_view.dart';
import '../modules/notification/bindings/notification_binding.dart';
import '../modules/notification/views/notification_view.dart';
import '../modules/period/bindings/period_binding.dart';
import '../modules/period/views/period_view.dart';
import '../modules/period_calendar/bindings/period_calendar_binding.dart';
import '../modules/period_calendar/views/period_calendar_view.dart';
import '../modules/privacy_setting/bindings/privacy_setting_binding.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/purpose/bindings/purpose_binding.dart';
import '../modules/purpose/views/purpose_view.dart';
import '../modules/sync_g_cal/bindings/sync_g_cal_binding.dart';
import '../modules/tnc/bindings/tnc_binding.dart';
import '../modules/tnc/views/tnc_view.dart';
import '../modules/location/bindings/location_binding.dart';
import '../modules/location/views/location_view.dart';
import '../modules/view_pager/bindings/view_pager_binding.dart';
import '../modules/view_pager/views/view_pager_view.dart';
import '../modules/welcome/bindings/welcome_binding.dart';
import '../modules/welcome/views/welcome_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  static const WISDOM = Routes.WISDOM;

  static const DAILY_RITUALS = Routes.DAILY_RITUALS;

  static const PODCASTS = Routes.PODCASTS;

  static const PODCASTS_DETAILS = Routes.PODCASTS_DETAILS;

  static const DAILY_RITUALS_DETAILS = Routes.DAILY_RITUALS_DETAILS;

  static const PLAY_PODCAST = Routes.PLAY_PODCAST;

  static const VIEW_PAGER = Routes.VIEW_PAGER;

  static const ENERGY_TIPS = Routes.ENERGY_TIPS;

  static const ENERGY_TIPS_DETAILS = Routes.ENERGY_TIPS_DETAILS;

  AppPages._();

  static const INITIAL = Routes.SPLASH;
  static const HOME = Routes.HOME;
  static const CREATE_ACC = Routes.CREATE_ACC;
  static const LOGIN = Routes.LOGIN;
  static const TNC = Routes.TNC;
  static const LOCATION = Routes.Location;
  static const LOCATION_COUNTRY = Routes.LOCATION_COUNTY;
  static const LOCATION_TRIBE = Routes.LOCATION_TRIBE;
  static const NAME = Routes.NAME;
  static const AGE = Routes.AGE;
  static const GENDER_N_PRONOUN = Routes.GENDER_N_PRONOUN;
  static const PRONOUN = Routes.PRONOUN;
  static const GENDER = Routes.GENDER;
  static const PURPOSE = Routes.PURPOSE;
  static const CYCLE_LEN = Routes.CYCLE_LEN;
  static const PERIOD = Routes.PERIOD;
  static const LANG = Routes.LANG;
  static const NOTIFICATON = Routes.NOTIFICATON;
  static const WELCOME = Routes.WELCOME;
  static const PAYWALL = Routes.PAYWALL;
  static const CHOOSE_PLAN = Routes.CHOOSE_PLAN;
  static const DISC_CODE = Routes.DISC_CODE;
  static const DISC_CODE_SUCCESS = Routes.DISC_CODE_SUCCESS;
  static const BASE = Routes.BASE;
  static const HOME_ANIMATION = Routes.HOME_ANIMATION;
  static const EMPOWER = Routes.EMPOWER;
  static const CALENDAR = Routes.CALENDAR;
  static const SYMPTOMS = Routes.SYMPTOMS;
  static const TIPS = Routes.TIPS;
  static const SHOP = Routes.SHOP;
  static const BLOG = Routes.BLOG;
  static const MENU = Routes.MENU;
  static const PROFILE = Routes.PROFILE;
  static const EDIT_HEIGHT = Routes.EDIT_HEIGHT;
  static const EDIT_WEIGHT = Routes.EDIT_WEIGHT;
  static const EDIT_NAME = Routes.EDIT_NAME;
  static const EDIT_GENDER = Routes.EDIT_GENDER;
  static const EDIT_AGE = Routes.EDIT_AGE;
  static const EDIT_EMAIL_START = Routes.EDIT_EMAIL_START;
  static const EDIT_EMAIL_END = Routes.EDIT_EMAIL_END;
  static const EDIT_PRONOUN = Routes.EDIT_PRONOUN;
  static const ABOUT_US = Routes.ABOUT_US;
  static const SETTINGS = Routes.SETTINGS;
  static const PRIVACY_SETTINGS = Routes.PRIVACY_SETTINGS;
  static const CYCLE_SYNC_WITH_G_CAL = Routes.CYCLE_SYNC_WITH_G_CAL;
  static const REPORTING_SYSTEM = Routes.REPORTING_SYSTEM;
  static const RS_CYCLE_LEN = Routes.RS_CYCLE_LEN;
  static const MONTHLY_MOOD = Routes.MONTHLY_MOOD;
  static const ENERGY_GRAPH = Routes.ENERGY_GRAPH;
  static const JOURNAL = Routes.JOURNAL;
  static const JOURNAL_DETAILS = Routes.JOURNAL_DETAILS;
  static const CONTENT_PAGE = Routes.CONTENT_PAGE;
  static const SINGLE_CONTENT = Routes.SINGLE_CONTENT;
  static const EDIT_PASS = Routes.EDIT_PASS;
  static const CYCLE_DETAILS = Routes.CYCLE_DETAILS;
  static const MOON_PHASES = Routes.MOON_PHASES;
  static const MOON_PHASES_DETAILS = Routes.MOON_PHASES_DETAILS;
  static const PERIOD_CALENDAR = Routes.PERIOD_CALENDAR;
  static const CALENDAR_LIST_VIEW = Routes.CALENDAR_LIST_VIEW;

  static final routes = [
    /// SPLASH
    GetPage(
      name: _Paths.SPLASH,
      page: () => const Splash(),
      binding: SplashBinding(),
    ),

    /// NAV BAR
    GetPage(
      name: _Paths.NAV,
      page: () => const BottomNavbar(),
      binding: NavbarBinding(),
    ),

    GetPage(
      name: _Paths.HOME_ANIMATION,
      page: () => HomeAnimationView(),
      binding: HomeAnimationBinding(),
    ),

    ///
    // GetPage(
    //   name: _Paths.HOME,
    //   page: () => const HomeView(),
    //   binding: HomeBinding(),
    // ),
    GetPage(
      name: _Paths.CREATE_ACC,
      page: () => const CreateAccountView(),
      binding: CreateAccountBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.TNC,
      page: () => const TncView(),
      binding: TncBinding(),
    ),
    GetPage(
      name: _Paths.Location,
      page: () => const LocationView(),
      binding: LocationBinding(),
    ),

    GetPage(
      name: _Paths.LOCATION_COUNTY,
      page: () => const LocationCountyView(),
      //binding: LocationBinding(),
    ),
    GetPage(
      name: _Paths.LOCATION_TRIBE,
      page: () => const LocationTribeView(),
      //binding: LocationBinding(),
    ),
    GetPage(
      name: _Paths.NAME,
      page: () => const NameView(),
      binding: NameBinding(),
    ),

    GetPage(
      name: _Paths.AGE,
      page: () => const AgeView(),
      binding: AgeBinding(),
    ),

    GetPage(
      name: _Paths.GENDER_N_PRONOUN,
      page: () => const GenderNPronounView(),
      binding: GenderPronounBinding(),
    ),

    GetPage(
      name: _Paths.PRONOUN,
      page: () => const PronounView(),
    ),

    GetPage(
      name: _Paths.GENDER,
      page: () => const GenderView(),
    ),

    GetPage(
      name: _Paths.PURPOSE,
      page: () => const PurposeView(),
      binding: PurposeBinding(),
    ),

    GetPage(
      name: _Paths.CYCLE_LEN,
      page: () => const CycleLenView(),
      binding: CycleLenBinding(),
    ),

    GetPage(
      name: _Paths.PERIOD,
      page: () => const PeriodView(),
      binding: PeriodBinding(),
    ),

    GetPage(
      name: _Paths.LANG,
      page: () => const LanguageView(),
      binding: LanguageBinding(),
    ),

    GetPage(
      name: _Paths.NOTIFICATON,
      page: () => const NotificationView(),
      binding: NotificationBinding(),
    ),

    GetPage(
      name: _Paths.WELCOME,
      page: () => const WelcomeView(),
      binding: WelcomeBinding(),
    ),

    GetPage(
      name: _Paths.PAYWALL,
      page: () => const PaywallView(),
      binding: PaywallBinding(),
    ),

    GetPage(
      name: _Paths.CHOOSE_PLAN,
      page: () => const ChoosePlanView(),
      binding: ChoosePlanBinding(),
    ),

    GetPage(
      name: _Paths.DISC_CODE,
      page: () => const CouponView(),
      binding: CouponBinding(),
    ),

    GetPage(
      name: _Paths.BASE,
      page: () => const BaseView(),
      binding: BaseBinding(),
    ),

    GetPage(
      name: _Paths.VIEW_PAGER,
      page: () => const ViewPagerView(),
      binding: ViewPagerBinding(),
    ),

    GetPage(
      name: _Paths.PLAY_PODCAST,
      page: () => const PlayPodcastView(),
      binding: PlayPodcastBinding(),
    ),

    GetPage(
      name: _Paths.MENU,
      page: () => const MenuView(),
      binding: MenuBinding(),
    ),

    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_AGE,
      page: () => const EditAgeView(),
      binding: EditAgeBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_GENDER,
      page: () => const EditGenderView(),
      binding: EditGenderBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PRONOUN,
      page: () => const EditPronounView(),
      binding: EditPronounBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_NAME,
      page: () => const EditNameView(),
      binding: EditNameBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_HEIGHT,
      page: () => const EditHeightView(),
      binding: EditHeightBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_WEIGHT,
      page: () => const EditWidthView(),
      binding: EditWidthBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_EMAIL_START,
      page: () => const EditEmailStartView(),
      binding: EditEmailStartBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_EMAIL_END,
      page: () => const EditEmailEndView(),
      binding: EditEmailEndBinding(),
    ),
    GetPage(
      name: _Paths.ABOUT_US,
      page: () => const AboutUsView(),
      binding: AboutUsBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: _Paths.PRIVACY_SETTINGS,
      page: () => const PrivacySettingsView(),
      binding: PrivacySettingsBinding(),
    ),
    GetPage(
      name: _Paths.CYCLE_SYNC_WITH_G_CAL,
      page: () => const SyncCycleWithGCalView(),
      binding: SyncCycleWithGCalBinding(),
    ),
    GetPage(
      name: _Paths.REPORTING_SYSTEM,
      page: () => const ReportingSystemView(),
      binding: ReportingSystemBinding(),
    ),
    GetPage(
      name: _Paths.RS_CYCLE_LEN,
      page: () => const RSCycleLenView(),
      binding: RSCycleLenBinding(),
    ),
    GetPage(
      name: _Paths.MONTHLY_MOOD,
      page: () => const MonthlyMoodView(),
      binding: MonthlyMoodBinding(),
    ),
    GetPage(
      name: _Paths.ENERGY_GRAPH,
      page: () => const EnergyGraphView(),
      binding: EnergyGraphBinding(),
    ),
    GetPage(
      name: _Paths.JOURNAL,
      page: () => const JouranlView(),
      binding: JouranlBinding(),
    ),
    GetPage(
      name: _Paths.JOURNAL_DETAILS,
      page: () => const JournalDetailsView(),
      binding: JournalDetailsBinding(),
    ),
    GetPage(
      name: _Paths.CONTENT_PAGE,
      page: () => const AboutContentView(),
      binding: AboutUsBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PASS,
      page: () => const EditPassView(),
      binding: EditPassBinding(),
    ),
    GetPage(
      name: _Paths.SINGLE_CONTENT,
      page: () => const PageContentView(),
      binding: PageContentBinding(),
    ),

    GetPage(
      name: _Paths.CYCLE_DETAILS,
      page: () => const CycleDetailsView(),
      binding: CycleDetailsBinding(),
    ),
    GetPage(
      name: _Paths.MOON_PHASES,
      page: () => const MoonPhasesView(),
      binding: MoonPhasesBinding(),
    ),
    GetPage(
      name: _Paths.MOON_PHASES_DETAILS,
      page: () => const MoonPhasesDetailsView(),
      binding: MoonPhasesDetailsBinding(),
    ),
    GetPage(
      name: _Paths.PERIOD_CALENDAR,
      page: () => const PeriodCalendarView(),
      binding: PeriodCalendarBinding(),
    ),
    GetPage(
      name: _Paths.CALENDAR_LIST_VIEW,
      page: () => const CalendarListView(),
      binding: CalendarListViewBinding(),
    ),
  ];
}
