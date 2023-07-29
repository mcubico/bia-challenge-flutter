import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:src/ui/providers/the-movies-db/providers.dart';
import 'package:src/ui/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

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
          CardSwiper(movies: moviesProvider.onFetchNowPlayingMovies),

          // Slider Movies
          MovieSlider(),
        ]),
      ),
    );
  }
}
