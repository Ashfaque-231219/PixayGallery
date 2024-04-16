
class ProuductListModel {
  String? id;
  String? name;
  String? moq;
  String? price;
  String? discountedPrice;

  ProuductListModel({
    this.id,
    this.name,
    this.moq,
    this.price,
    this.discountedPrice,
  });

  ProuductListModel.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    name = json['name']?.toString();
    moq = json['moq']?.toString();
    price = json['price']?.toString();
    discountedPrice = json['discounted_price']?.toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['moq'] = moq;
    data['price'] = price;
    data['discounted_price'] = discountedPrice;
    return data;
  }
}
