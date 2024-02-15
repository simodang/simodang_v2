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
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      address: json['address'] ?? '',
      city: json['city'] ?? '',
      seedDate: json['seedDate'] ?? DateTime.now().toUtc().toIso8601String(),
      seedCount: json['seedCount'] ?? 0,
      imageUrl: json['imageUrl'] ?? 'https://placehold.co/600x400/png',
      status: json['status'] ?? true,
      isFilled: json['isFilled'] ?? true,
      createdAt: json['createdAt'] ?? DateTime.now().toUtc().toIso8601String(),
      userId: json['userId'] ?? '',
      deviceId: json['deviceId'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final imageUrl = this.imageUrl == '' ? 'https://placehold.co/600x400/png' : this.imageUrl;

    return {
      'id': id,
      'name': name,
      'address': address,
      'city': city,
      'seedDate': seedDate,
      'seedCount': seedCount,
      'imageUrl': imageUrl,
      'status': status,
      'isFilled': isFilled,
      'createdAt': createdAt,
      'userId': userId,
      'deviceId': deviceId == '' ? null : deviceId,
    };
  }
}