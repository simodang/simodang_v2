import 'package:date_format/date_format.dart';

class Metric {
  final String id;
  final double temperature;
  final double ph;
  final double tdo;
  final double tds;
  final double turbidity;
  final String createdAt;

  Metric({
    required this.id,
    required this.temperature,
    required this.ph,
    required this.tdo,
    required this.tds,
    required this.turbidity,
    required this.createdAt,
  });

  factory Metric.fromJson(Map<String, dynamic> json) {
    return Metric(
      id: json['id'],
      temperature: double.parse(json['temperature']),
      ph: double.parse(json['ph']),
      tdo: double.parse(json['tdo']),
      tds: double.parse(json['tds']),
      turbidity: double.parse(json['turbidity']),
      createdAt: json['createdAt'],
    );
  }

  factory Metric.empty() {
    return Metric(
      id: '',
      temperature: 0,
      ph: 0,
      tdo: 0,
      tds: 0,
      turbidity: 0,
      createdAt: '',
    );
  }

  double getMetric(String property) {
    switch (property) {
      case 'temperature':
        return temperature;
      case 'ph':
        return ph;
      case 'turbidity':
        return turbidity;
      case 'tdo':
        return tdo;
      case 'tds':
        return tds;
      default:
        return 0;
    }
  }

  String getUnit(String property) {
    switch (property) {
      case 'temperature':
        return '°C';
      case 'ph':
        return 'pH';
      case 'turbidity':
        return 'NTU';
      case 'tdo':
        return 'mg/L';
      case 'tds':
        return 'ppm';
      default:
        return '';
    }
  }

  String getCasedProperty(String property) {
    switch (property) {
      case 'temperature':
        return 'Temperature';
      case 'ph':
        return 'pH';
      case 'turbidity':
        return 'Turbidity';
      case 'tdo':
        return 'TDO';
      case 'tds':
        return 'TDS';
      default:
        return '';
    }
  }

  String getTime() {
    final DateTime date = DateTime.parse(createdAt);

    return formatDate(date, [HH, ':', nn, ':', ss]);
  }

  String getFullTime() {
    final DateTime date = DateTime.parse(createdAt);

    return formatDate(date, [dd, ' ', MM, ' ', yyyy, ' ', HH, ':', nn, ':', ss]);
  }
}