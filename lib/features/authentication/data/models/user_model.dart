import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  int lid = 0;
  String? id;
  String? reference;
  String? email;
  String? phone;
  String? role;
  String? photo;
  String? lastName;
  String? firstName;
  String? address;
  String? userId;
  String? password;
  String? token;
  int status = 0;
  String? codeCentreCol;
  String? date;

  UserModel({
    this.id,
    this.reference,
    this.email,
    this.phone,
    this.role,
    this.photo,
    this.lastName,
    this.firstName,
    this.userId,
    this.address,
    this.password,
    this.token,
    this.status = 0,
    this.codeCentreCol,
    this.date,
  });

  get fullname {
    return 'John doe';
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id_util']?.toString(),
      reference: json['ref_util'],
      email: json['email'],
      lastName: json['nom_util'],
      firstName: json['prenom_util'],
      password: json['password'],
      role: json['code_role_util'],
      status: json['statut_util'],
      codeCentreCol: json['code_centre_col'],
      date: json['date_util'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_util': id,
      'email': email,
      'ref_util': reference,
      'code_role_util': role,
      'nom_util': lastName,
      'prenom_util': firstName,
      'statut_util': status,
      'date_util': date,
    };
  }

  @override
  List<Object?> get props => [id, email, role, lastName, firstName, reference];
}
