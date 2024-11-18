import 'package:flutter/cupertino.dart';
import '../models/user_model.dart';

Set<String?> usernames = {};
double globalId = 0;
class UserViewModel extends ChangeNotifier {
  UserModel _user = UserModel();
  UserViewModel(UserModel user) {
    _user = user;
    //a very silly way to do this, but alas
    _user.userId = globalId;
    globalId += 1;
  }

  /// input: the desired password
  /// return: the empty string if the password is valid, a string containing reasons if invalid
  /// what you should do is a do while loop, checking against the return value to force the user to set
  /// a valid password
  String setPassword(String password){
    if (password.length < 8){
      return "password must be atleast 8 characters";
    }
    _user.password = password;
    return "";
  }

  /// input: the desired password
  /// return: the empty string if the username is valid, a string containing reasons if invalid
  /// what you should do is a do while loop, checking against the return value to force the user to set
  /// a valid username
  String setUsername(String username){
    if (usernames.contains(username)){
      return "Sorry, that username is taken";
    }
    _user.username = username;
    usernames.add(username);
    return "";
  }

  ///input: username and password entered by user
  ///return: if it is valid or not
  bool validatePassword(String username, String password) {
    return username == _user.username && password == _user.password;
  }

  bool validateLogin(String email, String password) {
    return email == _user.username && password == _user.password;
  }

  ///return: username
  String getUsername(){
    return _user.username;
  }

  ///input: the key and value for the setting you want to update
  void updateSetting(String key, dynamic value) {
    _user.settings[key] = value;
    notifyListeners();
  }
  ///input: the key of the setting you want to check
  ///return: empty string if the setting is not present, otherwise the setting
  String getSetting(String key){
    if (!_user.settings.containsKey(key)) return "";
    return _user.settings[key];
  }

  ///adds a prefrence
  ///input: the prefrence you want to add
  ///return: True if added, False if not (already in list)
  bool addPreference(String pref){
    if(_user.preferences.contains(pref)){
      return false;
    }
    _user.preferences.add(pref);
    return true;
  }
  ///return: the prefrences of the user
  List<String> getPreferences() {
    return _user.preferences;
  }


  ///return: userID
  double? getId(){
    return _user.userId;
  }
}