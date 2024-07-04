import 'package:flutter/material.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'College Suggesta';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const MyCustomForm(),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  String dropdownvalue = 'Branch';
  String dropdownval='Select Region';
  String dropdownv='Select Category';


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
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Rank'),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter a valid Rank';
              }
              return null;
            },
          ),


          DropdownButton(

            // Initial Value
            value: dropdownval,

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
                dropdownval = newValue!;
              });
            },
          ),

          DropdownButton(

            // Initial Value
            value: dropdownv,

            // Down Arrow Icon
            icon: const Icon(Icons.keyboard_arrow_down),
            isExpanded: true,

            // Array list of items
            items: items2.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            // After selecting the desired option,it will
            // change button value to selected value
            onChanged: (String? newValue) {
              setState(() {
                dropdownv = newValue!;
              });
            },
          ),

          DropdownButton(

            // Initial Value
            value: dropdownvalue,

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
                dropdownvalue = newValue!;
              });
            },
          ),

          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),

                    );
                    // Navigator.push(context,MaterialPageRoute(builder: (context)=>));
                  }
                },
                child: const Text('Submit'),
              ),
            ),
          ),










        ],
      ),
    );
  }
}