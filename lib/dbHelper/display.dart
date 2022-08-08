import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pie_chart_app/dbHelper/MongoDbModel.dart';
import 'package:pie_chart_app/dbHelper/insert.dart';
import 'package:pie_chart_app/dbHelper/mongodb.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:pie_chart_app/dbHelper/update.dart';

class MongoDbDisplay extends StatefulWidget {
  const MongoDbDisplay({Key? key}) : super(key: key);

  @override
  State<MongoDbDisplay> createState() => _MongoDbDisplayState();
}

class _MongoDbDisplayState extends State<MongoDbDisplay> {
  int choiceIndex = 0;
  Map<String, double> dataMap = {
    "Food Items": 18.47,
    "Clothes": 17.70,
    "Technology": 4.25,
    "Cosmetics": 3.51,
    "Other": 2.38,
  };
// Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (BuildContext context) {
//                         return MongoDbInsert();
//                       },
//                       settings: RouteSettings(arguments: data)),
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pie Chart'),
        backgroundColor: Colors.deepOrangeAccent,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return MongoDbInsert();
              }));
            },
            icon: Icon(Icons.add_box_rounded),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return MongoDbUpdate();
              }));
            },
            icon: Icon(Icons.edit_note_rounded),
          ),
        ],
      ),
      body: SafeArea(
          child: FutureBuilder(
        future: MongoDatabase.getData(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (snapshot.hasData) {
              // var totalData = snapshot.data.length;
              //print("Total Data " + totalData.toString());
              // var inData = snapshot.data;
              //print(inData);
              // void dataPrase() {}

              return PieChart(dataMap: MongoDatabase.sendDataMap());
              // return ListView.builder(
              //     itemCount: snapshot.data.length,
              //     itemBuilder: (context, index) {
              //       return displayCard(
              //           MongoDbModel.fromJson(snapshot.data[index]));
              //     });
            } else {
              return Center(
                child: Text("No data Available"),
              );
            }
          }
        },
      )),
    );
  }
}

Widget displayCard(MongoDbModel data) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Text("${data.name}"),
          SizedBox(
            height: 5,
          ),
          Text("${data.value}"),
        ],
      ),
    ),
  );
}
