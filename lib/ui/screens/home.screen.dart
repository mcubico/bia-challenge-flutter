import 'package:flutter/material.dart';
import 'package:marvel_finder/domain/models/models.dart';
import 'package:marvel_finder/ui/widgets/delegates/delegates.dart';
import 'package:marvel_finder/ui/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../providers/marvel/providers.dart';
import '../providers/the-movies-db/providers.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MoviesProvider moviesProvider = Provider.of<MoviesProvider>(context);
    final CharactersProvider charactersProvider =
        Provider.of<CharactersProvider>(context);
    final ComicsProvider comicsProvider = Provider.of<ComicsProvider>(context);

    List<ItemModel> principalItems = [];
    List<ItemModel> sliderItems = [];

    // principalItems = moviesProvider.moviesData;
    // sliderItems = moviesProvider.popularMoviesData;

    principalItems = charactersProvider.characters;
    sliderItems = comicsProvider.comics;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Marvel Data'),
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => showSearch(
              context: context,
              delegate: ItemSearchDelegate(
                onSearch: (String query) {
                  return FutureBuilder(
                    // future: moviesProvider.searchMovies(query),
                    future: charactersProvider.searchCharacters(query),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const EmptyResults();
                      }

                      final items = snapshot.data ?? [];

                      return ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (context, index) => ItemSearchPoster(
                          itemData: items[index],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          // Principal Items
          CardSwiper(
            items: principalItems,
          ),

          // Item Slider
          ItemSlider(
            // onNextPage: () => moviesProvider.popularMovies(),
            // title: 'Most Popular',
            title: 'Comics',
            onNextPage: () => comicsProvider.fetch(),
            items: sliderItems,
          ),
        ]),
      ),
    );
  }
}
