class CategoryModel {
  bool success;
  List<Category> data;

  CategoryModel({this.success, this.data});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = new List<Category>();
      json['data'].forEach((v) {
        data.add(new Category.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Category {
  int id;
  String name;
  Null order;
  String image;
  String icon;
  String createdAt;
  String updatedAt;
  CategoryImage categoryImage;

  Category(
      {this.id,
      this.name,
      this.order,
      this.image,
      this.icon,
      this.createdAt,
      this.updatedAt,
      this.categoryImage});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    order = json['order'];
    image = json['image'];
    icon = json['icon'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    categoryImage = json['category_image'] != null
        ? new CategoryImage.fromJson(json['category_image'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['order'] = this.order;
    data['image'] = this.image;
    data['icon'] = this.icon;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.categoryImage != null) {
      data['category_image'] = this.categoryImage.toJson();
    }
    return data;
  }
}

class CategoryImage {
  String thumb;
  String full;

  CategoryImage({this.thumb, this.full});

  CategoryImage.fromJson(Map<String, dynamic> json) {
    thumb = json['thumb'];
    full = json['full'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['thumb'] = this.thumb;
    data['full'] = this.full;
    return data;
  }
}
