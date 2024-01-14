import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class Country{
  final int? id;
  final String name;

  Country({this.id, required this.name});

  factory Country.fromMap(Map<String,dynamic> json) => new Country(
    id: json['id'],
    name: json['name'],
  );

  Map<String, dynamic> toMap() {
    return {
      'id' : id,
      'name' : name,
    };
  }
}

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'countries.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE country(
        id INTEGER PRIMARY KEY,
        name TEXT
      )
    ''');
  }

  Future<List<Country>> getCountries() async {
    Database db = await instance.database;
    var countries = await db.query('countries', orderBy: 'name');
    List<Country> countryList = countries.isNotEmpty ? countries.map((c) => Country.fromMap(c)).toList() : [];
    return countryList;
  }

  Future<int> add(Country country) async {
    Database db = await instance.database;
    return await db.insert('countries', country.toMap());
  }
}