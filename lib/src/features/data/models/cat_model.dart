

import 'package:cat_flutter_project/src/features/domain/entities/cat_entity.dart';

class CatModel extends CatEntity{
  const CatModel({
 String ? id,
 String ? name,
 int ? intelligence,
 String ? origin,
 String ? description,
 WeightCatModel ? weightCatModel,
 ImageCatModel ? imageCatModel,
 String ? referenceImageId,
 int ? energy,
}):super(id: id, name: name, intelligence: intelligence, origin: origin, description:description, weigthCat: weightCatModel,
      imageCat: imageCatModel, referenceimageid:referenceImageId, energy: energy );



 factory CatModel.fromJson(Map<String, dynamic>json){
   return CatModel(
     id: json['id'],
     name: json['name'],
     intelligence: json['intelligence'],
     origin: json['origin'],
     description: json['description'],
      weightCatModel:json['weight'] !=null ?  WeightCatModel.fromJson(json['weight']) : null,
     imageCatModel: json['image'] !=null ?  ImageCatModel.fromJson(json['image']) : null,
     referenceImageId: json['reference_image_id'],
     energy: json['energy_level']

   );

}

  factory CatModel.cast(CatEntity? e) {
    return CatModel(
      id: e?.id,
      name: e?.name,
      intelligence: e?.intelligence,
      origin: e?.origin,
      description: e?.description,
      weightCatModel: WeightCatModel(
        imperial: e?.weigthCat?.imperial,
            metric: e?.weigthCat?.metric,
      ),
      imageCatModel:ImageCatModel(
        id: e?.imageCat?.id,
        url: e?.imageCat?.url,
    ) ,
      referenceImageId: e?.referenceimageid,
      energy: e?.energy
    );
  }


}

class WeightCatModel extends WeightCat{
  const WeightCatModel({
    String ? imperial,
    String ? metric,
}) : super(imperial: imperial, metric: metric);


 factory WeightCatModel.fromJson(Map<String, dynamic>json){
   return WeightCatModel(
     imperial: json['imperial'],
     metric: json['metric']
   );
 }
}


class ImageCatModel extends ImageCat{
  const ImageCatModel({
    String ?id,
    String ?  url,
    List<CatModel> ? breeds,
}):super(id: id, url: url, breeds: breeds);

  factory ImageCatModel.fromJson(Map<String, dynamic>json){
    return ImageCatModel(
      id: json['id'],
      url: json['url'],
      breeds: json['breeds'] !=null ? (json['breeds'] as List).map((e) => CatModel.fromJson(e)).toList() : null
    );
  }
}