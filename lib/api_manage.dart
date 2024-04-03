import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/SourceResponse.dart';

class ApiManager {
  static Future<SourceResponse> getSources() async {
    Uri url = Uri.https("api.themoviedb.org", "3/movie/popular", {
      "apikey":
          "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4YzY3YzFmNzhmNTU2ZmJkNzQwYWRmZTM4NzE4MmU3YiIsInN1YiI6IjY2MGQxZTQ4NWFhZGM0MDE2MzY0NjI5MCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.TUasm9gsAYXuLqAflOgR7m-yF9XSuYToed1Zmi4UBpQ'"
    });
    http.Response response = await http.get(url);

    var json=jsonDecode(response.body);
   return SourceResponse.fromJson(json);

  }
}
