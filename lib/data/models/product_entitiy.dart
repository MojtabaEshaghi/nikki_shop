/// id : 1
/// title : "کفش ورزشی مدل Legend React 3"
/// price : 268000
/// discount : 2000
/// image : "https://s3.ir-thr-at1.arvanstorage.com/nike/legend-react-3-shield-running-shoe-WWzCLk.jpg"
/// status : 1
/// previous_price : 270000
///
///

class ProductSort {
  static const int latest = 0;
  static const int popular = 1;
  static const int priceHighToLow = 2;
  static const int priceLowToHigh = 3;
}

class ProductEntity {
  ProductEntity({
    int? id,
    String? title,
    int? price,
    int? discount,
    String? image,
    int? status,
    int? previousPrice,
  }) {
    _id = id;
    _title = title;
    _price = price;
    _discount = discount;
    _image = image;
    _status = status;
    _previousPrice = previousPrice;
  }

  ProductEntity.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _price = json['price'];
    _discount = json['discount'];
    _image = json['image'];
    _status = json['status'];
    _previousPrice = json['previous_price'] ?? price;
  }

  int? _id;
  String? _title;
  int? _price;
  int? _discount;
  String? _image;
  int? _status;
  int? _previousPrice;

  ProductEntity copyWith({
    int? id,
    String? title,
    int? price,
    int? discount,
    String? image,
    int? status,
    int? previousPrice,
  }) =>
      ProductEntity(
        id: id ?? _id,
        title: title ?? _title,
        price: price ?? _price,
        discount: discount ?? _discount,
        image: image ?? _image,
        status: status ?? _status,
        previousPrice: previousPrice ?? _previousPrice,
      );

  int? get id => _id;

  String? get title => _title;

  int? get price => _price;

  int? get discount => _discount;

  String? get image => _image;

  int? get status => _status;

  int? get previousPrice => _previousPrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['price'] = _price;
    map['discount'] = _discount;
    map['image'] = _image;
    map['status'] = _status;
    map['previous_price'] = _previousPrice;
    return map;
  }
}
