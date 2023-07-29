import 'package:flutter/material.dart';
import 'package:src/domain/models/models.dart';
import 'package:src/router/app_router.dart';

import '../helpers/helpers.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({
    super.key,
    required this.movies,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 280,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                title!,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          const SizedBox(height: 5),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              itemBuilder: (context, index) => _MoviePoster(
                movie: movies[index],
              ),
            ),
          ),
        ],
      ),
    );
  }

  final String? title;
  final List<BasicItemModel> movies;
}

class _MoviePoster extends StatelessWidget {
  const _MoviePoster({
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 190,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(
              context,
              AppRoutes.getViewRoute(ViewRoutesEnum.detail),
              arguments: '',
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/no-image-camera.jpg'),
                image: NetworkImage(movie.posterPathImg),
                fit: BoxFit.cover,
                width: 130,
                height: 190,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            movie.title ?? 'no-name',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  final BasicItemModel movie;
}
