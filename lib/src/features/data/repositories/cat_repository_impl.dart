

import 'package:cat_flutter_project/src/core/error/failures.dart';
import 'package:cat_flutter_project/src/features/data/datasources/cat_remote_data_source.dart';
import 'package:cat_flutter_project/src/features/domain/entities/cat_entity.dart';
import 'package:cat_flutter_project/src/features/domain/repositories/cat_repository.dart';
import 'package:dartz/dartz.dart';

class CatRepositoryImpl implements CatRepository{

  final CatsRremoteDataSource remoteDataSource;

  CatRepositoryImpl({required this.remoteDataSource});






  @override
  Future<Either<Failure, List<CatEntity>>> breedCats() async{
    try {
      final res = await remoteDataSource.breedsCat();
      return Right(res);
    } on ServerFailure catch (error) {
      return Left(error);
    }
  }

  @override
  Future<Either<Failure, ImageCat>> getImageCat(String id)async {
    try {
      final res = await remoteDataSource.getImageCat(id);
      return Right(res);
    } on ServerFailure catch (error) {
      return Left(error);
    }
  }

  @override
  Future<Either<Failure, List<CatEntity>>> searchBreeds(String param) async {
    try {
      final res = await remoteDataSource.searchBreed(param);
      return Right(res);
    } on ServerFailure catch (error) {
      return Left(error);
    }
  }


}