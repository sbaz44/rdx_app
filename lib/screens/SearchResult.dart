import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rdx_app/controller/SearchController.dart';

class SearchResult extends StatelessWidget {
  final SearchController _searchController = Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: new Color(0xFFF7F7F7),
      body: SafeArea(child: Container(child: Text(Get.arguments))),
    );
    // return Container(
    //   child: Text(Get.arguments),
    // );
  }
}
