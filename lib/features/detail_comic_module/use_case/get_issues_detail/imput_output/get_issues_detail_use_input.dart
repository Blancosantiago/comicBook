import 'dart:convert';

class GetIssuesDetailInput {
  final String? apiUrlSelect;

  GetIssuesDetailInput({
    this.apiUrlSelect,
  });

  factory GetIssuesDetailInput.fromJson(String str) =>
      GetIssuesDetailInput.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetIssuesDetailInput.fromMap(Map<String, dynamic> json) =>
      GetIssuesDetailInput(
        apiUrlSelect: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "id": apiUrlSelect,
      };
}
