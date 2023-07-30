import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:src/ui/widgets/casting_cards.dart';

import '../../domain/models/models.dart';
import '../providers/the-movies-db/providers.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ItemModel itemData =
        ModalRoute.of(context)!.settings.arguments as ItemModel;
    final MoviesProvider moviesProvider =
        Provider.of<MoviesProvider>(context, listen: false);

    return FutureBuilder(
      future: moviesProvider.creditsMovies(int.parse(itemData.id)),
      builder: (_, snapshot) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              _CustomAppBar(
                title: itemData.title ?? 'no-title',
                posterPathImg: itemData.posterPathImg,
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    _PosterAndTitle(itemData: itemData),
                    _Overview(itemData.overview ?? 'no overview'),
                    CastingCards(items: snapshot.data ?? []),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({
    required this.posterPathImg,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 300,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.all(0),
        centerTitle: true,
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
          padding: const EdgeInsets.only(
            bottom: 10,
            left: 10,
            right: 10,
          ),
          child: Text(
            title,
            style: const TextStyle(fontSize: 16),
          ),
        ),
        background: FadeInImage(
          placeholder: const AssetImage('assets/loading.gif'),
          image: NetworkImage(posterPathImg),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  final String title;
  final String posterPathImg;
}

class _PosterAndTitle extends StatelessWidget {
  const _PosterAndTitle({required this.itemData});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          //backDropPathImg
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              height: 100,
              placeholder: const AssetImage('assets/no-image-camera.jpg'),
              image: NetworkImage(
                itemData.backDropPathImg ?? itemData.posterPathImg,
              ),
            ),
          ),

          //SizedBox
          const SizedBox(width: 20),

          // Title, original title and vote average
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              SizedBox(
                width: 300,
                child: Text(
                  itemData.title ?? '--',
                  style: textTheme.headlineSmall,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),

              // Original Title
              Text(
                itemData.originalTitle ?? '--',
                style: textTheme.titleMedium,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),

              // Vote average
              Row(
                children: [
                  const Icon(
                    Icons.star_outlined,
                    size: 15,
                    color: Colors.indigo,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    '${itemData.voteAverage}',
                    style: textTheme.bodySmall,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  final ItemModel itemData;
}

class _Overview extends StatelessWidget {
  const _Overview(this.overview);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Text(
        overview,
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }

  final String overview;
}
