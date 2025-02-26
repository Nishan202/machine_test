class UserList {
  int? id;
  String? email;
  String? first_name;
  String? last_name;
  String? avatar;

  UserList({required this.avatar, required this.email, required this.first_name, required this.id, required this.last_name});

  factory UserList.fromJson(Map<String, dynamic> json){
    return UserList(avatar: json['avatar'], email: json['email'], first_name: json['first_name'], id: json['id'], last_name: json['last_name']);
  }
}