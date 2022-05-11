/// id : 1001
/// image : "https://s3.ir-thr-at1.arvanstorage.com/nike/banner_1.jpg"
/// link_type : 2
/// link_value : "0"

class BannerEntity {
  BannerEntity({
      int? id, 
      String? image, 
      int? linkType, 
      String? linkValue,}){
    _id = id;
    _image = image;
    _linkType = linkType;
    _linkValue = linkValue;
}

  BannerEntity.fromJson(dynamic json) {
    _id = json['id'];
    _image = json['image'];
    _linkType = json['link_type'];
    _linkValue = json['link_value'];
  }
  int? _id;
  String? _image;
  int? _linkType;
  String? _linkValue;
BannerEntity copyWith({  int? id,
  String? image,
  int? linkType,
  String? linkValue,
}) => BannerEntity(  id: id ?? _id,
  image: image ?? _image,
  linkType: linkType ?? _linkType,
  linkValue: linkValue ?? _linkValue,
);
  int? get id => _id;
  String? get image => _image;
  int? get linkType => _linkType;
  String? get linkValue => _linkValue;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['image'] = _image;
    map['link_type'] = _linkType;
    map['link_value'] = _linkValue;
    return map;
  }

}