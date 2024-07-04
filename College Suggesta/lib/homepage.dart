import 'package:flutter/material.dart';
import 'package:forntend/constants/api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:forntend/models/data.dart';
import 'package:forntend/datadisplay3.dart';

import 'constants/api.dart';
// class College extends StatelessWidget {
//   const College({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Connect Flutter with Django',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Connect Flutter with Django'),
//     );
//   }
// }

class MyHomePage extends StatefulWidget {
  // const MyHomePage({Key? key, required this.title}) : super(key: key);
  String baseUrl;
  MyHomePage({Key ?key,
    required this.baseUrl,
  }) : super(key:key);
  // final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState(baseUrl);
}

class _MyHomePageState extends State<MyHomePage> {
  String baseUrl='';
  _MyHomePageState(this.baseUrl);
  Student colleges =new Student();
  Student studentService =new Student();
  @override
  Widget build(BuildContext context) {
    colleges.url(baseUrl);
    return Scaffold(
        appBar: AppBar(
          title: Text('college suggesta'),
        ),
        body:Container(
            child: FutureBuilder<List>(
                future:colleges.getAllStudent(),
                builder: (context,snapshot){
                  print(snapshot);
                  if(snapshot.hasData){
                    return ListView.builder(itemCount:snapshot.data?.length,itemBuilder:(context, i){
                      return Center(
                          child:TextButton(
                            child: Text(
                              snapshot.data ![i]['name'],
                              style: TextStyle(
                                color: Colors.green,
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(context,MaterialPageRoute(builder: (context)=>(MyApp(baseUrl:baseUrl,i:i))));
                            },
                          )
                      );
                    });
                  } else{
                    return const Center(
                      child: Text('Loading'),
                    );
                  }
                }
            )
        )



    );
  }
}



//  line 53--68
//    return ListView.builder(itemCount:snapshot.data?.length,itemBuilder:(context, i){
//    return Card(
//    child:ListTile(
//    title:Text(
//    snapshot.data ![i]['code'],
//    style:TextStyle(fontSize:30.0),
//    ),
//    subtitle:Text(
//    snapshot.data![i]['name'],
//    style:TextStyle(fontSize:30.0),
//    ),
//    ),
//
//    );
//    });
// }