import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AzkarScreen extends StatefulWidget {
  const AzkarScreen({Key? key}) : super(key: key);

  @override
  _AzkarScreenState createState() => _AzkarScreenState();
}

class _AzkarScreenState extends State<AzkarScreen> {
  int _counter = 0;
  String _content = 'الحمد لله';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 80.h,
        elevation: 0,
        backgroundColor: Colors.teal,
        automaticallyImplyLeading: false,
        actionsIconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'مسبحة الاذكار ',
          style: TextStyle(
              color: Colors.white, fontFamily: 'Noto', fontSize: 25),
        ),
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(
              color: Colors.teal.shade800,
              onSelected: (value) {
                if (_content != value) {
                  setState(() {
                    _content = value;
                    _counter = 0;
                  });
                }
              },
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    child: Text(
                      'الحمد لله',
                      style: TextStyle(color: Colors.white),
                    ),
                    value: 'الحمد لله',
                  ),
                  PopupMenuItem(
                    child: Text(
                      'استغفر الله',
                      style: TextStyle(color: Colors.white),
                    ),
                    value: 'استغفر الله',
                  ),
                  PopupMenuItem(
                    child: Text(
                      'سبحان الله',
                      style: TextStyle(color: Colors.white),
                    ),
                    value: 'سبحان الله',
                  ),
                  PopupMenuItem(
                    child: Text(
                      'الله اكبر',
                      style: TextStyle(color: Colors.white),
                    ),
                    value: 'الله اكبر',
                  ),
                  PopupMenuItem(
                    child: Text(
                      'اللهم صلي على محمد',
                      style: TextStyle(color: Colors.white),
                    ),
                    value: 'اللهم صلي على محمد',
                  ),
                ];
              }),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 45),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/masjed1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(
              flex: 2,
            ),
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('images/masbaha.jpg'),
            ),
            Container(
              clipBehavior: Clip.antiAlias,
              margin: EdgeInsets.only(top: 20, bottom: 20),
              height: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black45,
                      offset: Offset(5, 0),
                      blurRadius: 6,
                    ),
                  ]),
              child: Row(
                children: [
                  Expanded(
                      child: Center(
                    child: Text(
                      _content,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Noto',
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
                  DecoratedBox(
                      decoration: BoxDecoration(color: Colors.teal),
                      child: SizedBox(
                          width: 50,
                          height: double.infinity,
                          child: Center(
                              child: Text(
                            _counter.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Noto',
                                fontSize: 28,
                                fontWeight: FontWeight.w500),
                          )))),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                    flex: 2,
                    child: Container(
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            ++_counter;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Colors.teal.shade800,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusDirectional.only(
                                    topStart: Radius.circular(10)))),
                        child: Text('تسبيح'),
                      ),
                    )),
                Expanded(
                  child: Container(
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _counter = 0;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.orange.shade700,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusDirectional.only(
                                  bottomEnd: Radius.circular(10)))),
                      child: Text('اعادة'),
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            Column(
              children: [
                Text('"قال تعالى "',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                Text('"ألا بذكر الله تطمئن القلوب"',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              ],
            ),
            SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }
}
