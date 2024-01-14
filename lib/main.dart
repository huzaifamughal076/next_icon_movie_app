import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:nexticon_task/Controllers/initial%20Controllers/initial_controllers.dart';
import 'package:nexticon_task/Screens/Tabbar/tabbar_screen.dart';
import 'package:nexticon_task/Utils/colors.dart';

void main() {
   WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NextIcon Movie App',
      initialBinding: InitControllers(),
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: scaffoldBgColor,
      ),
      home: const TabBarScreen(),
    );
  }
}
