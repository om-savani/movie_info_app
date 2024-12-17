import 'dart:convert';

import 'package:movie_info_app/model/imdb_model.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  Future<TitleModel?> getWeatherData(String name) async {
    Map<String, String> headers = {
      'x-rapidapi-host': 'imdb-com.p.rapidapi.com',
      'x-rapidapi-key': 'b78253d9bamshbb5413c27863b4fp1445e7jsn2341977f924e',
    };
    String link = "https://imdb-com.p.rapidapi.com/search?searchTerm=$name";

    http.Response response = await http.get(Uri.parse(link), headers: headers);

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      TitleModel models = TitleModel.fromJson(json);
      return models;
    }
    return null;
  }
}
