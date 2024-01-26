class CountryModel{
  final int id;
  final String name;
  CountryModel({ this.id=-1, required this.name});
  CountryModel copyWith({int? id, String? name}){
    return CountryModel(name: name?? this.name, id: id?? this.id);
  }
  factory CountryModel.fromMap(Map<String, dynamic> map){
    return CountryModel(name: map['name'], id: map['id']);
  }
  Map<String, dynamic> toMap()=>{
    'id': id,
    'name': name 
  };
}