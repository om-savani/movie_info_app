import 'package:flutter/cupertino.dart';
import 'package:movie_info_app/helper/api_helper.dart';
import 'package:movie_info_app/model/imdb_model.dart';

class DataProvider with ChangeNotifier {
  final ApiHelper helper = ApiHelper();
  List<TitleModel> title = [];
  List data = [];
  TitleModel? titleModel;
  String name = 'Titanic';

  Future<void> loadData() async {
    try {
      titleModel = await helper.getWeatherData(name);
    } catch (e) {
      print("=============Error fetching data: $e");
      title = [];
    }
    notifyListeners();
  }

  void changeName(String value) {
    name = value;
    notifyListeners();
    loadData();
  }
}
