import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/colors/app_colors.dart';
import 'data/models/note_model.dart';
import 'modules/auth/login_screen.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(NoteAdapter());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(

      debugShowCheckedModeBanner: false,

      title: "Notepad",

      theme: ThemeData(
        scaffoldBackgroundColor:
        AppColors.backgroundColor,
      ),

      home: LoginScreen(),

    );
  }
}