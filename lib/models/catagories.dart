
class Category {
    int? id;
    String? name;
    String? image;

    Category({this.id, this.name, this.image}); 

    Category.fromJson(Map<String, dynamic> json) {
        id = json['id'];
        name = json['name'];
        image = json['image'];
    }

}

class Root {
    List<Category?>? categories;

    Root({this.categories}); 

    Root.fromJson(Map<String, dynamic> json) {
        if (json['categories'] != null) {
         categories = <Category>[];
         json['categories'].forEach((v) {
         categories!.add(Category.fromJson(v));
        });
      }
    }

}