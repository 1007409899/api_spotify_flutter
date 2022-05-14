import 'package:api_spotify_flutter/models/basemodel.dart';

import '../services/viewState.dart';

class ViewModelApi extends BaseModel {
  String _id = '';
  String _name = '';
  String _preview_url = '';
  String _images = '';
  String _nameAlbum = "";
  int _duration_ms = 0;

  ViewModelApi() {
    setState(ViewState.init);
  }
  String get getId => _id;
  set setId(String value) {
    _id = value;
    setState(ViewState.init);
    notifyListeners();
  }

  set SetDuration_ms(int value) {
    _duration_ms = value;
    setState(ViewState.init);
    notifyListeners();
  }

  int get getDuration_ms => _duration_ms;

  String get GetName => _name;

  set setName(String value) {
    this._name = value;
    setState(ViewState.init);
    notifyListeners();
  }

  String get GetPreview_url => _preview_url;

  set SetPreview_url(String value) {
    this._preview_url = value;
    setState(ViewState.init);
    notifyListeners();
  }

  String get GetImages => _images;

  set SetImages(String value) {
    this._images = value;
    setState(ViewState.init);
    notifyListeners();
  }

  String get GetNameAlbum => _nameAlbum;

  set SetNameAlbum(String value) {
    this._nameAlbum = value;
    setState(ViewState.init);
    notifyListeners();
  }
}
