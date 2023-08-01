import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:marvel_finder/interfaces/interfaces.dart';

mixin class ApiEnvConfig implements IApiEnvConfig {
  // Marvel
  @override
  String marvelApiKeyLabel = dotenv.get('MARVEL_API_KEY_LABEL');

  @override
  String marvelApiKeyValue = dotenv.get('MARVEL_API_KEY_VALUE');

  @override
  String marvelBaseUrl = dotenv.get('MARVEL_BASE_URL');

  @override
  String marvelPrivateKey = dotenv.get('MARVEL_PRIV_KEY');

  @override
  String marvelPublicKey = dotenv.get('MARVEL_PUB_KEY');

  @override
  String marvelSegmentUrl = dotenv.get('MARVEL_URL_SEGMENT');
}

final apiEnvConfig = ApiEnvConfig();
