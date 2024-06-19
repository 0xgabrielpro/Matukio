import 'package:eventright_pro_user/model/search_event_model.dart';
import 'package:flutter/cupertino.dart';

class SearchProvider extends ChangeNotifier {
  /// call api for events ///

  final bool _searchDataLoader = false;
  bool get searchDataLoader => _searchDataLoader;
  List<SearchData> searchData = [];
  DateTime? searchDate;

  // Future<BaseModel<SearchEventModel>> callApiForSearchEvents(body) async {
  //   SearchEventModel response;
  //   _searchDataLoader = true;
  //   notifyListeners();

  //   try {
  //     searchData.clear();
  //     response = await RestClient(RetroApi().dioData()).searchEvent(body);
  //     if (response.success == true) {
  //       _searchDataLoader = false;
  //       notifyListeners();

  //       searchData.addAll(response.data!);

  //       notifyListeners();
  //     }
  //   } catch (error) {
  //     _searchDataLoader = false;
  //     notifyListeners();
  //     return BaseModel()..setException(ServerError.withError(error: error));
  //   }

  //   notifyListeners();
  //   return BaseModel()..data = response;
  // }
}
