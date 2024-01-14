import 'package:flutter/material.dart';

import '../Database/country.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
   int _rebuildCounter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 80,),
            const Text("TestPage"),
            const SizedBox(height: 30,),
            FutureBuilder<List<Country>>(
  key: ValueKey(_rebuildCounter), // This forces the FutureBuilder to rebuild
  future: DatabaseHelper.instance.getCountries(),
  builder: (BuildContext context, AsyncSnapshot<List<Country>> snapshot) {
    if (!snapshot.hasData) {
      return const Center(child: Text('Loading...'));
    }
    return snapshot.data!.isEmpty
      ? Center(child: Text('No countries in list.'))
      : ListView(
          children: snapshot.data!.map((country) {
            return Center(
              child: ListTile(
                title: Text(country.name),
                onLongPress: () {
                  setState(() {
                    DatabaseHelper.instance.remove(country.id!);
                  });
                },
              )
            );
          }).toList(),
        );
  }
),
              const SizedBox(height: 80,),
              FloatingActionButton(onPressed: () async {
               int id = await DatabaseHelper.instance.add(
                        Country(name: "Romania"),
                      );
                      print ("Country added with id: $id");
                      setState(() {
                         _rebuildCounter++;
  });
                } 
              )
          ],
        )
      )
    );
  }
}