import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:src/domain/models/models.dart';
import 'package:src/ui/widgets/widgets.dart';

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
        title: const Text('Marvel Movies'),
        elevation: 0,
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          // Principal Items
          CardSwiper(
            items: principalItems,
          ),

          // Item Slider
          ItemSlider(
            title: 'Most Popular',
            items: sliderItems,
            onNextPage: () => moviesProvider.popularMovies(),
            //onNextPage: () => comicsProvider.fetch(),
          ),
        ]),
      ),
    );
  }
}
