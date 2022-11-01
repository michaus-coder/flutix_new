part of 'services.dart';

class MovieServices {
  static Future<List<model.Movie>> getMovies(int page,
      {http.Client? client}) async {
    String url =
        "https://api.themoviedb.org/3/discover/movie?api_key=$apikey&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=$page";
    client ??= http.Client();
    var response = await client.get(Uri(path: url));
    if (response.statusCode != 200) {
      return [];
    }
    var data = json.decode(response.body);
    List result = data['results'];

    return result.map((e) => model.Movie.fromJson(e)).toList();
  }

  static Future<model.MovieDetail> getDetails(model.Movie? movie,
      {int? movieID, http.Client? client}) async {
    String url =
        "https://api.themoviedb.org/3/movie/${movieID ?? movie!.id}?api_key=$apikey&language=en-US";
    client ??= http.Client();
    var response = await client.get(Uri(path: url));
    var data = json.decode(response.body);
    List genres = (data as Map<String, dynamic>)['genres'];
    String language = "";
    switch ((data as Map<String, dynamic>)['original_language'].toString()) {
      case 'ja':
        language = "Japanese";
        break;
      case 'id':
        language = "Indonesian";
        break;
      case 'ko':
        language = "Korean";
        break;
      case 'en':
        language = "English";
        break;
    }
    return movieID != null
        ? model.MovieDetail(model.Movie.fromJson(data),
            language: language,
            genres: genres
                .map((e) => (e as Map<String, dynamic>)['name'].toString())
                .toList())
        : model.MovieDetail(movie!,
            language: language,
            genres: genres
                .map((e) => (e as Map<String, dynamic>)['name'].toString())
                .toList());
  }

  static Future<List<model.Credit>> getCredits(int movieID,
      {http.Client? client}) async {
    String url =
        "https://api.themoviedb.org/3/movie/$movieID/credits?api_key=$apikey";
    client ??= http.Client();
    var response = await client.get(Uri(path: url));
    var data = json.decode(response.body);
    return ((data as Map<String, dynamic>)['cast'] as List)
        .map((e) => model.Credit(
            name: (e as Map<String, dynamic>)['name'],
            profilePath: (e as Map<String, dynamic>)['profile_path']))
        .take(8)
        .toList();
  }
}
