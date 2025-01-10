import 'package:flutter/cupertino.dart';
import 'package:movie_info_app/helper/api_helper.dart';
import 'package:movie_info_app/model/imdb_model.dart';

class DataProvider with ChangeNotifier {
  final ApiHelper helper = ApiHelper();
  List<Edges> edge = [];
  List data = [];
  MovieModel? titleModel = MovieModel();

  Future<void> loadData(String? name) async {
    try {
      titleModel = await helper.getApiData(name);
      edge = titleModel?.dataMainSearch?.mainModels?.edge ?? [];
    } catch (e) {
      print("=============Error fetching data: $e");
    }
    notifyListeners();
  }
}
