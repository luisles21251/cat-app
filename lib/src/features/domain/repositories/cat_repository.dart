


import 'package:cat_flutter_project/src/core/error/failures.dart';
import 'package:cat_flutter_project/src/features/domain/entities/cat_entity.dart';
import 'package:dartz/dartz.dart';

abstract class CatRepository{
  Future<Either<Failure,List<CatEntity>>> breedCats();
  Future<Either<Failure, ImageCat>> getImageCat(String id);
  Future<Either<Failure,List<CatEntity>>> searchBreeds(String param);
}