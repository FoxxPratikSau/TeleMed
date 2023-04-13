class Doctor {
  int? id;
  String? name;
  String? about;
  int? exp;
  String? image;
  String? prof;

  Doctor({this.id, this.name, this.about, this.exp, this.image, this.prof});

  Doctor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    about = json['about'];
    exp = json['exp'];
    image = json['image'];
    prof = json['prof'];
  }
}

class Root {
  List<Doctor?>? doctors;

  Root({this.doctors});

  Root.fromJson(Map<String, dynamic> json) {
    if (json['doctors'] != null) {
      doctors = <Doctor>[];
      json['doctors'].forEach((v) {
        doctors!.add(Doctor.fromJson(v));
      });
    }
  }
}
