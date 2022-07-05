import 'package:furniture_shopping_app/data/data_services/local_data_sources.dart';

abstract class UserRepo {}

class UserRepoImpl extends UserRepo {
  final LocalDataSourceImpl localDataSource;

  UserRepoImpl({required this.localDataSource});
}
