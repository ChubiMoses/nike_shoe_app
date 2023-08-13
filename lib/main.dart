import 'package:challenge/helper/get_di.dart' as di;
import 'package:challenge/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async{
    WidgetsFlutterBinding.ensureInitialized();

    await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nike',
      theme: ThemeData.dark(),
      home: const SplashScreen(),
    );
  }
}
