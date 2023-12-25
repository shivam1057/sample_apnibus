// class GpsData {
//   final int? id;
//   final String? protocol;
//   final String? serverTime;
//   final String? deviceTime;
//   final String? fixTime;
//   final bool? valid;
//   final double? latitude;
//   final double? longitude;
//   final double? altitude;
//   final double? speed;
//   final double? course;
//   final String? address;
//   final double? accuracy;
//   final String? network;
//   final String? attributes;
//   final int? imeiNumber;
//
//   GpsData({
//     required this.id,
//     required this.protocol,
//     required this.serverTime,
//     required this.deviceTime,
//     required this.fixTime,
//     required this.valid,
//     required this.latitude,
//     required this.longitude,
//     required this.altitude,
//     required this.speed,
//     required this.course,
//     this.address,
//     required this.accuracy,
//     this.network,
//     required this.attributes,
//     required this.imeiNumber,
//   });
//
//   factory GpsData.fromJson(Map<String, dynamic> json) {
//     return GpsData(
//       id: json['id'],
//       protocol: json['protocol'],
//       serverTime: json['serverTime'],
//       deviceTime: json['deviceTime'],
//       fixTime: json['fixTime'],
//       valid: json['vaild'],
//       latitude: json['latitude'].toDouble(),
//       longitude: json['longitude'].toDouble(),
//       altitude: json['altitude'].toDouble(),
//       speed: json['speed'].toDouble(),
//       course: json['course'].toDouble(),
//       address: json['address'],
//       accuracy: json['accuracy'].toDouble(),
//       network: json['network'],
//       attributes: json['attributes'],
//       imeiNumber: json['imeiNumber'],
//     );
//   }
// }

// To parse this JSON data, do
//
//     final temperatures = temperaturesFromJson(jsonString);

class GpsData {
  int? id;
  String? protocol;
  DateTime? serverTime;
  DateTime? deviceTime;
  DateTime? fixTime;
  bool? vaild;
  double? latitude;
  double? longitude;
  double? altitude;
  double? speed;
  double? course;
  String? address;
  double? accuracy;
  String? network;
  String? attributes;
  int? imeiNumber;

  GpsData({
    required this.id,
    required this.protocol,
    required this.serverTime,
    required this.deviceTime,
    required this.fixTime,
    required this.vaild,
    required this.latitude,
    required this.longitude,
    required this.altitude,
    required this.speed,
    required this.course,
    this.address,
    required this.accuracy,
    required this.network,
    required this.attributes,
    required this.imeiNumber,
  });

  factory GpsData.fromJson(Map<String, dynamic> json) {
    return GpsData(
      id: json["id"] as int?,
      protocol: json["protocol"] as String?,
      serverTime: json["serverTime"] != null ? DateTime.parse(json["serverTime"]) : null,
      deviceTime: json["deviceTime"] != null ? DateTime.parse(json["deviceTime"]) : null,
      fixTime: json["fixTime"] != null ? DateTime.parse(json["fixTime"]) : null,
      vaild: json["vaild"] as bool?,
      latitude: json["latitude"]?.toDouble(),
      longitude: json["longitude"]?.toDouble(),
      altitude: json["altitude"]?.toDouble(),
      speed: json["speed"]?.toDouble(),
      course: json["course"]?.toDouble(),
      address: json["address"] as String?,
      accuracy: json["accuracy"]?.toDouble() ?? 0.0,
      network: json["network"] as String?,
      attributes: json["attributes"] as String?,
      imeiNumber: json["imeiNumber"] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "protocol": protocol,
      "serverTime": serverTime?.toIso8601String(),
      "deviceTime": deviceTime?.toIso8601String(),
      "fixTime": fixTime?.toIso8601String(),
      "vaild": vaild,
      "latitude": latitude,
      "longitude": longitude,
      "altitude": altitude,
      "speed": speed,
      "course": course,
      "address": address,
      "accuracy": accuracy,
      "network": network,
      "attributes": attributes,
      "imeiNumber": imeiNumber,
    };
  }
}

