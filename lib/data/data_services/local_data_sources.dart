import 'package:shared_preferences/shared_preferences.dart';

import '../../core/error/failuer.dart';

abstract class LocalDataSource {
  Future<void> cacheUserId(String userId);
  String getCachedUserId();
  Future<void> clearCacheUserId();
}

class LocalDataSourceImpl extends LocalDataSource {
  final SharedPreferences sharedPreferences;

  LocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<void> cacheUserId(String userId) async {
    await sharedPreferences.setString("CACHE_USER_ID", userId);
  }

  @override
  String getCachedUserId() {
    final userId = sharedPreferences.getString("CACHE_USER_ID");
    if (userId != null) {
      return userId;
    }
    throw const Failure(message: 'No User Id found');
  }

  Future<void> clearCacheUserId() async {
    await sharedPreferences.remove("CACHE_USER_ID");
  }
}
