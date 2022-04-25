import 'package:flutter/material.dart';
import 'package:salty/screens/azkar-screen.dart';
import 'package:salty/screens/frood_screen.dart';
import 'package:salty/screens/home_screen.dart';
import 'package:salty/screens/launch_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:salty/screens/naualfil_screen.dart';
import 'package:salty/screens/sunn_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: ()=> MaterialApp(
        theme: ThemeData(
          fontFamily: 'Noto',
        ),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const[
          Locale('ar'),
        ],
        initialRoute: ('/launch_screen'),
        routes: {
          '/launch_screen': (context) => LunchScreen(),
          '/home_screen': (context) => HomeScreen(),
          '/frood_screen': (context) => FroodScreen(),
          '/sunn_screen': (context) => SunnScreen(),
          '/naualfil_screen': (context) => NaualfilScreen(),
          '/azkar_screen': (context) => AzkarScreen(),
        },
      ),
    );
  }
}

