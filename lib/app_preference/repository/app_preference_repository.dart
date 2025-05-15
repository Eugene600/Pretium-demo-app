import 'package:pretium/app_preference/services/app_preference_service.dart';

class AppPreferencesRepository {
  final AppPreferenceService _service;

  AppPreferencesRepository(this._service);

  Future<bool> isFirstTime() async {
    return await _service.isFirstTime();
  }

  Future<void> resetFirstTime() async {
    await _service.resetFirstTime();
  }
}