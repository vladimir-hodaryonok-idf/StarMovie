import 'package:dio/dio.dart';

abstract class ServicePayload {}

abstract class DioServicePayload implements ServicePayload {
  final Options? options;
  final CancelToken? cancelToken;
  final ProgressCallback? onReceiveProgress;
  final ProgressCallback? onSendProgress;

  DioServicePayload(
      this.options, {
        this.cancelToken,
        this.onReceiveProgress,
        this.onSendProgress,
      });
}

class TraktMoviesPayload extends DioServicePayload {
  TraktMoviesPayload(
      super.options, {
        super.cancelToken,
        super.onReceiveProgress,
        super.onSendProgress,
      });
}