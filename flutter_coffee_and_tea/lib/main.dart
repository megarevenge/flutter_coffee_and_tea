import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_coffee_and_tea/components/splash_screen.dart';
import 'package:flutter_coffee_and_tea/firebase_options.dart';
import 'package:liquid_glass_widgets/liquid_glass_setup.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('showHome') ?? false;

  runApp(LiquidGlassWidgets.wrap(child: MyApp(showHome: showHome,)));
}

class MyApp extends StatefulWidget {

  final bool showHome;

  const MyApp({super.key, required this.showHome});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee & Tea',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(showHome: widget.showHome),
    );
  }
}