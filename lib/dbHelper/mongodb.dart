import 'dart:developer';
import 'dart:convert';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:pie_chart_app/dbHelper/MongoDbModel.dart';
import 'package:pie_chart_app/dbHelper/constant.dart';

class MongoDatabase {
  static var db, userCollection;
  static connect() async {
    db = await Db.create(MONGO_CONN_URL);
    await db.open();
    inspect(db);
    userCollection = db.collection(USER_COLLECTION);
  }

// var z = new Map<String, String>();

// for( var i = 0; i <= x.length; i++ ) {
//   z[x[i]] = y[i];
// }

  static var dataList = new Map<String, double>();

  static Future<List<Map<String, dynamic>>> getData() async {
    //var dataList = new Map<String, double>();
    final arrData = await userCollection.find().toList();
    for (int i = 0; i < arrData.length; i++) {
      dataList[arrData[i]['name']] = arrData[i]['value'] + 0.0;
    }
    print(dataList);
    sendDataMap();
    return arrData;
  }

  static Map<String, double> sendDataMap() {
    return dataList;
  }

  static Future<String> insert(MongoDbModel data) async {
    try {
      var result = await userCollection.insertOne(data.toJson());
      if (result.isSuccess) {
        return "Data Inserted";
      } else {
        return "Something wrong while inserting";
      }
      return result;
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }
}
