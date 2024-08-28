

import 'package:equatable/equatable.dart';

class CatEntity extends Equatable{
  final String ? id;
  final String ? name;
  final int ? intelligence;
  final WeightCat ? weigthCat;
  final String ? origin;
  final String ? description;
  final ImageCat ? imageCat;
  final String ? referenceimageid;
  final int ? energy;

  const CatEntity(
      {this.id,
      this.name,
      this.intelligence,
      this.weigthCat,
      this.origin,
      this.description,
      this.imageCat,
      this.referenceimageid,
      this.energy});


  CatEntity copyWith({
    String ? id,
    String ? name,
    int ? intelligence,
    WeightCat ? weigthCat,
    String ? origin,
    String ? description,
    ImageCat ? imageCat,
    String ? referenceimageid,
    int ? energy
}){
    return CatEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      intelligence: intelligence ?? this.intelligence,
      weigthCat: weigthCat ?? this.weigthCat,
      origin: origin ?? this.origin,
      description: description ?? this.description,
      imageCat: imageCat ?? this.imageCat,
      referenceimageid: referenceimageid ?? referenceimageid,
      energy: energy ?? this.energy
    );
  }

  @override
  List<Object?> get props =>[id, name, intelligence, weigthCat, origin, description, imageCat, referenceimageid, energy];


}

class WeightCat extends Equatable{
  final String ? imperial;
  final String ? metric;

  const WeightCat({this.imperial, this.metric});

  @override
  List<Object?> get props => [imperial, metric];

}

class ImageCat extends Equatable {
  final String ? id;
  final String ? url;
  final List<CatEntity> ? breeds;

  const ImageCat({this.id, this.url, this.breeds});

  @override
  List<Object?> get props => [id, url, breeds];
}


