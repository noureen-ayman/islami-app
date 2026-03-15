import 'Moshaf.dart';

class Reciters {
  Reciters({this.id, this.name, this.letter, this.date, this.moshaf});

  Reciters.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    letter = json['letter'];
    date = json['date'];
    if (json['moshaf'] != null) {
      moshaf = [];
      json['moshaf'].forEach((v) {
        moshaf?.add(Moshaf.fromJson(v));
      });
    }
  }

  num? id;
  String? name;
  String? letter;
  String? date;
  List<Moshaf>? moshaf;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['letter'] = letter;
    map['date'] = date;
    if (moshaf != null) {
      map['moshaf'] = moshaf?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
