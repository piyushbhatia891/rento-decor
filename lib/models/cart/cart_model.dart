class CartsModel {
  int _id;
  String _productid;
  int _quantity;
  double _price;

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  CartsModel(this._id, this._productid, this._quantity, this._price);

  CartsModel.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._productid = map['productid'];
    this._price = map['price'];
    this._quantity = map['quantity'];
  }

  String get productid => _productid;

  double get price => _price;

  set price(double value) {
    _price = value;
  }

  int get quantity => _quantity;

  set quantity(int value) {
    _quantity = value;
  }

  set productid(String value) {
    _productid = value;
  }
}
