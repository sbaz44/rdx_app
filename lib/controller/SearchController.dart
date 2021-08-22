import 'package:get/get.dart';

class SearchController extends GetxController {
  var category = [].obs;

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
}
