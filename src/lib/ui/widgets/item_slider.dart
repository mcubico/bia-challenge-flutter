import 'package:flutter/material.dart';
import 'package:src/domain/models/models.dart';
import 'package:src/router/app_router.dart';

import '../helpers/helpers.dart';

class ItemSlider extends StatefulWidget {
  const ItemSlider({
    super.key,
    required this.items,
    required this.onNextPage,
    this.title,
  });

  @override
  State<ItemSlider> createState() => _ItemSliderState();

  final String? title;
  final List<ItemModel> items;
  final Function onNextPage;
}

class _ItemSliderState extends State<ItemSlider> {
  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 500) {
        widget.onNextPage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 280,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                widget.title!,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

          // Sized Box
          const SizedBox(height: 5),

          // List View
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: widget.items.length,
              itemBuilder: (context, index) => _ItemPoster(
                itemData: widget.items[index],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  final scrollController = ScrollController();
}

class _ItemPoster extends StatelessWidget {
  const _ItemPoster({
    required this.itemData,
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
              arguments: itemData,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/no-image-camera.jpg'),
                image: NetworkImage(itemData.posterPathImg),
                fit: BoxFit.cover,
                width: 130,
                height: 190,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            itemData.title ?? 'no-name',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  final ItemModel itemData;
}
