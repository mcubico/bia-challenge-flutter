import 'package:flutter/material.dart';

import '../widgets.dart';

class ItemSearchDelegate extends SearchDelegate {
  ItemSearchDelegate({required this.onSearch});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => query = '',
        icon: const Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text('Result: ');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty || query.length < 3) {
      return const EmptyResults();
    }

    return onSearch(query);
  }

  final Function onSearch;
}
