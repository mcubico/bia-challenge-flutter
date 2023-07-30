import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:src/domain/models/models.dart';
import 'package:src/ui/helpers/enumerators/view_routes.enum.helper.dart';

import '../../router/app_router.dart';

class CardSwiper extends StatelessWidget {
  const CardSwiper({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (items.isEmpty) {
      return SizedBox(
        width: double.infinity,
        height: size.height * 0.5,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return SizedBox(
      width: double.infinity,
      height: size.height * 0.5,
      child: Swiper(
        itemCount: items.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.4,
        itemBuilder: (context, index) {
          final ItemModel item = items[index];

          return GestureDetector(
            onTap: () => Navigator.pushNamed(
              context,
              AppRoutes.getViewRoute(ViewRoutesEnum.detail),
              arguments: {'item': item, 'getCharacters': false},
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/no-image-camera.jpg'),
                image: NetworkImage(item.posterPathImg),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }

  final List<ItemModel> items;
}
