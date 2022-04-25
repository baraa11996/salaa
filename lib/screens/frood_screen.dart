import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salty/screens/sala_screen.dart';
import 'package:salty/screens/youtube_screen.dart';

class FroodScreen extends StatelessWidget {
  const FroodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> froodref =
        FirebaseFirestore.instance.collection("frood").snapshots();

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Text('الفروض'),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage('images/back1.jpg'))),
          child: StreamBuilder(
              stream: froodref,
              builder: (
                BuildContext context,
                AsyncSnapshot<QuerySnapshot> snapshot,
              ) {
                if (snapshot.hasError) {
                  return Text('Eroor');
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text('Loading');
                }

                final data = snapshot.requireData;
                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          itemCount: data.size,
                          itemBuilder: (context, index) {
                            return Center(
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                        return SalaScreen(
                                          docid: data.docs[index].id,
                                        );
                                      }),
                                    );
                                  },
                                  child: Container(
                                    height: 55.h,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade400,
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Center(
                                        child: Text(
                                      '${data.docs[index]['nameSala']}',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),

                    SizedBox(
                      height: 20.h,
                    ),
                  ],
                );
              })),
    );
  }
}
