import 'dart:convert';

class OptionModel {
  String? id;
  String? choice;
  String? description;
  String? question_id;
  String? image;
  String? creation_date;
  int? checked;
  OptionModel({
    this.id,
    this.choice,
    this.description,
    this.question_id,
    this.image,
    this.creation_date,
    this.checked,
  });

  OptionModel copyWith({
    String? id,
    String? choice,
    String? description,
    String? question_id,
    String? image,
    String? creation_date,
    int? checked,
  }) {
    return OptionModel(
      id: id ?? this.id,
      choice: choice ?? this.choice,
      description: description ?? this.description,
      question_id: question_id ?? this.question_id,
      image: image ?? this.image,
      creation_date: creation_date ?? this.creation_date,
      checked: checked ?? this.checked,
    );
  }

  factory OptionModel.noMatterOption() {
    return OptionModel(
        checked: 0, choice: "لا يهم", description: null, id: 0.toString());
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'choice': choice,
      'description': description,
      'question_id': question_id,
      'image': image,
      'creation_date': creation_date,
      'checked': checked,
    };
  }

  factory OptionModel.fromMap(Map<String, dynamic> map) {
    return OptionModel(
      id: map['id'] != null ? map['id'] : null,
      choice: map['choice'] != null ? map['choice'] : null,
      description: map['description'] != null ? map['description'] : null,
      question_id: map['question_id'] != null ? map['question_id'] : null,
      image: map['image'] != null ? map['image'] : null,
      creation_date: map['creation_date'] != null ? map['creation_date'] : null,
      checked: map['checked'] != null ? map['checked'] : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OptionModel.fromJson(String source) =>
      OptionModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'OptionModel(id: $id, choice: $choice, description: $description, question_id: $question_id, image: $image, creation_date: $creation_date, checked: $checked)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OptionModel &&
        other.id == id &&
        other.choice == choice &&
        other.description == description &&
        other.question_id == question_id &&
        other.image == image &&
        other.creation_date == creation_date &&
        other.checked == checked;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        choice.hashCode ^
        description.hashCode ^
        question_id.hashCode ^
        image.hashCode ^
        creation_date.hashCode ^
        checked.hashCode;
  }
}
