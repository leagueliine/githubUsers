import 'package:crypto_count/models/icon_model.dart';
import 'package:crypto_count/services/crypto_api_service.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CryptoController extends GetxController {
  final Rx<ApiIconResponse> _apiIcon = Rx<ApiIconResponse>(ApiIconResponse());

  ApiIconResponse get apiIcon => _apiIcon.value;

  set apiIcon(value) {
    _apiIcon.value = value;
    _apiIcon.refresh();
  }

  Future<ApiIconResponse?> getApiIcon() async {
    try {
      final response = await getCrypto();

      apiIcon = ApiIconResponse(
          assetId: response.assetId,
          exchangeId: response.exchangeId,
          url: response.url);

      return ApiIconResponse();
    } catch (e) {
      throw Exception(e);
    }
  }
}
