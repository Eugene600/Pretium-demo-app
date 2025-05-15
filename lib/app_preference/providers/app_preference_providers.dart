
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretium/app_preference/repository/app_preference_repository.dart';
import 'package:pretium/app_preference/services/app_preference_service.dart';

/*
This Provider is to just separate business logic 
while also interacting with the AppPreferenceService
to check whether it's the user's first time
accessing the application
*/
final appPreferencesRepositoryProvider = Provider<AppPreferencesRepository>(
  (ref) => AppPreferencesRepository(AppPreferenceService()),
);

final isFirstTimeProvider = FutureProvider<bool>((ref) async {
  final repo = ref.watch(appPreferencesRepositoryProvider);
  return await repo.isFirstTime();
});