import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LunchScreen extends StatefulWidget {
  const LunchScreen({Key? key}) : super(key: key);

  @override
  _LunchScreenState createState() => _LunchScreenState();
}


class _LunchScreenState extends State<LunchScreen> {

@override
  void initState() {
  Future.delayed(const Duration(seconds: 3), () {
    Navigator.pushReplacementNamed(context, '/home_screen');
  });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade400,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image(
                image: AssetImage('images/logo.png'),
              ),
            ),
            SizedBox(height: 50.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('تطبيق صلاتي',style: TextStyle(fontSize: 30, color: Colors.white),)
              ],
            ),
          ],
        ),
      ),
    );
  }
}