import 'dart:convert';

import 'package:ehoa/app/data/local/my_shared_pref.dart';
import 'package:ehoa/app/data/remote/api_interface.dart';
import 'package:ehoa/app/data/remote/endpoints.dart';
import 'package:ehoa/app/service/helper/dialog_helper.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiService extends ApiInterface {
  @override
  Future deleteApi(
      {String? url, Map<String, String>? headers, Map? data}) async {
    var client = http.Client();
    dynamic responseJson;
    final response = await client.delete(Uri.parse(url!),
        headers: <String, String>{
          'accept': 'application/json',
          'content-type': 'application/json',
          'authorization': ApiInterface.auth!
        },
        body: jsonEncode(data));
    responseJson = jsonDecode(response.body);
    return responseJson;
  }

  @override
  Future getApi({
    String? url,
    Map<String, String>? headers,
  }) async {
    var client = http.Client();
     final response =
        await client.get(Uri.parse(url!), headers: <String, String>{
      'accept': 'application/json',
      'content-type': 'application/json',
      'authorization': ApiInterface.auth!
    });
     return response;
  }

  @override
  Future postApi({String? url, Map<String, String>? headers, Map? data}) async {
    var client = http.Client();
    print(data);
    if (MySharedPref.getToken() != null) {
      data = data ?? {};
      data['token'] = MySharedPref.getToken();
      data['user_id'] = MySharedPref.getUserId();
    }
    http.Response res = await client.post(Uri.parse(url!),
        headers: headers ??
            <String, String>{
              'accept': 'application/json',
              'content-type': 'application/json',
              'authorization': ApiInterface.auth!
            },
        body: jsonEncode(data));

    return res;
  }

  @override
  Future putApi({String? url, Map<String, String>? headers, Map? data}) async {
    var client = http.Client();
    dynamic responseJson;
    final response = await client.put(Uri.parse(url!),
        headers: headers ??
            <String, String>{
              'accept': 'application/json',
              'content-type': 'application/json',
              'authorization': ApiInterface.auth!
            },
        body: jsonEncode(data));
    responseJson = jsonDecode(response.body);
    return responseJson;
  }

  Map<String,dynamic>? _parseBaseResponse(http.Response res) {
    debugPrint(jsonEncode(res.body));
    Map<String,dynamic> response = jsonDecode(res.body);
    if (response.containsKey("error")) {
    try{
      List entryList = response['error'].entries.toList();
      List<dynamic> errorList = [];
      entryList.forEach((element) {
        errorList.add(element.value.first);
      });
      DialogHelper.showErrorDialog("Error", errorList.join("\n"));
    }catch(e){
      DialogHelper.showErrorDialog("Error",response['error']);
    }
      return null;
    } else {
      return response;
    }
  }

  Future<Map> createUserAccount(Map<String, dynamic> data) async {
    http.Response res = await postApi(
        url: ApiInterface.baseUrl + Endpoints.createUser, data: data);
    return _parseBaseResponse(res) ?? {};
  }
  Future<Map> loginUser(Map<String, dynamic> data, {bool isSocial = false}) async {
    http.Response res = await postApi(
        url: ApiInterface.baseUrl +(isSocial?Endpoints.socialSignIn:Endpoints.signIn), data: data);
    return _parseBaseResponse(res) ?? {};
  }
  Future<Map> saveTerms(Map<String, dynamic> data) async {
    http.Response res = await postApi(
        url: ApiInterface.baseUrl + Endpoints.userTermsAndCondition, data: data);
    return _parseBaseResponse(res) ?? {};
  }
  Future<Map<String,dynamic>> saveCountry(Map<String, dynamic> data) async {
    http.Response res = await postApi(
        url: ApiInterface.baseUrl + Endpoints.saveCountries, data: data);
    return _parseBaseResponse(res) ?? {};
  }
  Future<Map<String,dynamic>> fetchLocations() async {
    http.Response res = await getApi(
        url: ApiInterface.baseUrl + Endpoints.showCountries);
    return _parseBaseResponse(res) ?? {};
  }
  Future<Map<String,dynamic>> saveName(Map<String, dynamic> data) async {
    http.Response res = await postApi(
        url: ApiInterface.baseUrl + Endpoints.saveName, data: data);
    return _parseBaseResponse(res) ?? {};

  }
  Future<Map<String,dynamic>> saveYear(Map<String, dynamic> data) async {
    http.Response res = await postApi(
        url: ApiInterface.baseUrl + Endpoints.saveDob, data: data);
    return _parseBaseResponse(res) ?? {};
  }
  Future<Map<String,dynamic>> saveGender(Map<String, dynamic> data) async {
    http.Response res = await postApi(
        url: ApiInterface.baseUrl + Endpoints.saveGender, data: data);
    return _parseBaseResponse(res) ?? {};
  }
  Future<Map<String,dynamic>> saveFocus(Map<String, dynamic> data) async {
    http.Response res = await postApi(
        url: ApiInterface.baseUrl + Endpoints.saveFocus, data: data);
    return _parseBaseResponse(res) ?? {};
  }
  Future<Map<String,dynamic>> saveCycleLength(Map<String, dynamic> data) async {
    http.Response res = await postApi(
        url: ApiInterface.baseUrl + Endpoints.cycleLength, data: data);
    return _parseBaseResponse(res) ?? {};
  }
  Future<Map<String,dynamic>> forgetPassword(Map<String, dynamic> data) async {
    http.Response res = await postApi(
        url: ApiInterface.baseUrl + Endpoints.forgotPassword, data: data);
    return _parseBaseResponse(res) ?? {};
  }
  Future<Map<String,dynamic>> savePeriod(Map<String, dynamic> data) async {
    http.Response res = await postApi(
        url: ApiInterface.baseUrl + Endpoints.periodLength, data: data);
    return _parseBaseResponse(res) ?? {};
  }
  Future<Map<String,dynamic>> updateProfile(Map<String, dynamic> data) async {
    http.Response res = await postApi(
        url: ApiInterface.baseUrl + Endpoints.updateProfile, data: data);
    return _parseBaseResponse(res) ?? {};
  }
  Future<Map<String,dynamic>> changePass(Map<String, dynamic> data) async {
    http.Response res = await postApi(
        url: ApiInterface.baseUrl + Endpoints.changePass, data: data);
    return _parseBaseResponse(res) ?? {};
  }
  Future<Map<String,dynamic>> fetchDisorder({String? id}) async {
    http.Response res = await getApi(
        url: ApiInterface.baseUrl + Endpoints.showDisorders+id!);
    return _parseBaseResponse(res) ?? {};
  }
  Future<Map<String,dynamic>> showCms() async {
    http.Response res = await getApi(
        url: ApiInterface.baseUrl + Endpoints.showCMS);
    return _parseBaseResponse(res) ?? {};
  }  Future<Map<String,dynamic>> showCmsSingle(String id) async {
    http.Response res = await getApi(
        url: ApiInterface.baseUrl + Endpoints.showSinglePageContent+id);
    return _parseBaseResponse(res) ?? {};
  }

  Future<Map<String,dynamic>> showGroups() async {
    http.Response res = await getApi(
        url: ApiInterface.baseUrl + Endpoints.showGroups);
    return _parseBaseResponse(res) ?? {};
  }
  Future<Map<String,dynamic>> showProfile({String? id}) async {
    http.Response res = await getApi(
        url: ApiInterface.baseUrl + Endpoints.showUserProfile+id!);
    return _parseBaseResponse(res) ?? {};
  }
  Future<Map<String,dynamic>> fetchLanguages({String? id}) async {
    http.Response res = await getApi(
        url: ApiInterface.baseUrl + Endpoints.showLangs);
    return _parseBaseResponse(res) ?? {};
  }
  Future<Map<String,dynamic>> fetchTipsCategory() async {
    http.Response res = await getApi(
        url: ApiInterface.baseUrl + Endpoints.showEnergies);
    return _parseBaseResponse(res) ?? {};
  }
  Future<Map<String,dynamic>> fetchMainCategories() async {
    http.Response res = await getApi(
        url: ApiInterface.baseUrl + Endpoints.showCategories);
    return _parseBaseResponse(res) ?? {};
  }
  Future<Map<String,dynamic>> fetchSubCategories(id) async {
    http.Response res = await getApi(
        url: ApiInterface.baseUrl + Endpoints.showSubCategories+id);
    return _parseBaseResponse(res) ?? {};
  }
  Future<Map<String,dynamic>> fetchMoonPhases() async {
    http.Response res = await getApi(
        url: ApiInterface.baseUrl + Endpoints.showMoonPhases);
    return _parseBaseResponse(res) ?? {};
  }
   Future<Map<String,dynamic>> getTipsList({energyId, subEnergyId}) async {
    http.Response res = await getApi(
        url: ApiInterface.baseUrl + Endpoints.showTipsEnergy+energyId+"/"+subEnergyId);
    return _parseBaseResponse(res) ?? {};
  }
  Future<Map<String,dynamic>> getTipsForViewPager({tipsId}) async {
    http.Response res = await getApi(
        url: ApiInterface.baseUrl + Endpoints.showTips+tipsId);
    return _parseBaseResponse(res) ?? {};
  }
  Future<Map<String,dynamic>> getWisdomHeaderImages({catId}) async {
    http.Response res = await getApi(
        url: ApiInterface.baseUrl + Endpoints.showWisdomTips+catId);
    return _parseBaseResponse(res) ?? {};
  }
  Future<Map<String,dynamic>> getWisdomBlogs({catId}) async {
    http.Response res = await getApi(
        url: ApiInterface.baseUrl + Endpoints.showWisdomBlogs+catId);
    return _parseBaseResponse(res) ?? {};
  }
  Future<Map<String,dynamic>> getWisdomPodcasts({catId}) async {
    http.Response res = await getApi(
        url: ApiInterface.baseUrl + Endpoints.showWisdomPodcasts+catId);
    return _parseBaseResponse(res) ?? {};
  }
  Future<Map<String,dynamic>> getWisdomVideos({catId}) async {
    http.Response res = await getApi(
        url: ApiInterface.baseUrl + Endpoints.showWisdomVideos+catId);
    return _parseBaseResponse(res) ?? {};
  }
  Future<Map<String,dynamic>> getEmpowerPodcasts() async {
    http.Response res = await getApi(
        url: ApiInterface.baseUrl + Endpoints.showPodcast);
    return _parseBaseResponse(res) ?? {};
  }
  Future<Map<String,dynamic>> getEmpowerRituals() async {
    http.Response res = await getApi(
        url: ApiInterface.baseUrl + Endpoints.showRituals);
    return _parseBaseResponse(res) ?? {};
  }

  Future<Map<String,dynamic>> fetchGraphValues(id) async {
    http.Response res = await getApi(
        url: ApiInterface.baseUrl + Endpoints.radarChartEndpoint+id);
    return _parseBaseResponse(res) ?? {};
  }

  Future<Map<String,dynamic>> saveSymptoms(Map<String, dynamic> data) async {
    http.Response res = await postApi(
        url: ApiInterface.baseUrl + Endpoints.saveSymptoms, data: data);
    return _parseBaseResponse(res) ?? {};
  }

  Future<Map<String,dynamic>> showSymptoms(Map<String, dynamic> data) async {
    http.Response res = await postApi(
        url: ApiInterface.baseUrl + Endpoints.showSymptoms, data: data);
    return _parseBaseResponse(res) ?? {};
  }

   Future<Map<String,dynamic>> showSymptomsBetweenDates(Map<String, dynamic> data) async {
    http.Response res = await postApi(
        url: ApiInterface.baseUrl + Endpoints.showSymptomsBetweenDates, data: data);
    return _parseBaseResponse(res) ?? {};
  }
}
