import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:localjson/model/onecode.dart';


void main(){
  runApp(MaterialApp(home: MyApp(),debugShowCheckedModeBanner: false,));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future <List<Onecode>> ReadJsonData() async{
    final jsonData= await rootBundle.rootBundle.loadString('assets/codejson.json');
    final list= json.decode(jsonData) as List<dynamic>;
    return list.map((e) => Onecode.fromJson(e)).toList();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Local Json'),
        centerTitle: true,
      ),
      
      body: FutureBuilder(
        future: ReadJsonData(),
          builder: (context, data){
          var items =data.data as List<Onecode>;
          // return ListView.builder(
          //   itemCount: items==null?0:items.length,
          //     itemBuilder: (context, index){
          //     return ListTile(
          //       leading: Image.network(items[index].imageUrl.toString()),
          //       title: Text(items[index].name.toString()),
          //       trailing: Text(items[index].price.toString()),
          //     );
          //     }
          // );
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                ),
                itemCount: items==null?0:items.length,
                itemBuilder: (context,index){
                  return Card(
                    child: Column(
                      children: [
                        Container(
                          height: 90,
                          width: 100,
                          child: Image.network(items[index].imageUrl.toString()),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text('Price: ',style: TextStyle(fontSize: 18),),
                              Text(items[index].price.toString(),
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text('category: ',style: TextStyle(fontSize: 18.0),),
                              Text(items[index].category.toString()),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }
            );
          }
      ),
    );
  }
}
