

import 'package:cat_flutter_project/src/core/error/failures.dart';
import 'package:cat_flutter_project/src/core/usecases/usecase.dart';
import 'package:cat_flutter_project/src/features/domain/entities/cat_entity.dart';
import 'package:cat_flutter_project/src/features/domain/repositories/cat_repository.dart';
import 'package:dartz/dartz.dart';

class SearchBreedUseCase implements UseCase<List<CatEntity>, String>{
  final CatRepository repository;

  SearchBreedUseCase(this.repository);

  @override
  Future<Either<Failure, List<CatEntity>>> call(String params)async {
    return await repository.searchBreeds(params);
  }

}