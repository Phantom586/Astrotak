// ignore_for_file: unnecessary_this

class QuestionCategory {
  List<QuestionCategoryData>? data;

  QuestionCategory({this.data});

  QuestionCategory.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <QuestionCategoryData>[];
      json['data'].forEach((v) {
        data!.add(QuestionCategoryData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class QuestionCategoryData {
  int? id;
  String? name;
  int? price;
  String? description;
  List<String>? suggestions;

  QuestionCategoryData(
      {this.id, this.name, this.price, this.description, this.suggestions});

  QuestionCategoryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    description = json['description'];
    suggestions = json['suggestions'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['description'] = this.description;
    data['suggestions'] = this.suggestions;
    return data;
  }
}
