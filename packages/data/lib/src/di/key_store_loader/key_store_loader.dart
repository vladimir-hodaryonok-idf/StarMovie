import 'dart:convert';
import 'package:flutter/services.dart';

class KeyStoreLoader {
  final String path;

  const KeyStoreLoader({required this.path});

  Future<Map<String, dynamic>> load() {
    return rootBundle.loadStructuredData<Map<String, dynamic>>(
      path,
      (keys) async => json.decode(keys),
    );
  }
}
