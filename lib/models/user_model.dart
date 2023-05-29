import 'dart:convert';

class UserModel {
  String? id;
  String? name;
  String? email;
  String? mobile;
  String? password;
  String? gender;
  DateTime? date_of_birth;
  String? status;
  String? token;
  String? image;
  DateTime? creation_date;
  UserModel({
    this.id,
    this.name,
    this.email,
    this.mobile,
    this.password,
    this.gender,
    this.date_of_birth,
    this.status,
    this.token,
    this.image,
    this.creation_date,
  });

  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? mobile,
    String? password,
    String? gender,
    DateTime? date_of_birth,
    String? status,
    String? token,
    String? image,
    DateTime? creation_date,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      mobile: mobile ?? this.mobile,
      password: password ?? this.password,
      gender: gender ?? this.gender,
      date_of_birth: date_of_birth ?? this.date_of_birth,
      status: status ?? this.status,
      token: token ?? this.token,
      image: image ?? this.image,
      creation_date: creation_date ?? this.creation_date,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'mobile': mobile,
      'password': password,
      'gender': gender,
      'date_of_birth': date_of_birth?.toString(),
      'status': status,
      'token': token,
      'image': image,
      'creation_date': creation_date?.toString(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] != null ? map['id'] : null,
      name: map['name'] != null ? map['name'] : null,
      email: map['email'] != null ? map['email'] : null,
      mobile: map['mobile'] != null ? map['mobile'] : null,
      password: map['password'] != null ? map['password'] : null,
      gender: map['gender'] != null ? map['gender'] : null,
      date_of_birth: map['date_of_birth'] != null
          ? DateTime.parse(map['date_of_birth'])
          : null,
      status: map['status'] != null ? map['status'] : null,
      token: map['token'] != null ? map['token'] : null,
      image: map['image'] != null ? map['image'] : null,
      creation_date: map['creation_date'] != null
          ? DateTime.parse(map['creation_date'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, email: $email, mobile: $mobile, password: $password, gender: $gender, date_of_birth: $date_of_birth, status: $status, token: $token, image: $image, creation_date: $creation_date)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.id == id &&
        other.name == name &&
        other.email == email &&
        other.mobile == mobile &&
        other.password == password &&
        other.gender == gender &&
        other.date_of_birth == date_of_birth &&
        other.status == status &&
        other.token == token &&
        other.image == image &&
        other.creation_date == creation_date;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        email.hashCode ^
        mobile.hashCode ^
        password.hashCode ^
        gender.hashCode ^
        date_of_birth.hashCode ^
        status.hashCode ^
        token.hashCode ^
        image.hashCode ^
        creation_date.hashCode;
  }
}
