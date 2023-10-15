class UserModel {
  String? id;
  String? user_name;
  String? email;
  String? imageUrl;
  String? user_id;

  UserModel({this.id, this.user_name, this.email, this.imageUrl, this.user_id});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user_name = json['user_name'];
    email = json['email'];
    imageUrl = json['image_url'];
    user_id = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_name'] = this.user_name;
    data['email'] = this.email;
    data['image_url'] = this.imageUrl;
    data['user_id'] = this.user_id;
    return data;
  }
}
