import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;
import 'package:pie_chart_app/dbHelper/MongoDbModel.dart';
import 'package:pie_chart_app/dbHelper/mongodb.dart';

class MongoDbInsert extends StatefulWidget {
  const MongoDbInsert({Key? key}) : super(key: key);

  @override
  State<MongoDbInsert> createState() => _MongoDbInsertState();
}

class _MongoDbInsertState extends State<MongoDbInsert> {
  TextEditingController nController = TextEditingController();
  TextEditingController vController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    nController.dispose();
    vController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Pie Chart'),
          backgroundColor: Colors.deepOrangeAccent,
          actions: [],
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text(
                "Insert Data",
                style: TextStyle(fontSize: 22),
              ),
              const SizedBox(
                height: 50,
              ),
              TextField(
                controller: nController,
                decoration: const InputDecoration(labelText: "Name"),
              ),
              const SizedBox(
                height: 50,
              ),
              TextField(
                controller: vController,
                decoration: const InputDecoration(labelText: "Value"),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 50,
              ),
              OutlinedButton(
                  onPressed: () {
                    _insertData(nController.text, int.parse(vController.text));
                  },
                  child: const Text("Insert"))
            ],
          ),
        )));
  }

  Future<void> _insertData(String n, int v) async {
    var _id = M.ObjectId();
    final data = MongoDbModel(id: _id, name: n, value: v);
    var result = await MongoDatabase.insert(data);
    _clearAll();
  }

  void _clearAll() {
    nController.text = "";
    vController.text = "";
  }
}
