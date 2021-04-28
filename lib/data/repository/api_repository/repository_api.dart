

import 'package:artists_app/data/models/artist_model.dart';
import 'package:artists_app/data/repository/api_repository/artist_api_provider.dart';

class RepositoryApi {
  final artistApiProvider = ArtistApiProvider();

  Future<List<ArtistModel>> loadArtists(String query) =>
      artistApiProvider.httpGet(query);
}
