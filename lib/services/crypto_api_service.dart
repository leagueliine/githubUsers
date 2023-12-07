import 'dart:convert';
import 'package:crypto_count/models/icon_model.dart';
import 'package:http/http.dart' as http;

Future<ApiIconResponse> getCrypto() async {
  try {
    String iconsUrl =
        "https://rest.coinapi.io /v1/assets/icons/:size/APIKEY-82AC060E-A32D-49CD-83A3-ADC56FA197BF";
    final response = await http.get(Uri.parse(iconsUrl));

    if (response.statusCode == 200) {
      return ApiIconResponse.fromJson(jsonDecode(response.body));
    }
    return ApiIconResponse();
  } catch (e) {
    throw Exception("cach");
  }
}
