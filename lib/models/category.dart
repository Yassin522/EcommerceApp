class Category {
 late int id;
  late String name;
 late String image;

  Category({
    required this.id, 
    required this.name,
    required this.image,
      
      });

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'] ;
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    return data;
  }
}