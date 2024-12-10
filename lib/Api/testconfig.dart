import 'package:flutter/material.dart';
import 'package:cenem/Api/config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load the configuration
  final config = await Config.loadFromAsset();

  runApp(MyApp(config: config));
}

class MyApp extends StatelessWidget {
  final Config config;

  MyApp({required this.config});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Config Example')),
        body: Center(
          child: Text('API Base URL: ${config.apiBaseUrl}'),
        ),
      ),
    );
  }
}
