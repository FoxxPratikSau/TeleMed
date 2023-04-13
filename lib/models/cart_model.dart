import 'package:tele_med/models/medicines.dart';

class cart_model {
  int? id;
  String? name;
  int? quantity;
  int? price;
  String? image;
  bool? isExist;
  String? time;
  medicine? product;

  cart_model(
      {this.id,
      this.name,
      this.price,
      this.image,
      this.isExist,
      this.time,
      this.quantity,
      this.product});

  cart_model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    image = json['image'];
    quantity = json['quantity'];
    time = json['time'];
    isExist = json['isExist'];
    product = medicine.fromJson(json['product']);
  }
}
