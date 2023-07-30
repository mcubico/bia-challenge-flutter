import 'package:flutter/material.dart';

import '../../domain/models/models.dart';

class DetailCards extends StatelessWidget {
  const DetailCards({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return Container(
        constraints: const BoxConstraints(maxWidth: 150),
        height: 180,
        child: const Text(
          'no data',
          textAlign: TextAlign.center,
        ),
      );
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      width: double.infinity,
      height: 180,
      child: ListView.builder(
        itemCount: items.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, int index) => _DetailCard(items[index]),
      ),
    );
  }

  final List<ItemModel> items;
}

class _DetailCard extends StatelessWidget {
  const _DetailCard(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 110,
      height: 100,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: const AssetImage('assets/no-image-camera.jpg'),
              image: NetworkImage(item.posterPathImg),
              height: 140,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            item.title!,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 5)
        ],
      ),
    );
  }

  final ItemModel item;
}
