import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:flutter/cupertino.dart';

import '../models/data.dart';


class Student {
  // final String baseUrl = "http://10.0.2.2:8000/apidata/10000/au/st/placement/";
  String ? baseUrl;
  void url(String url){
    baseUrl=url;
  }
  // final String baseUrl = "http://10.0.2.2:8000/apidata/10000/au/st/placement/";
  // Future<UserModel?> createUser(int rank) async{
  //   final response = await http.post(Uri.parse("http://10.0.2.2:8000/"), body: {
  //     "st_boys_rank":rank,
  //   });
  //
  //   if(response.statusCode == 201){
  //     final String responseString = response.body;
  //
  //     return userModelFromJson(responseString);
  //   }else{
  //     return null;
  //   }
  // }

  Future<List> getAllStudent() async {
    try {
      var response = await http.get(Uri.parse(baseUrl!));
      // final response = await http.post(Uri.parse("http://10.0.2.2:8000/"), body: {
      //   "st_boys_rank":10000,
      // });
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server Error');
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
