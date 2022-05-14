import 'package:api_spotify_flutter/services/viewState.dart';
import 'package:flutter/foundation.dart';

class BaseModel with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  ViewState _stateview = ViewState.init;

  ViewState get stateview => _stateview;

  void setState(ViewState state) {
    _stateview = state;
    notifyListeners();
  }
}
