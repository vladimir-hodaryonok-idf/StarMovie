import 'dart:async';
import 'dart:io';
import 'package:data/src/remote/payloads/dio_service_payload.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';

abstract class ApiService<P extends ServicePayload> {
  Future getRequest({
    required String path,
    Map<String, dynamic>? query,
    P? payload,
  });
}

class DioService implements ApiService<DioServicePayload> {
  final Dio _client;

  const DioService(
    this._client,
  );

  @override
  Future getRequest({
    required String path,
    Map<String, dynamic>? query,
    DioServicePayload? payload,
  }) async {
    try {
      final response = await _client.get(
        path,
        queryParameters: query,
        options: payload?.options,
        cancelToken: payload?.cancelToken,
        onReceiveProgress: payload?.onSendProgress,
      );
      return _returnResponse(response);
    } on DioError catch (e) {
      if (e.error is SocketException)
        throw FetchDataException('No Internet connection');
      else if (e.error is TimeoutException) throw TimeOutException(null);
    }
  }

  dynamic _returnResponse(Response<dynamic> response) {
    switch (response.statusCode) {
      case 200:
        return response;
      case 400:
        throw BadRequestException(response.data.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.data.toString());
      case 404:
        throw BadRequestException('Not found');
      case 500:
        throw FetchDataException('Internal Server Error');
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : '
            '${response.statusCode}');
    }
  }
}
