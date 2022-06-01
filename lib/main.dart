import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce_app/routes/routes.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rosia.Shop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppRoute.initalRoute,
      getPages: AppRoute.routes,
    );
  }
}
