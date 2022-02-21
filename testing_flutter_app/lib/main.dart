import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing_flutter_app/news_change_notifier.dart';
import 'package:testing_flutter_app/news_page.dart';
import 'package:testing_flutter_app/news_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      home: ChangeNotifierProvider(
        create: (_) => NewsChangeNotifier(NewsService()),
        child: const NewsPage(),
      ),
    );
  }
}
