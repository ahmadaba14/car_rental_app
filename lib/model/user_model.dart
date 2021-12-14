class UserModel {
  String? uid;
  String? email;
  String? name;
  String? phoneNumber;
  String? nationality;
  String? dob;

  UserModel(
      {this.uid,
      this.email,
      this.name,
      this.phoneNumber,
      this.nationality,
      this.dob});

  //Receiving Data from Server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      name: map['name'],
      phoneNumber: map['phoneNumber'],
      nationality: map['nationality'],
      dob: map['dob'],
    );
  }

  //Sending Data to Server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'phoneNumber': phoneNumber,
      'nationality': nationality,
      'dob': dob
    };
  }
}
