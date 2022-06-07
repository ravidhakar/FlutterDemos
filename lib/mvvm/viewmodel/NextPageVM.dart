
import 'package:flutter/cupertino.dart';
import 'package:flutter_page_navigation/mvvm/models/NextPageDataModel.dart';
import 'package:flutter_page_navigation/mvvm/repository/NextScreenRepoImp.dart';

import '../network/ApiResponse.dart';

class NextPageVM extends ChangeNotifier {
  final _myRepo = NextScreenRepoImp();

  ApiResponse<NextPageDataModel> movieMain = ApiResponse.loading();

  void _setMovieMain(ApiResponse<NextPageDataModel> response) {
    print("ravi :: $response");
    movieMain = response;
    notifyListeners();
  }

  Future<void> fetchMovies() async {
    _setMovieMain(ApiResponse.loading());
    _myRepo
        .getNextScreenData()
        .then((value) => _setMovieMain(ApiResponse.completed(value)))
        .onError((error, stackTrace) => _setMovieMain(ApiResponse.error(error.toString())));
  }
}