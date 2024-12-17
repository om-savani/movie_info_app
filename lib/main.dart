import 'package:flutter/material.dart';
import 'package:movie_info_app/screens/detail/view/detail_page.dart';
import 'package:movie_info_app/screens/home/provider/data_provider.dart';
import 'package:movie_info_app/screens/home/view/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: DataProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const HomePage(),
          'detail_page': (context) => const DetailPage(),
        },
        initialRoute: '/',
      ),
    );
  }
}
