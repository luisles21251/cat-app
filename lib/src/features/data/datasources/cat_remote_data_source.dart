



import 'package:cat_flutter_project/src/core/error/failures.dart';
import 'package:cat_flutter_project/src/core/http/api.dart';
import 'package:cat_flutter_project/src/features/data/models/cat_model.dart';
import 'package:dio/dio.dart';

abstract class CatsRremoteDataSource {
  Future<List<CatModel>> breedsCat();
  Future<ImageCatModel> getImageCat(String id);
  Future<List<CatModel>>searchBreed(String param);

}

class CatsRemoteDataSourceImpl extends ApiProvider implements CatsRremoteDataSource{

  @override
  Future<List<CatModel>> breedsCat()async {
    try{
      final res = await dio.get('/breeds?limit=10&page=0');
      return (res.data as List).map((e) => CatModel.fromJson(e)).toList();
    } on DioError catch(e) {
      throw ServerFailure(error:e ).extract;
    }
  }

  @override
  Future<ImageCatModel> getImageCat(String id)async {
    try{
      final res = await dio.get('/images/$id');
      return  ImageCatModel.fromJson(res.data);
    } on DioError catch(e) {
      throw ServerFailure(error:e ).extract;
    }
  }

  @override
  Future<List<CatModel>> searchBreed(String param) async{
    try{
      final res = await dio.get('/breeds/search?q=$param&attach_image=2');
      return  (res.data as List).map((e) => CatModel.fromJson(e)).toList();
    } on DioError catch(e) {
      throw ServerFailure(error:e ).extract;
    }
  }
}