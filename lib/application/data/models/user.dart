// {
//   "id": "837e413321",
//   "email": "irvanriskinugraha90@gmail.com",
//   "uid": "Ss4ZBg5WXDRMXcoFeA88PnIsWuh1",
//   "name": "Irvan Rizki Nugraha",
//   "phoneNum": "08226619996",
//   "address": "Malang",
//   "photo": "https://lh3.googleusercontent.com/a/ACg8ocIPY9_qFVRuR64xeoOOzQRCgFMskxmME9H_EmOcWLe1E7Q=s96-c",
//   "token": "e6e90e93ff245ab7d3c379e030ca1b0e543db4fec6609fb8a54928ba06a9",
//   "role": "user",
//   "createdAt": "2023-10-23T04:22:44.393Z"
// }

class User {
  final String id;
  final String email;
  final String name;
  final String phoneNum;
  final String address;
  final String photo;
  final String role;

  User({
    required this.id,
    required this.email,
    required this.name,
    required this.phoneNum,
    required this.address,
    required this.photo,
    required this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      phoneNum: json['phoneNum'],
      address: json['address'],
      photo: json['photo'],
      role: json['role'],
    );
  }
}