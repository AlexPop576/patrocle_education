import 'package:patrocle_education/Database/database_helper.dart';
import 'package:patrocle_education/Models/country_model.dart';


class CountryDao{
  final database = DatabaseHelper.instance.db;
  Future<List<CountryModel>> readAll() async{
    final data = await database.query('countries');
    return data.map((e) => CountryModel.fromMap(e)).toList();
  }
  Future<int> insert(CountryModel country) async{
    return await database.insert('countries',{
      'name': country.name
    });
  }
  Future<void> update (CountryModel country) async{
    await database.update('countries', country.toMap(), where: 'id=?', whereArgs: [country.id]);
  }
  Future<void> delete (CountryModel country) async{
    await database.delete('countries', where: 'id=?', whereArgs: [country.id]);
  }
}