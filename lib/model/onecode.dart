/// id : 0
/// name : "NexMart - Casual Sneakers"
/// category : "NOP"
/// imageUrl : "https://m.media-amazon.com/images/I/81S-ekaE+vS._AC_UL320_.jpg"
/// oldPrice : "1899"
/// price : "799"

class Onecode {
  Onecode({
      int? id, 
      String? name, 
      String? category, 
      String? imageUrl, 
      String? oldPrice, 
      String? price,}){
    _id = id;
    _name = name;
    _category = category;
    _imageUrl = imageUrl;
    _oldPrice = oldPrice;
    _price = price;
}

  Onecode.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _category = json['category'];
    _imageUrl = json['imageUrl'];
    _oldPrice = json['oldPrice'];
    _price = json['price'];
  }
  int? _id;
  String? _name;
  String? _category;
  String? _imageUrl;
  String? _oldPrice;
  String? _price;

  int? get id => _id;
  String? get name => _name;
  String? get category => _category;
  String? get imageUrl => _imageUrl;
  String? get oldPrice => _oldPrice;
  String? get price => _price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['category'] = _category;
    map['imageUrl'] = _imageUrl;
    map['oldPrice'] = _oldPrice;
    map['price'] = _price;
    return map;
  }

}