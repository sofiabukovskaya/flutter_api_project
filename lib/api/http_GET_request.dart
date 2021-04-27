import 'dart:convert';

import 'package:artists_app/repository/models/artist_model.dart';
import 'package:http/http.dart';

Future<List<ArtistModel>> httpGet(String query) async {
  final apiKey = '410135-artistsa-9L60WU9P';
  final Uri url =
  Uri.parse('https://tastedive.com/api/similar?q=$query&k=$apiKey');
  Response response = await get(url);
  print(response.body);
  var responseJson = json.decode(response.body);
  return (responseJson['Similar']['Results'] as List)
      .map((p) => ArtistModel.fromJson(p))
      .toList();
}