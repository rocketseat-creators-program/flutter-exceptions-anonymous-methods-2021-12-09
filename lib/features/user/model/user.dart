import 'dart:convert';

enum Status { active, inactive }

class User {
  final String name;
  final String picture;
  final DateTime bornDate;
  final Status status;
  User({
    required this.name,
    required this.picture,
    required this.bornDate,
    required this.status,
  });

  User copyWith({
    String? name,
    String? picture,
    DateTime? bornDate,
    Status? status,
  }) {
    return User(
      name: name ?? this.name,
      picture: picture ?? this.picture,
      bornDate: bornDate ?? this.bornDate,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'picture': picture,
      'bornDate': bornDate.millisecondsSinceEpoch,
      'status': status.toString(),
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'],
      picture: map['picture'],
      bornDate: DateTime.fromMillisecondsSinceEpoch(map['bornDate']),
      status: Status.values.firstWhere(
        (e) => e.toString() == 'Status.' + map['status'],
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(name: $name, picture: $picture, bornDate: $bornDate, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.name == name &&
        other.picture == picture &&
        other.bornDate == bornDate &&
        other.status == status;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        picture.hashCode ^
        bornDate.hashCode ^
        status.hashCode;
  }
}
