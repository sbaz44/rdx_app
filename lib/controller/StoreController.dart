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

  List<Map<String, dynamic>> categoryList = [
    {"name": "Healthcare", "color": "#242414", 'icon': 'assets/health.png'},
    {"name": "Logistics", "color": "#F13B2E", 'icon': 'assets/logistic.png'},
    {"name": "Security", "color": "#26AAA6", 'icon': 'assets/security.png'},
    {"name": "BFSI", "color": "#FCB901", 'icon': 'assets/bfsi.png'},
    {
      "name": "Construction",
      "color": "#242414",
      'icon': 'assets/construction.png'
    },
  ];
  void handleCategoryType(String cat) {
    // if (category.contains(cat)) {
    //   category.remove(cat);
    //   return;
    // }
    category.clear();
    print(cat);
    category.add(cat);
    print(category);
  }
}
