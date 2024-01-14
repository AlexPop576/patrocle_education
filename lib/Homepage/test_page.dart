import 'package:flutter/material.dart';

import '../Database/country.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
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
                future: DatabaseHelper.instance.getCountries(),
                builder: (BuildContext context, AsyncSnapshot<List<Country>> snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: Text('Loading...'));
                  }
                  return snapshot.data!.isEmpty
                    ? const Center(child: Text('No countries in list.'))
                    : ListView(
                    children: snapshot.data!.map((countries) {
                      return Center(
                        child: ListTile(
                          title: Text(countries.name),
                        )
                      );
                    }).toList(),
                  );
                }
              ),
              const SizedBox(height: 80,),
              FloatingActionButton(onPressed: () async {
                await DatabaseHelper.instance.add(
                        Country(name: "Romania"),
                      );
                } 
              )
          ],
        )
      )
    );
  }
}