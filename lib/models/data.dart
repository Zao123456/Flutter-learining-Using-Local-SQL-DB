class Data {
  int? _id;
  String? _country;
  String? _item;
  double? _cost;
  double? _shippingPrice;
  double? _buyingPrice;
  double? _sellingPrice;
  double? _earnings;

  // Constructor (without ID, as it's auto-generated)
  Data(this._country, this._item, this._cost, this._shippingPrice,
      this._buyingPrice, this._sellingPrice);

  // Named Constructor with ID
  Data.withId(this._id, this._country, this._item, this._cost, this._shippingPrice,
      this._buyingPrice, this._sellingPrice, this._earnings);

  // Named constructor to create an object from a map
  Data.fromMapObject(Map<String, dynamic> map) {
    _id = (map['id'] as num?)?.toInt();
    _country = map['country'];
    _item = map['item'];
    _cost = (map['cost'] as num?)?.toDouble();
    _shippingPrice = (map['shipping_price'] as num?)?.toDouble();
    _buyingPrice = (map['buying_price'] as num?)?.toDouble();
    _sellingPrice = (map['selling_price'] as num?)?.toDouble();
    _earnings = (map['earnings'] as num?)?.toDouble();
  }

  // Getters
  int? get id => _id;
  String? get country => _country;
  String? get item => _item;
  double? get cost => _cost;
  double? get shippingPrice => _shippingPrice;
  double? get buyingPrice => _buyingPrice;
  double? get sellingPrice => _sellingPrice;
  double? get earnings => _earnings;

  // Setters
  set country(String? newCountry) => _country = newCountry;
  set item(String? newItem) => _item = newItem;
  set cost(double? newCost) => _cost = newCost;
  set shippingPrice(double? newShippingPrice) => _shippingPrice = newShippingPrice;
  set buyingPrice(double? newBuyingPrice) => _buyingPrice = newBuyingPrice;
  set sellingPrice(double? newSellingPrice) => _sellingPrice = newSellingPrice;
  set earnings(double? newEarnings) => _earnings = newEarnings;

  // Convert to Map
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': _id,
      'country': _country,
      'item': _item,
      'cost': _cost,
      'shipping_price': _shippingPrice,
      'buying_price': _buyingPrice,
      'selling_price': _sellingPrice,
      'earnings': _earnings,
    };
    return map;
  }

  // Create a Data object from a Map
  Data.fromMap(Map<String, dynamic> map) {
    print(map);
    _id = map['id'];
    _country = map['country'];
    _item = map['item'];
    _cost = map['cost'];
    _shippingPrice = map['shipping_price'];
    _buyingPrice = map['buying_price'];
    _sellingPrice = map['selling_price'];
    _earnings = map['earnings'];
  }
}