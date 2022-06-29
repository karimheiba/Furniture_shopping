import 'package:furniture_shopping_app/business_logic/blocs/auth/auth_bloc.dart';
import 'package:furniture_shopping_app/business_logic/blocs/home/home_bloc.dart';
import 'package:furniture_shopping_app/data/data_services/local_data_sources.dart';
import 'package:furniture_shopping_app/data/repositories/auth_repo.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../business_logic/blocs/products/products_bloc.dart';

final inj = GetIt.instance;
Future<void> init() async {
  // Bloc
  inj.registerFactory(() => AuthBloc(authRepo: inj(),localDataSource: inj()));
  inj.registerFactory(() => HomeBloc(authRepo: inj(),localDataSource: inj()));
  inj.registerFactory(() => ProductsBloc(productsRepo: inj()));

  // Repositories
  inj.registerLazySingleton<AuthRepoImpl>(
      () => AuthRepoImpl(localDataSource: inj()));

  // DataSources
  inj.registerLazySingleton<LocalDataSourceImpl>(
      () => LocalDataSourceImpl(sharedPreferences: inj()));
 
  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  inj.registerLazySingleton(() => sharedPreferences);
}
