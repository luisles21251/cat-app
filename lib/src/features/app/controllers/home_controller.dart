



import 'dart:async';
import 'dart:developer';

import 'package:cat_flutter_project/src/core/usecases/usecase.dart';
import 'package:cat_flutter_project/src/core/validators/input_only_character_validator.dart';
import 'package:cat_flutter_project/src/features/data/models/cat_model.dart';
import 'package:cat_flutter_project/src/features/domain/entities/cat_entity.dart';
import 'package:cat_flutter_project/src/features/domain/usecases/get_breeds_cat_use_case.dart';
import 'package:cat_flutter_project/src/features/domain/usecases/get_image_cat_use_case.dart';
import 'package:cat_flutter_project/src/features/domain/usecases/search_breed_use_case.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
 final GetBreedsCatUseCase _getBreedsCatUseCase;
 final GetImageUseCase _getImageUseCase;
 final SearchBreedUseCase _searchBreedUseCase;

 RxList<CatEntity>  catList = <CatEntity>[].obs;
 RxList<CatEntity>  catListSearch = <CatEntity>[].obs;
 RxBool isLoadBreeds = false.obs;
 RxBool isLoadImage =false.obs;
 RxBool isSearch = false.obs;
 ImageCat ? imageCat;

 TextEditingController searchCtrl = TextEditingController();
 InputOnlyCharacter searchInput = InputOnlyCharacter.pure();

  HomeController({required GetBreedsCatUseCase getBreedsCatUseCase,
    required GetImageUseCase getImageUseCase,
    required SearchBreedUseCase searchBreedUseCase}):
        _getBreedsCatUseCase = getBreedsCatUseCase,
        _searchBreedUseCase = searchBreedUseCase,
        _getImageUseCase = getImageUseCase;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

@override
  onReady(){
  getBreeds();
    super.onReady();
  }



 Future<void> getBreeds()async{
    isLoadBreeds(true);
    final res = await _getBreedsCatUseCase.call(NoParams());
    return res.fold((l){
      isLoadBreeds(false);
      log('${l.message}', name:'error en consultar Razas');
    }, (r)async{
      catList.value = r;
      for (int i = 0; i < catList.length; i++) {
        var item = catList[i];
        var r = await getImageCat(item.referenceimageid!);
        catList[i] = CatModel.cast(item.copyWith(imageCat: r));
      }
      isLoadBreeds(false);
      update();
    });
  }


  Future<ImageCat>getImageCat(String id)async{
    isLoadImage(true);
    final res = await _getImageUseCase.call(id);
    return res.foldRight(ImageCatModel(), (r, l) => r);
  }




  changeSearch(String value){
    searchInput = InputOnlyCharacter.dirty(value);
    if(searchInput.value.isEmpty){
      searchCtrl.clear();
      catListSearch.value=[];
    }else{
      _debounce();
    }
    update();
  }

 Timer? _debounceTimer;

 _debounce() {
   if (_debounceTimer?.isActive ?? false) _debounceTimer?.cancel();
   _debounceTimer = Timer(Duration(milliseconds: 3000), () {
     searchBreeds(searchInput.value);
   });
 }



  Future<void> searchBreeds(String params)async{
    isSearch(true);
    final res = await _searchBreedUseCase.call(params);
    return res.fold((l){
      isSearch(false);
    }, (r)async{
          catListSearch.value = r;
          for (int i = 0; i < catListSearch.length; i++) {
            var item = catListSearch[i];
            var r = await getImageCat(item.referenceimageid!);
            catListSearch[i] = CatModel.cast(item.copyWith(imageCat: r));
          }
          isSearch(false);
          update();
        });
  }

}