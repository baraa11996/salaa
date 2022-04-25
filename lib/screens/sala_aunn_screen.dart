import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SalaSScreen extends StatefulWidget {
  final String docid;

  SalaSScreen({Key? key, required this.docid}) : super(key: key);

  @override
  _SalaSScreenState createState() => _SalaSScreenState();
}

class _SalaSScreenState extends State<SalaSScreen> {
  CollectionReference sunnref = FirebaseFirestore.instance.collection("sunn");
  var random = Random().nextInt(100000);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.h,
        backgroundColor: Colors.teal,
        title: Text('السنن'),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: sunnref.doc(widget.docid).get(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasData && !snapshot.data!.exists) {
              return Text("Document does not exist");
            }
            if (snapshot.hasError) {
              return Text('Eroor');
            }
            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
              return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    colors: [
                      Colors.black87.withOpacity(0.20),
                      Colors.black87.withOpacity(0.10),
                    ]
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('images/back1.jpg'),
                  ),
                ),
                child: ListView(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 250.h,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.0, 1.0), //(x,y)
                                blurRadius: 7.0,
                              ),
                            ],
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(25),
                              bottomRight: Radius.circular(25),
                            ),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(data['image']),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              Text(
                                'وقت الصلاة',
                                style: TextStyle(
                                    color: Colors.teal,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text('${data['timeSala']}',textAlign: TextAlign.center,),
                              SizedBox(
                                height: 20.h,
                              ),
                              Text(
                                'فضل الصلاة',
                                style: TextStyle(
                                    color: Colors.teal,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text('${data['fdalSala']}',textAlign: TextAlign.center,),
                              SizedBox(
                                height: 20.h,
                              ),
                              Text(
                                'ما يقرا في الصلاة',
                                style: TextStyle(
                                    color: Colors.teal,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text('${data['readSala']}',textAlign: TextAlign.center,),
                              SizedBox(
                                height: 20.h,
                              ),
                              Text(
                                'دعاء بعد الصلاة',
                                style: TextStyle(
                                    color: Colors.teal,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text('${data['doaSala']}',textAlign: TextAlign.center,),
                              SizedBox(
                                height: 20.h,
                              ),
                              Text(
                                'كيفية الصلاة',
                                style: TextStyle(
                                    color: Colors.teal,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text('${data['kefiatSala']}',textAlign: TextAlign.center,),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }
            return SizedBox();
          }),
    );
  }
}
