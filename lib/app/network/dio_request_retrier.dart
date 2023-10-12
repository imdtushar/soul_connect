import 'package:soul_connect/app/core/utils/secure_storage.dart';
import 'package:soul_connect/app/core/values/app_values.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;

import '/app/data/local/preference/preference_manager.dart';
import '/app/network/dio_provider.dart';

class DioRequestRetrier {
  final dioClient = DioProvider.tokenClient;
  final RequestOptions requestOptions;

  final PreferenceManager _preferenceManager =
      getx.Get.find(tag: (PreferenceManager).toString());

  DioRequestRetrier({required this.requestOptions});

  Future<Response<T>> retry<T>() async {
    var header = await getCustomHeaders();

    return await dioClient.request(
      requestOptions.path,
      cancelToken: requestOptions.cancelToken,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      onReceiveProgress: requestOptions.onReceiveProgress,
      onSendProgress: requestOptions.onSendProgress,
      options: Options(headers: header, method: requestOptions.method),
    );
  }

  Future<Map<String, String>> getCustomHeaders() async {
    final String accessToken =
        await SecureStorage.readSecureData(AppValues.token_String_Key) ?? "";
    print("Token $accessToken");

    var customHeaders = {'content-type': 'application/json'};
    if (accessToken.trim().isNotEmpty) {
      customHeaders.addAll({
        'Authorization': "Bearer $accessToken",
      });
    }

    return customHeaders;
  }
}
