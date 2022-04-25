import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salty/screens/sala_screen.dart';

import 'nauafil_sala_screen.dart';

class NaualfilScreen extends StatelessWidget {
  const NaualfilScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> nauref =
    FirebaseFirestore.instance.collection("naualfil").snapshots();

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Text('النوافل'),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('images/back1.jpg')
              )
          ),
          child: StreamBuilder(
              stream: nauref,
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
                return ListView.builder(
                    itemCount: data.size,
                    itemBuilder: (context, index) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: InkWell(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                                return SalaNScreen(docid: data.docs[index].id,);
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
                                    style: TextStyle(color: Colors.white,fontSize: 18.sp,fontWeight: FontWeight.bold),
                                  )),
                            ),
                          ),
                        ),
                      );
                    });
              })),
    );
  }
}
