class UserModel{
  final String uId;
  final String username;
  final String email;
  final String mobile_number;
  final String userDeviceToken;
  final String password;

  UserModel({
    required this.uId,
    required this.username,
    required this.email,
    required this.mobile_number,
    required this.userDeviceToken,
    required this.password,
});

  Map<String, dynamic> toMap(){
    return{
      'uId' :uId,
      'username' :username,
      'email' : email,
      'mobile_number' : mobile_number,
      'userDeviceToken' : userDeviceToken,
      'password' :password,
    };
  }
  factory UserModel.fromMap(Map<String, dynamic> json) {
    return UserModel(
      uId: json['uId'],
      username: json['username'],
      email: json['email'],
      mobile_number: json['mobile_number'],
      userDeviceToken: json['userDeviceToken'],
      password: json['password'],
    );
  }
}


