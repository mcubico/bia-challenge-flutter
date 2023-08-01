import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:marvel_finder/interfaces/interfaces.dart';

mixin class AssetsEnvConfig implements IAssetsEnvConfig {
  @override
  String loadingImg = dotenv.get('LOADING_IMG');

  @override
  String noImageCamera = dotenv.get('NO_IMAGE_CAMERA_IMG');
}

final assetsEnvConfig = AssetsEnvConfig();
