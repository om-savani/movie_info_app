import 'dart:convert';
import 'dart:developer';

import 'package:movie_info_app/model/imdb_model.dart';
import 'package:http/http.dart' as http;

// class ApiHelper {
//   Future<MovieModel?> getWeatherData(String name) async {
//     Map<String, String> headers = {
//       'x-rapidapi-host': 'imdb-com.p.rapidapi.com',
//       'x-rapidapi-key': 'b78253d9bamshbb5413c27863b4fp1445e7jsn2341977f924e',
//     };
//     String link = "https://imdb-com.p.rapidapi.com/search?searchTerm=$name";
//
//     http.Response response = await http.get(Uri.parse(link), headers: headers);
//
//     if (response.statusCode == 200) {
//       var json = jsonDecode(response.body);
//       MovieModel models = MovieModel();
//       return models;
//     }
//     return null;
//   }
// }

class ApiHelper {
  Future<MovieModel?> getApiData(String? name) async {
    String link = "https://imdb-com.p.rapidapi.com/search?searchTerm=$name";

    Map<String, String> headers = {
      'x-rapidapi-host': 'imdb-com.p.rapidapi.com',
      'x-rapidapi-key': '7fdba83299mshb0c0b4b0f829e9ep103e25jsn6950abcd98cf',
    };

    http.Response response = await http.get(Uri.parse(link), headers: headers);

    // log('${response.statusCode}');
    if (response.statusCode == 200) {
      // log('$response');
      var json = jsonDecode(response.body);
      // log('$json');
      MovieModel model = MovieModel.mapToModel(json);
      log('data =======${model}');
      return model;
    }
    return null;
  }
}
