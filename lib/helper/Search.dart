import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rdx_app/controller/SearchController.dart';
import 'package:rdx_app/controller/StoreController.dart';

class Search extends SearchDelegate {
  final SearchController _searchController = Get.put(SearchController());

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  String selectedResult = "";

  // @override
  // Widget buildResults(BuildContext context) {
  //   return Container(
  //     child: Center(
  //       child: Text(selectedResult),
  //     ),
  //   );
  // }

  @override
  Widget buildResults(BuildContext context) => Container();

  final List<String> listExample;
  Search(this.listExample);

  List<String> recentList = ["Text 4", "Text 3"];

  @override
  Widget buildSuggestions(BuildContext context) {
    // List<String> suggestionList = [];
    _searchController.handleSearch(query);
    // query.isEmpty
    //     ? suggestionList = recentList //In the true case
    //     : suggestionList.addAll(listExample.where(
    //         // In the false case
    //         (element) => element.contains(query),
    //       ));

    return Obx(() => ListView.builder(
          // itemCount: _searchController.response.length,
          itemCount: _searchController.response.length == 0
              ? 0
              : _searchController.response.length,
          // _searchController.data["results"][index],
          // itemCount: 2,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(_searchController.response[index].title),
              // leading: query.isEmpty ? Icon(Icons.access_time) : SizedBox(),
              onTap: () {
                selectedResult = _searchController.response[index].title;
                query = selectedResult;
                showResults(context);
              },
            );
          },
        ));
  }

  @override
  void showResults(BuildContext context) {
    print("showResults query");
    print(query);
    Get.offNamed("/search", arguments: query);
    // Navigator.of(context).popAndPushNamed(
    //   '/search',
    //   arguments: query,
    // );
    super.showResults(context);
  }
}
