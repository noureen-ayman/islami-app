import 'Reciters.dart';

class RecitersModel {
  RecitersModel({this.reciters});

  RecitersModel.fromJson(dynamic json) {
    if (json['reciters'] != null) {
      reciters = [];
      json['reciters'].forEach((v) {
        reciters?.add(Reciters.fromJson(v));
      });
    }
  }

  List<Reciters>? reciters;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (reciters != null) {
      map['reciters'] = reciters?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
