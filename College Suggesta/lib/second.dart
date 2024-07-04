import 'package:flutter/material.dart';
import 'package:forntend/homepage.dart';
// void main(){
//   runApp(MyApp());
// }

// class SS extends StatelessWidget{
//   final String dropdownBranch;
//   final String dropdownRegion;
//   final String dropdown;
//   final String dropdownCategory;
//   const SS({
//     Key? key,
//     required this.dropdownBranch,
//     required this.dropdownRegion,
//     required this.dropdown,
//     required this.dropdownCategory,
//   }):super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: Home()
//     );
//   }
//
//
// }

class Home extends  StatefulWidget {

  String rank,dropdownBranch,dropdownRegion, dropdown, dropdownCategory;
  Home({Key ?key,
    required this.rank,
    required this.dropdownBranch,
    required  this.dropdownRegion,
    required  this.dropdown,
    required  this.dropdownCategory,
  }) : super(key:key);
  @override
  //State<Home>
  _HomeState createState() => _HomeState(rank,dropdownBranch,dropdownRegion,dropdown,dropdownCategory);
}

class _HomeState extends State<Home> {
  String rank,dropdownBranch,dropdownRegion, dropdown, dropdownCategory;
  _HomeState(this.rank,this.dropdownBranch,this.dropdownRegion,this.dropdown,this.dropdownCategory);
  String? placements;
  String? nirfranking;
  String? infrastructure;
  String? tutionfee;
  String? NBA;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("College Suggesta"),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child:
        Column(
          children: [

            Text("select below options", style: TextStyle(
                fontSize: 18
            ),),

          Divider(),

            RadioListTile(
              title: Text("Placements"),
              value: "placement_ratio",
              groupValue: placements,
              onChanged: (value){
                setState(() {
                  placements = value.toString();
                });
                print(placements);

              },

            ),
            RadioListTile(
              title: Text("NIRF Ranking"),
              value: "nirf_ranking",
              groupValue: nirfranking,
              onChanged: (value){
                setState(() {
                  nirfranking = value.toString();
                });
                print(nirfranking);
                print(dropdownBranch);
                print(dropdown);
                print(dropdownCategory);
                print(dropdownRegion);

              },

            ),

            RadioListTile(
              title: Text("Infrastructure"),
              value: "infra",
              groupValue: infrastructure,
              onChanged: (value){
                setState(() {
                  infrastructure = value.toString();
                });
                print(infrastructure);
              },

            ),

            RadioListTile(
              title: Text("College Fee"),
              value: "college_fee",
              groupValue: tutionfee,
              onChanged: (value){
                setState(() {
                  tutionfee = value.toString();
                });
                print(tutionfee);
              },

            ),


            RadioListTile(
              title: Text("NBA Accrediation"),
              value: "nba_accredit",
              groupValue: NBA,
              onChanged: (value){
                setState(() {
                  NBA = value.toString();
                });
                print(NBA);
              },

            ),

            ElevatedButton(
              child: const Text('Submit'),
              onPressed: () {
                String baseUrl;
                String uri= '';
                // var placement=placement ??;

                // if (placement!=null){
                //   uri=uri+'$placement';
                //
                // }
                // if (nirfranking!=null){
                //   uri=uri+'-'+'$nirfranking';
                //
                // }
                // if (infrastructure!=null){
                //   uri=uri+'-'+'$infrastructure';
                //
                // }
                //
                // if (tutionfee!=null){
                //   uri=uri+'-'+'$tutionfee';
                //
                // }







                // baseUrl='http://10.0.2.2:8000/apidata/$rank/$dropdownRegion/$dropdownCategory/$placement/';

                baseUrl='http://43.207.87.18/apidata/$rank/$dropdownRegion/$dropdownCategory/$dropdown/$dropdownBranch/$placements-$nirfranking-$NBA-$infrastructure-$tutionfee/';
                // baseUrl='http://192.168.29.171:8000/apidata/$rank/$dropdownRegion/$dropdownCategory/$dropdown/$dropdownBranch/$placements-$nirfranking-$NBA-$infrastructure-$tutionfee/';
                // baseUrl='http://192.168.218.7:8000/apidata/$rank/$dropdownRegion/$dropdownCategory/$dropdown/$dropdownBranch/$placements-$nirfranking-$NBA-$infrastructure-$tutionfee/';
                // baseUrl='http://192.168.29.171:8000/apidata/$rank/$dropdownRegion/sc/Male/cse/$placements-$nirfranking-$infrastructure-$tutionfee/';
                print(baseUrl);
                // baseUrl='http://127.0.0.1:8000/apidata/$rank/$dropdownRegion/$dropdownCategory/$placement/';
                //Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));

                Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage(baseUrl:baseUrl)));
              },
            )

      ],
        ),
      ),


    );


  }
}