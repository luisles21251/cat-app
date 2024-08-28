



import 'package:cat_flutter_project/src/core/error/failures.dart';
import 'package:cat_flutter_project/src/core/usecases/usecase.dart';
import 'package:cat_flutter_project/src/features/domain/entities/cat_entity.dart';
import 'package:cat_flutter_project/src/features/domain/repositories/cat_repository.dart';
import 'package:dartz/dartz.dart';

class GetBreedsCatUseCase implements UseCase<List<CatEntity>, NoParams>{
  final CatRepository repository;

  GetBreedsCatUseCase(this.repository);

  @override
  Future<Either<Failure, List<CatEntity>>> call(NoParams params)async {
  return await repository.breedCats();
  }
}