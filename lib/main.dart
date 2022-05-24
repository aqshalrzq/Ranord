import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:random_word/pages/home.dart';
import 'package:random_word/pages/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';

int isViewed = 0;
void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences preferences = await SharedPreferences.getInstance();
  isViewed = preferences.getInt("onBoard");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme)
      ),
      home: isViewed != 0 ? const OnBoarding() : const Home(),
    );
  }
}
