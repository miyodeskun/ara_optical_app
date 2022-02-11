class User {
  String? id;
  String? name;
  String? email;
  String? regdate;
  String? roles;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.regdate,
    required this.roles,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    regdate = json['regdate'];
    roles = json['admin_roles'];
  }
}
