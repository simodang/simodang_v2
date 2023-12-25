class Pond {
  final String id;
  final String name;
  final String address;
  final String city;
  final String seedDate;
  final int seedCount;
  final String imageUrl;
  final bool status;
  final bool isFilled;
  final String createdAt;
  final String userId;
  final String deviceId;

  Pond({
    required this.id,
    required this.name,
    required this.address,
    required this.city,
    required this.seedDate,
    required this.seedCount,
    required this.imageUrl,
    required this.status,
    required this.isFilled,
    required this.createdAt,
    required this.userId,
    required this.deviceId,
  });

  factory Pond.fromJson(Map<String, dynamic> json) {
    return Pond(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      city: json['city'],
      seedDate: json['seedDate'],
      seedCount: json['seedCount'],
      imageUrl: json['imageUrl'],
      status: json['status'],
      isFilled: json['isFilled'],
      createdAt: json['createdAt'],
      userId: json['userId'],
      deviceId: json['deviceId'] ?? '',
    );
  }
}