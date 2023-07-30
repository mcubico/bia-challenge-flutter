import 'package:flutter/material.dart';

import '../../domain/models/models.dart';
import '../../router/app_router.dart';
import '../helpers/helpers.dart';

class ItemSearchPoster extends StatelessWidget {
  const ItemSearchPoster({
    super.key,
    required this.itemData,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: FadeInImage(
        placeholder: const AssetImage('assets/no-image-camera.jpg'),
        image: NetworkImage(itemData.posterPathImg),
        width: 50,
        fit: BoxFit.contain,
      ),
      title: Text(itemData.title ?? 'no-title'),
      subtitle: Text(itemData.originalTitle ?? ''),
      onTap: () => Navigator.pushNamed(
        context,
        AppRoutes.getViewRoute(ViewRoutesEnum.detail),
        arguments: {'item': itemData, 'getCharacters': true},
      ),
    );
  }

  final ItemModel itemData;
}
