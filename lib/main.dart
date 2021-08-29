import 'package:flutter/material.dart';
import 'package:flutter_post_api/post_result_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PostResult? postResult = null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Demo POST API'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text((postResult != null)
                  ? postResult!.id +
                      " | " +
                      postResult!.job +
                      " | " +
                      postResult!.name +
                      " | " +
                      postResult!.created
                  : "Tidak ada data"),
              ElevatedButton(
                onPressed: () {
                  PostResult.connectToAPI("Rum", "Programmer").then((value){
                    postResult = value;
                    setState(() {
                      
                    });
                  });
                },
                child: Text('POST'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
