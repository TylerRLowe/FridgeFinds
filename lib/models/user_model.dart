class UserModel {
  double? userId;
  //this may also be better as a map, like vegan: True, but i think this is fine for now
  List<String> preferences = [];
  Map<String, dynamic> settings = {};
  String password = "change_me";
  String username = "change_me";
  UserModel();

}