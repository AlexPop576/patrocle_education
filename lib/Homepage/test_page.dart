import 'package:flutter/material.dart';
import 'package:patrocle_education/Database/country_dao.dart';
import 'package:patrocle_education/Database/database_helper.dart';
import 'package:patrocle_education/Models/country_model.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
final controller = TextEditingController();
List<CountryModel> countries = [];
final dao = CountryDao();
  @override
  void initState() {

    super.initState();
    dao.readAll().then((value){
      setState(() {
        countries = value;
      });
    });
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: [
              Expanded(child: TextField(controller:controller)),
          ElevatedButton(onPressed: ()async{
            final name = controller.text;
            CountryModel country = CountryModel(name: name);
            final id = await dao.insert(country);
            country = country.copyWith(id: id);
            controller.clear();
            setState(() {
              countries.add(country);
            });
          }, child: const Text('Create Country')),
           ElevatedButton(
    onPressed: () async {
      await DatabaseHelper.instance.clearTableAndResetId();
      setState(() {
      countries.clear();
    });
    },
    child: Text('Delete All'),
  )
          ],),
          ),
          ListView.builder(
           primary: false,
           shrinkWrap: true,
           itemCount: countries.length,
           itemBuilder: (ctx, index){
            final country = countries[index];
            return ListTile(
              leading: Text('${country.id}'),
              title: Text(country.name),
              trailing: IconButton(onPressed: ()async {
                await dao.delete(country);
                if(country.id== countries.last.id){
                  await DatabaseHelper.instance.decreaseMaxId(); 
                }
                setState(() {
                  countries.removeWhere((element) => element.id == country.id);
                });
              }, icon: const Icon(Icons.delete,color: Colors.red,)),
            );
           }
          )
        ],
      ))
    );
  }
}

