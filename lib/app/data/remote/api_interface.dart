import '../local/my_shared_pref.dart';

abstract class ApiInterface {
  //static const oldbaseUrl = "https://wahine.netgains.org/api/";
  //static const oldimgPath = "https://wahine.netgains.org/";
  static const baseUrl = "https://ehoa.app/api/";
  static const imgPath = "https://ehoa.app/";
  static String? auth = MySharedPref.getToken() ?? "";

  Future getApi({
    String? url,
    Map<String, String>? headers,
  });

  Future postApi({
    String? url,
    Map<String, String>? headers,
    Map? data,
  });

  Future putApi({
    String? url,
    Map<String, String>? headers,
    Map? data,
  });

  Future deleteApi({
    String? url,
    Map<String, String>? headers,
    Map? data,
  });
}
