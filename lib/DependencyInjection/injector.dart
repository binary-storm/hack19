import 'package:hack19/ModelLayer/model_layer.dart';
import 'package:hack19/ModelLayer/sharePrefs/shared_preferences.dart';
import 'package:http/http.dart' show Client;
import 'package:shared_preferences/shared_preferences.dart';

import '../ModelLayer/network/network_layer.dart';

class Injector {
  static final Injector _singleton = new Injector._internal();

  factory Injector() {
    return _singleton;
  }

  Client _client;
  NetworkLayer _networkLayer;
  ModelLayer _modelLayer;
  SharedPreferencesLayer _preferencesLayer;

  Injector._internal() {
    _client = Client();
    _networkLayer = NetworkLayerImpl(client: _client);
    _preferencesLayer =
        SharedPreferencesLayerImpl(prefs: SharedPreferences.getInstance());

    _modelLayer = ModelLayerImpl(
        networkLayer: _networkLayer, sharedPreferencesLayer: _preferencesLayer);
  }

  ModelLayer get modelLayer {
    return _modelLayer;
  }

//  DataSource get dataSource {
//    return new DataRepository(
//        client: new http.Client(), prefs: SharedPreferences.getInstance());
//  }

//  FirebaseAnalytics analytics = new FirebaseAnalytics();
//  FirebaseAnalyticsObserver get observer { return new FirebaseAnalyticsObserver(analytics: analytics);}
}