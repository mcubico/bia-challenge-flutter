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
    List<BasicItemModel> items = [];
    final moviesProvider = Provider.of<MoviesProvider>(context);
    final charactersProvider = Provider.of<CharacterProvider>(context);
    items = charactersProvider.characters;
    items = moviesProvider.moviesData;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Marvel Movies'),
        elevation: 0,
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          // Principal Movies
          CardSwiper(items: items),

          // Slider Movies
          MovieSlider(
            title: 'Most Populars',
            movies: items,
          ),
        ]),
      ),
    );
  }
}
