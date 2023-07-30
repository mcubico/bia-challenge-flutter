import 'package:flutter/material.dart';
import 'package:src/domain/models/models.dart';
import 'package:src/ui/widgets/widgets.dart';

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
              itemBuilder: (context, index) => ItemPoster(
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
