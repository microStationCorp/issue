import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:issue/repository/dependency_injection.dart';
import 'package:issue/view/screens/home.screen.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import 'firebase_options.dart';

Future<void> main() async {
  DependencyInjection().init();
  // Initialize flutter binding
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ShadApp.custom(
      appBuilder: (context, theme) => GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          fontFamily: GoogleFonts.inconsolata().fontFamily,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
