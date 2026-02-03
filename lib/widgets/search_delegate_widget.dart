import 'package:flutter/material.dart';

class CustomSearch extends SearchDelegate {
  List<String> searchTerms = [
    "Flutter",
    "Dart",
    "Android",
    "iOS",
    "Java",
    "Kotlin",
    "Python",
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Filter based on query
    final suggestionList = searchTerms
        .where((element) => element.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return suggestionList.isEmpty
        ? Center(
      child: Text("No results for '$query'"),
    )
        : ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestionList[index]),
          onTap: () {
            query = suggestionList[index];
            showResults(context);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Filter suggestions based on query
    final suggestionList = query.isEmpty
        ? searchTerms // Show all if query is empty
        : searchTerms
        .where((element) =>
        element.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return suggestionList.isEmpty
        ? Center(
      child: Text("No suggestions for '$query'"),
    )
        : ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestionList[index]),
          onTap: () {
            query = suggestionList[index]; // Set query to selected item
            showResults(context); // Show results for this query
          },
        );
      },
    );
  }
}