import 'dart:async';
import 'dart:io';
import 'package:data/src/remote/payloads/trakt_movies_payload.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';

abstract class ApiService<P extends ServicePayload> {
  Future request(
    APIRequestRepresentable request,
    P? payload,
  );
}

class DioService implements ApiService<DioServicePayload> {
  final Dio _client;

  DioService(
    this._client,
  );

  @override
  Future request(
    APIRequestRepresentable request,
    DioServicePayload? payload,
  ) async {
    try {
      final response = await _client.request(
        request.url,
        options: payload?.options,
        queryParameters: request.query,
        data: request.body,
        cancelToken: payload?.cancelToken,
        onReceiveProgress: payload?.onReceiveProgress,
        onSendProgress: payload?.onSendProgress,
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
