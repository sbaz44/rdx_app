import 'package:get/get.dart';

class StoreController extends GetxController {
  var category = [].obs;

  List<String> catList = [
    "All",
    "CategoryA",
    "CategoryB",
    "CategoryC",
    "CategoryD"
  ];
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
