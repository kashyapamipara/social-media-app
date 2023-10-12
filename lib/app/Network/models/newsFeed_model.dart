class NewsFeedModel {
  String? sId;
  String? createdAt;
  String? imageUrl;
  String? text;
  String? userId;

  NewsFeedModel(
      {this.sId, this.createdAt, this.imageUrl, this.text, this.userId});

  NewsFeedModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    createdAt = json['created_at'];
    imageUrl = json['image_url'];
    text = json['text'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['created_at'] = this.createdAt;
    data['image_url'] = this.imageUrl;
    data['text'] = this.text;
    data['user_id'] = this.userId;
    return data;
  }
}