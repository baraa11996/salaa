import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'my_heder_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _content = 'المسبحة الالكترونية';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.teal,
        title: Text('الصفحة الرئيسية'),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('images/pngtree.jpg'),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/frood_screen');
              },
              child: Stack(
                children: [
                  Container(
                    width: 200.w,
                    height: 190.h,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('images/banar.png'))),
                    child: Center(
                        child: Text(
                          'الفروض',
                          style: TextStyle(
                              color: Colors.teal,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                  Positioned(
                    top: 140,
                    right: 20,
                    child: Text('واجبة على كل مسلم بالغ عاقل'
                        '\nذكر كان او انثى'
                        '',style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Noto',
                        fontSize: 12,
                        ),
                    textAlign: TextAlign.center,),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/sunn_screen');
              },
              child: Stack(
                children: [
                  Container(
                    width: 200.w,
                    height: 200.h,
                    decoration: BoxDecoration(
                        image:
                        DecorationImage(image: AssetImage('images/banar.png'))),
                    child: Center(
                        child: Text(
                          'السنن',
                          style: TextStyle(
                              color: Colors.teal,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                  Positioned(
                    top: 140,
                    right: 20,
                    child: Text('صلاة نافلة تابعة للصلوات المفروضة'
                        '\nوحكمها سنة مؤكدة عن النبي'
                        '',style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Noto',
                      fontSize: 12,
                    ),
                      textAlign: TextAlign.center,),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/naualfil_screen');
              },
              child: Stack(
                children: [
                  Container(
                    width: 200.w,
                    height: 200.h,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/banar.png'))),
                    child: Center(
                        child: Text(
                      'النوافل',
                      style: TextStyle(
                          color: Colors.teal,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                  Positioned(
                    top: 140,
                    right: 20,
                    child: Text('كل ما زاد عن الفرض ومنها ما يكون'
                        '\nمؤكد وغير مؤكد'
                        '',style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Noto',
                      fontSize: 12,
                    ),
                      textAlign: TextAlign.center,),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              MyHederDrawer(),
              const SizedBox(
                height: 15,
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.home),
                title: Text('الصفحة الرئيسية'),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                onTap: () {
                  Navigator.pushNamed(context, '/about_screen');
                },
                leading: Icon(Icons.account_box),
                title: Text('عن التطبيق'),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                onTap: () {
                  Navigator.pushNamed(context, '/azkar_screen');
                },
                leading: Icon(Icons.star),
                title: Text('المسبحة الالكترونية'),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              Divider(
                height: 5,
                color: Colors.grey[700],
              ),
              ListTile(
                onTap: () {},
                leading: Icon(Icons.logout),
                title: Text('تسجيل خروج'),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
