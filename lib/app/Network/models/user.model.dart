class UserModel {
  String? id;
  String? userName;
  String? email;
  String? imageUrl;

  UserModel({this.id, this.userName, this.email, this.imageUrl});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    email = json['email'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userName'] = this.userName;
    data['email'] = this.email;
    data['image_url'] = this.imageUrl;
    return data;
  }
}