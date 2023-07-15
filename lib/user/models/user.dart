import 'dart:convert';

class User{
  int id;
  String first_name;
  String last_name;
  String gender;
  String school;
  String grade;

  User({
    required this.id,
    required this.first_name,
    required this.last_name,
    required this.gender,
    required this.school,
    required this.grade,
  });

  User copyWith({
    int? id,
    String? first_name,
    String? last_name,
    String? gender,
    String? school,
    String? grade,
  }){
    return User(
      id: id ?? this.id,
      first_name: first_name ?? this.first_name,
      last_name: last_name ?? this.last_name,
      gender: gender ?? this.gender,
      school: school ?? this.school,
      grade: grade ?? this.grade,

    );
  }

  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'first_name': first_name,
      'last_name': last_name,
      'gender': gender,
      'school': school,
      'grade': grade,

    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      first_name: map['first_name'],
      last_name: map['last_name'],
      gender: map['gender'],
      school: map['school'],
      grade: map['grade'],

    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(
      json.decode(source));

}