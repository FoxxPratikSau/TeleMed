class medicine {
  int? id;
  String? name;
  String? desc;
  int? price;
  String? image;

  medicine({this.id, this.name, this.desc, this.price, this.image});

  medicine.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    desc = json['desc'];
    price = json['price'];
    image = json['image'];
  }
}

class Root {
  List<medicine?>? medicines;

  Root({this.medicines});

  Root.fromJson(Map<String, dynamic> json) {
    if (json['medicines'] != null) {
      medicines = <medicine>[];
      json['medicines'].forEach((v) {
        medicines!.add(medicine.fromJson(v));
      });
    }
  }
}
