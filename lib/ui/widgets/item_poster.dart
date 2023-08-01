import 'package:flutter/cupertino.dart';
import 'package:marvel_finder/config/config.dart';

import '../../domain/models/models.dart';
import '../../router/app_router.dart';
import '../helpers/helpers.dart';

class ItemPoster extends StatelessWidget {
  const ItemPoster({
    super.key,
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
              arguments: {'item': itemData, 'getCharacters': true},
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage(assetsEnvConfig.noImageCamera),
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
