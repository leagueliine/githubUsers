import 'dart:convert';

class ApiIconResponse {
  String? exchangeId;
  String? assetId;
  String? url;

  ApiIconResponse({
    this.exchangeId,
    this.assetId,
    this.url,
  });

  factory ApiIconResponse.fromJson(Map<String, dynamic> json) {
    return ApiIconResponse(
      exchangeId: json['exchange_id'],
      assetId: json['asset_id'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['exchange_id'] = exchangeId;
    data['asset_id'] = assetId;
    data['url'] = url;
    return data;
  }

  ApiIconResponse copyWith({
    String? exchangeId,
    String? assetId,
    String? url,
  }) {
    return ApiIconResponse(
      exchangeId: exchangeId ?? this.exchangeId,
      assetId: assetId ?? this.assetId,
      url: url ?? this.url,
    );
  }

  @override
  String toString() =>
      'ApiIconResponse(exchangeId: $exchangeId, assetId: $assetId, url: $url)';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'exchangeId': exchangeId,
      'assetId': assetId,
      'url': url,
    };
  }

  factory ApiIconResponse.fromMap(Map<String, dynamic> map) {
    return ApiIconResponse(
      exchangeId:
          map['exchangeId'] != null ? map['exchangeId'] as String : null,
      assetId: map['assetId'] != null ? map['assetId'] as String : null,
      url: map['url'] != null ? map['url'] as String : null,
    );
  }
}
