import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:src/ui/helpers/enumerators/view_routes.enum.helper.dart';

import '../../router/app_router.dart';

class CardSwiper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: double.infinity,
      height: size.height * 0.5,
      child: Swiper(
        itemCount: 10,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.4,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => Navigator.pushNamed(
            context,
            AppRoutes.getViewRoute(ViewRoutesEnum.detail),
            arguments: '',
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
              placeholder: AssetImage('assets/no-image-camera.jpg'),
              image: NetworkImage('https://via.placeholder.com/300x400'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
