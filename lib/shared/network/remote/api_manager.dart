import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/models/SourceResponse.dart';
import 'package:movies_app/shared/components/constants.dart';
import 'package:movies_app/shared/network/remote/endPoint.dart';
import 'package:movies_app/shared/styles/app_strings.dart';

class ApiManager {
  static Future<SourceResponse> getSources() async {

    //https://api.themoviedb.org/3/movie/popular?q=8c67c1f78f556fbd740adfe387182e7b


    Uri url = Uri.https(
      Constants.BASE_URL,
      EndPoints.sources,);
    http.Response response = await http.get(url,
    headers: {AppString.apikey:Constants.API_KEY_VALUE});

    var json=jsonDecode(response.body);
   return SourceResponse.fromJson(json);

  }
}
