import 'package:flutter/material.dart';
import 'package:forntend/constants/api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:forntend/models/data.dart';

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

class MyApp extends StatefulWidget {
  // const MyHomePage({Key? key, required this.title}) : super(key: key);
  String baseUrl;
  MyApp({Key ?key,
    required this.baseUrl,
  }) : super(key:key);
  // final String title;
  @override
  _MyAppState createState() => _MyAppState(baseUrl);
}

class _MyAppState extends State<MyApp> {

  String baseUrl='';
  _MyAppState(this.baseUrl);
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
                      return Padding(
                          padding: EdgeInsets.all(15),
                          child: SingleChildScrollView(
                            child: Column(
                              children:<Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children:<Widget> [
                                      Text(
                                        "College code              :  ",
                                        textDirection: TextDirection.ltr,
                                        style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontSize: 20.0,
                                          fontFamily: 'Bold',
                                          color:Colors.green,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      // Flexible(child: TextField(decoration: InputDecoration(fillColor:Colors.blue,labelText:snapshot.data ![i]['code'],), enabled: false,))
                                      Flexible(child: Text(
                                        snapshot.data ![i]['code'],
                                        style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontSize: 20.0,
                                          // fontFamily: 'Bold',
                                          color:Colors.cyan,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ))

                                    ],
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children:<Widget> [
                                      Text(
                                        "Placement Ratio       :  ",
                                        textDirection: TextDirection.ltr,
                                        style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontSize: 20.0,
                                          fontFamily: 'Bold',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Flexible(child: TextField(decoration: InputDecoration(labelText:snapshot.data ![i]['placement_ratio'].toStringAsFixed(2)   ), enabled: false,))






                                    ],
                                  ),
                                ),


                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children:<Widget> [
                                      Text(
                                        "Placement Number  :  ",
                                        textDirection: TextDirection.ltr,
                                        style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontSize: 20.0,
                                          fontFamily: 'Bold',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Flexible(child: TextField(decoration: InputDecoration(labelText:snapshot.data ![i]['placements'].toStringAsFixed(2)   ), enabled: false,))

                                    ],
                                  ),
                                ),


                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children:<Widget> [
                                      Text(
                                        "NIRF                            :  ",
                                        textDirection: TextDirection.ltr,
                                        style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontSize: 20.0,
                                          fontFamily: 'Bold',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Flexible(child: TextField(decoration: InputDecoration(labelText:snapshot.data ![i]['nirf_ranking'].toStringAsFixed(2)   ), enabled: false,))





                                    ],
                                  ),
                                ),

                                //
                                // Padding(
                                //   padding: const EdgeInsets.all(8.0),
                                //   child: Row(
                                //     children:<Widget> [
                                //       Text(
                                //         "NBA                            :  ",
                                //         textDirection: TextDirection.ltr,
                                //         style: TextStyle(
                                //           decoration: TextDecoration.none,
                                //           fontSize: 20.0,
                                //           fontFamily: 'Bold',
                                //           fontWeight: FontWeight.w700,
                                //         ),
                                //       ),
                                //
                                //       new Text(snapshot.data ![i]['nba_accredit']),
                                //       new Container(
                                //         child:new Flexible(
                                //           child: new TextField( ),
                                //         ),//flexible
                                //       ),
                                //     ],
                                //   ),
                                // ),


                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children:<Widget> [
                                      Text(
                                        "Infrastructure            :  ",
                                        textDirection: TextDirection.ltr,
                                        style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontSize: 20.0,
                                          fontFamily: 'Bold',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Flexible(child: TextField(decoration: InputDecoration(labelText:snapshot.data ![i]['infra'].toStringAsFixed(2)   ), enabled: false,))


                                    ],
                                  ),
                                ),


                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children:<Widget> [
                                      Text(
                                        "Hostel                        :  ",
                                        textDirection: TextDirection.ltr,
                                        style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontSize: 20.0,
                                          fontFamily: 'Bold',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Flexible(child: TextField(decoration: InputDecoration(labelText:snapshot.data ![i]['hostel']  ), enabled: false,))

                                    ],
                                  ),
                                ),


                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children:<Widget> [
                                      Text(
                                        "Tution fee                  :  ",
                                        textDirection: TextDirection.ltr,
                                        style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontSize: 20.0,
                                          fontFamily: 'Bold',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),

                                      Flexible(child: TextField(decoration: InputDecoration(labelText:snapshot.data ![i]['college_fee'].toStringAsFixed(2)), enabled: false,))

                                    ],
                                  ),
                                ),


                              ],

                            ),

                          ));

                    });
                  } else{
                    return const Center(
                      child: Text('No Data Found'),
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