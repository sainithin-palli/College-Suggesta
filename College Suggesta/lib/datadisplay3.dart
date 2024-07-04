import 'package:flutter/gestures.dart';
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
  int i;
  MyApp({Key ?key,
    required this.baseUrl,required this.i
  }) : super(key:key);
  // final String title;
  @override
  _MyAppState createState() => _MyAppState(baseUrl,i);
}

class _MyAppState extends State<MyApp> {

  String baseUrl='';
  int i;
  _MyAppState(this.baseUrl,this.i);
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
                                          color:Colors.black,
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
                                        "Placement Ratio        :  ",
                                        textDirection: TextDirection.ltr,
                                        style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontSize: 20.0,
                                          color:Colors.green,
                                          fontFamily: 'Bold',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Flexible(child: Text(snapshot.data ![i]['placement_ratio'].toString(),
                                        style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontSize: 17.0,
                                          // fontFamily: 'Bold',
                                          color:Colors.black,
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
                                        "Placement Number   :  ",
                                        textDirection: TextDirection.ltr,
                                        style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontSize: 20.0,
                                          color:Colors.green,
                                          fontFamily: 'Bold',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Flexible(child: Text(snapshot.data ![i]['placements'].toString(),
                                        style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontSize: 17.0,
                                          // fontFamily: 'Bold',
                                          color:Colors.black,
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
                                        "Branch Placements    :  ",
                                        textDirection: TextDirection.ltr,
                                        style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontSize: 20.0,
                                          color:Colors.green,
                                          fontFamily: 'Bold',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Flexible(child: Text(snapshot.data ![i]['branch_placements'].toString(),
                                        style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontSize: 17.0,
                                          // fontFamily: 'Bold',
                                          color:Colors.black,
                                          fontWeight: FontWeight.w700,
                                        ),))

                                    ],
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children:<Widget> [
                                      Text(
                                        "Highest package      :  ",
                                        textDirection: TextDirection.ltr,
                                        style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontSize: 20.0,
                                          color:Colors.green,
                                          fontFamily: 'Bold',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Flexible(child: Text(snapshot.data ![i]['high_sal'].toString(),
                                        style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontSize: 17.0,
                                          // fontFamily: 'Bold',
                                          color:Colors.black,
                                          fontWeight: FontWeight.w700,
                                        ),))

                                    ],
                                  ),
                                ),



                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children:<Widget> [
                                      Text(
                                        "Average package      :  ",
                                        textDirection: TextDirection.ltr,
                                        style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontSize: 20.0,
                                          color:Colors.green,
                                          fontFamily: 'Bold',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Flexible(child: Text(snapshot.data ![i]['avg_sal'].toString(),
                                        style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontSize: 17.0,
                                          // fontFamily: 'Bold',
                                          color:Colors.black,
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
                                        "NIRF                            :  ",
                                        textDirection: TextDirection.ltr,
                                        style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontSize: 20.0,
                                          color:Colors.green,
                                          fontFamily: 'Bold',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Flexible(child: Text(snapshot.data ![i]['nirf_ranking'].toString(),
                                        style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontSize: 17.0,
                                          // fontFamily: 'Bold',
                                          color:Colors.black,
                                          fontWeight: FontWeight.w700,
                                        ),))

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
                                        "NBA Accrediation    :  ",
                                        textDirection: TextDirection.ltr,
                                        style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontSize: 20.0,
                                          color:Colors.green,
                                          fontFamily: 'Bold',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Flexible(child: Text(snapshot.data ![i]['nba_accredit'].toString(),
                                        style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontSize: 17.0,
                                          // fontFamily: 'Bold',
                                          color:Colors.black,
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
                                        "Infrastructure            :  ",
                                        textDirection: TextDirection.ltr,
                                        style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontSize: 20.0,
                                          color:Colors.green,
                                          fontFamily: 'Bold',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Flexible(child: Text(snapshot.data ![i]['infra'].toString(),
                                        style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontSize: 17.0,
                                          // fontFamily: 'Bold',
                                          color:Colors.black,
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
                                        "Hostel                         :  ",
                                        textDirection: TextDirection.ltr,
                                        style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontSize: 20.0,
                                          color:Colors.green,
                                          fontFamily: 'Bold',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Flexible(child: Text(snapshot.data ![i]['hostel'] ,
                                        style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontSize: 17.0,
                                          // fontFamily: 'Bold',
                                          color:Colors.black,
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
                                        "Tution fee                  :  ",
                                        textDirection: TextDirection.ltr,
                                        style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontSize: 20.0,
                                          color:Colors.green,
                                          fontFamily: 'Bold',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),

                                      Flexible(child: Text(snapshot.data ![i]['college_fee'].toString(),
                                        style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontSize: 17.0,
                                          // fontFamily: 'Bold',
                                          color:Colors.black,
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
                                        "Companies visited   :        ",
                                        textDirection: TextDirection.ltr,
                                        style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontSize: 20.0,
                                          color:Colors.green,
                                          fontFamily: 'Bold',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children:<Widget> [
                                      Flexible(child: Text(snapshot.data ![i]['top_comanies'],
                                        style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontSize: 17.0,
                                          // fontFamily: 'Bold',
                                          color:Colors.black,
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
                                        "College website link          ",
                                        textDirection: TextDirection.ltr,
                                        style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontSize: 20.0,
                                          color:Colors.green,
                                          fontFamily: 'Bold',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                //
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children:<Widget> [
                                      Flexible(child: Text(snapshot.data ![i]['college_website'],
                                        style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontSize: 17.0,
                                          // fontFamily: 'Bold',
                                          color:Colors.blueAccent,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ))

                                    ],
                                  ),
                                ),


                                // //------>delete here
                                // Padding(
                                //   padding: const EdgeInsets.all(8.0),
                                //   child:RichText(
                                //     text: TextSpan(
                                //       text:"website link",
                                //       children:[
                                //     TextSpan(
                                //       style: TextStyle(color: Colors.cyan),
                                //       text: "click here",
                                //       recognizer: TapGestureRecognizer()..onTap=() async {
                                //         var url=snapshot.data ![i]['college_website'];
                                //         if (await canLaunch(url)){
                                //           await launch(url);
                                //         }else{
                                //           throw "cannot load url";
                                //         }
                                //       },
                                //     ),
                                //   ]
                                //     )
                                //
                                //   )
                                // ),



                              ],

                            ),

                          ));


                  } else{
                    CircularProgressIndicator();
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