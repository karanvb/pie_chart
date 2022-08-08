import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pie_chart_app/dbHelper/MongoDbModel.dart';
import 'package:pie_chart_app/dbHelper/mongodb.dart';
import 'package:pie_chart/pie_chart.dart';
import 'dbHelper/display.dart';
import 'dbHelper/mongodb.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MongoDatabase.connect();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MongoDbDisplay(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int choiceIndex = 0;
  Map<String, double> dataMap = {
    "Food Items": 78.47,
    "Clothes": 17.70,
    "Technology": 4.25,
    "Cosmetics": 3.51,
    "Other": 2.38,
  };

  List<Color> colorList = [
    const Color(0xffD95AF3),
    const Color(0xff3EE094),
    const Color(0xff3398F6),
    const Color(0xffFA4A42),
    const Color(0xffFE9539),
  ];

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      // ignore: prefer_const_constructors
      body: Center(
          // child: PieChart(
          //   dataMap: dataMap,
          //   colorList: colorList,
          //   chartRadius: MediaQuery.of(context).size.width / 2,
          //   centerText: "Pie Chart",
          //   animationDuration: const Duration(seconds: 3),
          //   chartValuesOptions:
          //       const ChartValuesOptions(showChartValuesOutside: true),
          //   legendOptions: const LegendOptions(
          //     legendPosition: LegendPosition.bottom,
          //     showLegendsInRow: true,
          //   ),
          // ),
          ),
    );
  }
}
