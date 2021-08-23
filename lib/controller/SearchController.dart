import 'dart:async';
import 'dart:convert';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:get/get.dart';
import 'package:rdx_app/helper/request.dart';
import 'package:rdx_app/models/SearchModel.dart';
import 'package:rdx_app/models/SwapiModel.dart';

class SearchController extends GetxController {
  var category = [].obs;
  List<dynamic> data = <dynamic>[].obs;
  final DioClient _client = DioClient();
  // var alertResponse = Syste().obs;
  List<SwapiModel> searchResponse = <SwapiModel>[].obs;
  List<String> catList = [
    "All",
    "CategoryA",
    "CategoryB",
    "CategoryC",
    "CategoryD"
  ];

  @override
  void onInit() {
    print("Get.arguments");
    print(Get.arguments);
    super.onInit();
  }

  void handleCategoryType(String cat) {
    if (category.contains(cat)) {
      category.remove(cat);
      return;
    }
    print(cat);
    category.add(cat);
    print(category);
  }

  void getSearch(String query) async {
    // GetSearchPost request = GetSearchPost(
    //   query: query,
    // );

    // request.getSearchData().then((value) {
    //   print("value...........");
    //   print(value);
    // }).catchError((onError) {
    //   print("onError CONTROLLER");
    //   print(onError);
    // });

    var dataa = await _client.getSearchData(query);
    print("jsonEncode(dataa)");
    print(jsonEncode(dataa));
    // data = [...dataa];
    searchResponse = [dataa];
    print(searchResponse.length);
    print("jsonEncode(searchResponse)");
    // print(jsonEncode(searchResponse));
    // print(data?.birthYear);
    // _client.getSearchData(query).then((value) {
    //   print("value.results");
    //   print(value);
    // });
    // print("object");
    // final response = await _client.getSearchData(query);
    // print("response.results");
    // print(response.results);
    //  Response userData = await _client.getSearchData(query);
    // SearchModel data = searchModelFromJson("data");
    // print("data");
    // print(searchResponse.value.results);
  }

  void handleSearch(
    String query,
  ) async {
    if (query.length > 1) {
      EasyDebounce.debounce(
          'debouncer1', Duration(milliseconds: 600), () => getSearch(query));
    }
  }
}
