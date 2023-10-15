class FollowerModel {
  String? id;
  String? user_id;
  String? followerId;

  FollowerModel({this.id, this.user_id, this.followerId});

  FollowerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user_id = json['user_id'];
    followerId = json['follower_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.user_id;
    data['follower_id'] = this.followerId;
    return data;
  }
}