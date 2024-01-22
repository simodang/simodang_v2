class Device {
  final String id;
  final String name;
  final bool isSaved;
  final bool autoWaterEnabled;
  final bool autoFeedEnabled;
  final double tempLow;
  final double tempHigh;
  final double phLow;
  final double phHigh;
  final double tdoLow;
  final double tdoHigh;
  final double tdsLow;
  final double tdsHigh;
  final double turbiditiesLow;
  final double turbiditiesHigh;

  Device({
    required this.id,
    required this.name,
    required this.isSaved,
    required this.autoWaterEnabled,
    required this.autoFeedEnabled,
    required this.tempLow,
    required this.tempHigh,
    required this.phLow,
    required this.phHigh,
    required this.tdoLow,
    required this.tdoHigh,
    required this.tdsLow,
    required this.tdsHigh,
    required this.turbiditiesLow,
    required this.turbiditiesHigh,
  });

  factory Device.fromJson(Map<String, dynamic> json) {
    return Device(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      isSaved: json['isSaved'] ?? false,
      autoWaterEnabled: json['autoWaterEnabled'] ?? false,
      autoFeedEnabled: json['autoFeedEnabled'] ?? false,
      tempLow: double.parse(json['tempLow'] ?? '0'),
      tempHigh: double.parse(json['tempHigh'] ?? '0'),
      phLow: double.parse(json['phLow'] ?? '0'),
      phHigh: double.parse(json['phHigh'] ?? '0'),
      tdoLow: double.parse(json['tdoLow'] ?? '0'),
      tdoHigh: double.parse(json['tdoHigh'] ?? '0'),
      tdsLow: double.parse(json['tdsLow'] ?? '0'),
      tdsHigh: double.parse(json['tdsHigh'] ?? '0'),
      turbiditiesLow: double.parse(json['turbiditiesLow'] ?? '0'),
      turbiditiesHigh: double.parse(json['turbiditiesHigh'] ?? '0'),
    );
  }

  factory Device.empty() {
    return Device(
      id: '',
      name: '',
      isSaved: false,
      autoWaterEnabled: false,
      autoFeedEnabled: false,
      tempLow: 0,
      tempHigh: 0,
      phLow: 0,
      phHigh: 0,
      tdoLow: 0,
      tdoHigh: 0,
      tdsLow: 0,
      tdsHigh: 0,
      turbiditiesLow: 0,
      turbiditiesHigh: 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'isSaved': isSaved,
      'autoWaterEnabled': autoWaterEnabled,
      'autoFeedEnabled': autoFeedEnabled,
      'tempLow': tempLow,
      'tempHigh': tempHigh,
      'phLow': phLow,
      'phHigh': phHigh,
      'tdoLow': tdoLow,
      'tdoHigh': tdoHigh,
      'tdsLow': tdsLow,
      'tdsHigh': tdsHigh,
      'turbiditiesLow': turbiditiesLow,
      'turbiditiesHigh': turbiditiesHigh,
    };
  }
}