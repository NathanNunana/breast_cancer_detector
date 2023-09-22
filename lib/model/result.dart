part of models;

@HiveType(typeId: 0)
class ResultAdapter {
  @HiveField(0)
  double? confidence;
  @HiveField(1)
  String? label;
  @HiveField(2)
  DateTime? date;
  @HiveField(3)
  String? image;

  ResultAdapter({this.confidence, this.label, this.date, this.image});

  factory ResultAdapter.fromJson(dynamic json) => ResultAdapter(
        confidence: json["confidence"],
        label: json["label"],
        image: json["image"],
        date: DateTime.now(),
      );
}
