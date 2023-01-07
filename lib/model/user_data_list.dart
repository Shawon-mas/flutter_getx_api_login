class UserDataList {
  static String email = '';
  static String token = '';
  static String number = '';
}

class UserInfoModel {
  var uid;
  var number;
  var email;

  UserInfoModel({
    this.uid,
    this.number,
    this.email,
  });
}
