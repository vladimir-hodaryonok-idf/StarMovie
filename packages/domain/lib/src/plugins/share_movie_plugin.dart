import 'package:flutter/services.dart';

abstract class ShareMovie {
  factory ShareMovie() => _ShareMovieImpl();

  Future<void> shareMovie(String message);
}

class _ShareMovieImpl implements ShareMovie {
  static const String _channel =
      'com.vladimir.hodaryonok.star_movie/shareMovie';
  final String _invokeMethodShare = 'share_movie';

  @override
  Future<void> shareMovie(String message) async {
    const MethodChannel platform = MethodChannel(_channel);
    try {
      await platform.invokeMethod(_invokeMethodShare, message);
    } on PlatformException catch (e) {
      print(e.toString());
    }
  }
}
