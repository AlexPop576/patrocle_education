import 'package:flutter/material.dart';
import 'package:patrocle_education/Database/database_helper.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const Text("TestPage"),
              const SizedBox(
                height: 40,
              ),
              FloatingActionButton(onPressed: () async {
                int i = await DataBaseHelper.instance.insert({
                  DataBaseHelper.columnName : "Romania"
                });
                print('the inserted id is $i');
              }, child: Text('insert'), backgroundColor: Colors.yellow[400],),
              FloatingActionButton(onPressed: () async{
                List<Map<String,dynamic>> queryRows = await DataBaseHelper.instance.queryAll();
                print(queryRows);
                Text(queryRows.toString());
              }, child: Text('query'), backgroundColor: Colors.green[400],),
              FloatingActionButton(onPressed: (){}, child: Text('update'), backgroundColor: Colors.blue[400],),
              FloatingActionButton(onPressed: (){}, child: Text('delete'), backgroundColor: Colors.red[400],),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

