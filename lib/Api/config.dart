import 'dart:convert';
import 'package:flutter/services.dart';

class Config {
  final String apiBaseUrl;
  final String apiProxyUrl;

  Config({required this.apiBaseUrl, required this.apiProxyUrl});

  factory Config.fromJson(Map<String, dynamic> json) {
    if (json['apiBaseUrl'] is! String || json['apiProxyUrl'] is! String) {
      throw ArgumentError('Invalid JSON format');
    }
    return Config(
      apiBaseUrl: json['apiBaseUrl'] as String,
      apiProxyUrl: json['apiProxyUrl'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'apiBaseUrl': apiBaseUrl,
      'apiProxyUrl': apiProxyUrl,
    };
  }

  static Future<Config> loadFromAsset() async {
    try {
      final jsonString =
          await rootBundle.loadString('assets/config/config.json');
      final jsonResponse = json.decode(jsonString);
      if (jsonResponse is! Map<String, dynamic>) {
        throw ArgumentError('Invalid JSON format');
      }
      return Config.fromJson(jsonResponse);
    } catch (e) {
      throw Exception('Failed to load config: $e');
    }
  }
}
