class ArtistModel {
  String similar;
  String info;
  String results;
  String name;
  String type;


  ArtistModel({this.similar, this.info, this.results, this.name, this.type});
 factory ArtistModel.fromJson(Map<String, dynamic> parsedJson) {
   return new ArtistModel(
     similar: parsedJson['Similar'].toString(),
     info: parsedJson['Info'].toString(),
       results: parsedJson['Results'].toString(),
     name: parsedJson['Name'].toString(),
     type: parsedJson['Type'].toString()
   );
 }

 Map<String, dynamic> toJson() => {
   'Name' : name,
   'Type' : type
 };
  @override
  String toString() => 'Res $results Name: $name and Type: $type';
}