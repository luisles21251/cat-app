



import 'package:get_it/get_it.dart';

import 'src/features/data/datasources/cat_remote_data_source.dart';
import 'src/features/data/repositories/cat_repository_impl.dart';
import 'src/features/domain/repositories/cat_repository.dart';
import 'src/features/domain/usecases/get_breeds_cat_use_case.dart';
import 'src/features/domain/usecases/get_image_cat_use_case.dart';
import 'src/features/domain/usecases/search_breed_use_case.dart';

final sl = GetIt.instance;

Future<void>init()async{
// sl.registerFactory(() => HomeController(getBreedsCatUseCase: sl()));

  /**
   * UseCases
   */
  sl.registerLazySingleton(() => GetBreedsCatUseCase(sl()));
  sl.registerLazySingleton(() => GetImageUseCase(sl()));
  sl.registerLazySingleton(() => SearchBreedUseCase(sl()));

  /**
   * Repositories
   */

  sl.registerLazySingleton<CatRepository>(() => CatRepositoryImpl( remoteDataSource: sl()),);

  /**
   * Data Sources
   */
  sl.registerLazySingleton<CatsRremoteDataSource>(() => CatsRemoteDataSourceImpl());



}