import 'dart:convert';


import 'package:artists_app/data/models/artist_model.dart';
import 'package:http/http.dart';

class ArtistApiProvider {
  static const apiKey = '410135-artistsa-9L60WU9P';

  Future<List<ArtistModel>> httpGet(String query) async {
    final Uri url =
        Uri.parse('https://tastedive.com/api/similar?q=$query&k=$apiKey');
    Response response = await get(url);
    print(response.body);
    final responseJson = await json.decode(response.body);
    if (response.statusCode == 200) {
      return (responseJson['Similar']['Results'] as List)
          .map((p) => ArtistModel.fromJson(p))
          .toList();
    } else {
      throw Exception("Failed to load artists");
    }
  }
}
