import 'package:flutter_page_navigation/mvvm/models/NextPageDataModel.dart';
import 'package:flutter_page_navigation/mvvm/repository/BaseRepo.dart';

import '../constants/ApiEndPoints.dart';
import '../network/BaseApiService.dart';
import '../network/NetworkApiService.dart';

class NextScreenRepoImp implements BaseRepo {
  final BaseApiService _apiService = NetworkApiService();
  @override
  Future<NextPageDataModel?> getNextScreenData() async {
    try {
      dynamic response = await _apiService.getResponse(
          ApiEndPoints.getMovies);
      print("MARAJ $response");
      final jsonData = NextPageDataModel.fromJson(response);
      return jsonData;
    } catch (e) {
      throw e;
      print("MARAJ-E $e}");
    }
  }
}
