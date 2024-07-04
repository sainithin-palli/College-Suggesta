import 'package:flutter/material.dart';
// import 'package:flutter/forntend/second.dart';
import 'package:forntend/second.dart';

void main() {
  runApp(MaterialApp(theme: ThemeData(primarySwatch: Colors.deepOrange),
    home: MyApp(),));

}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  TextEditingController nameController = TextEditingController();

  String dropdownBranch= 'Branch';
  String dropdownRegion='Select Region';
  String dropdown='Select Gender';
  String dropdownCategory='Select Category';


  var items1=[
    'Select Region',
    'AU',
    'SVU',
  ];

  var items2=[
    'Select Category',
    'OC',
    'SC',
    'ST',
    'BC-A',
    'BC-B',
    'BC-C',
    'BC-D',
    'BC-E',
  ];
  var items4=[
    'Select Category',
    'OC',
    'SC',
    'ST',
    'BC_A',
    'BC_B',
    'BC_C',
    'BC_D',
    'BC_E',
  ];
  var items3=[
    'Select Gender',
    'Male',
    'Female',
  ];


  // List of items in our dropdown menu
  var items = [
    'Branch',
    'CSE',
    'ECE',
    'IT',
    'EEE',
    'MEC',
    'Civil',
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Scaffold(
            appBar: AppBar(
              title: Text('Home'),
            ),
            body: Padding(
                padding: EdgeInsets.all(15),

                  child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10),
                        child: const Text(
                          'College Suggesta',
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w500,
                              fontSize: 30),
                        )),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Rank',
                          hintText: 'Enter Your Rank',

                        ),
                        keyboardType: TextInputType.number,
                      ),

                    ),



                    DropdownButton(

                      // Initial Value
                      value: dropdownRegion,
                      // value: null,

                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),
                      isExpanded: true,

                      // Array list of items
                      items: items1.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownRegion= newValue!;
                        });
                      },
                    ),

                    DropdownButton(

                      // Initial Value
                      value: dropdownCategory,

                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),
                      isExpanded: true,

                      // Array list of items
                      items: items4.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownCategory = newValue!;
                        });
                      },
                    ),

                    /*
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Category',
                        hintText: 'Enter Your Category',
                      ),
                    ),
                  ),*/
                    /*
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Branch',
                        hintText: 'Enter Required Branch',
                      ),
                    ),
                  ),*/
                    DropdownButton(

                      // Initial Value
                      value: dropdown,

                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),
                      isExpanded: true,

                      // Array list of items
                      items: items3.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdown= newValue!;
                        });
                      },
                    ),

                    DropdownButton(

                      // Initial Value
                      value: dropdownBranch,

                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),
                      isExpanded: true,

                      // Array list of items
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownBranch = newValue!;
                        });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        child: const Text('Next'),
                        onPressed: () {
                          print(nameController.text);

                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Home(rank:nameController.text,dropdownBranch:dropdownBranch.toLowerCase(),dropdownRegion:dropdownRegion,
                              dropdown:dropdown,dropdownCategory:dropdownCategory.toLowerCase()
                          )));
                        },
                      ),
                    ),
                  ],
                  ),
                  ),


            ),

        ),
    );
    }
}