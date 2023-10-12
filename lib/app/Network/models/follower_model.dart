class FollowerModel {
  String? id;
  String? userId;
  String? followerId;

  FollowerModel({this.id, this.userId, this.followerId});

  FollowerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    followerId = json['follower_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['follower_id'] = this.followerId;
    return data;
  }
}