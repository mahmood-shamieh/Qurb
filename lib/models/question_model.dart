import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:qurb/models/option_model.dart';

class QuestionModel {
  String? id;
  String? f_question;
  String? m_question;
  String? type;
  String? scrollable;
  String? skippable;
  String? creation_date;
  String? image;
  List<OptionModel>? options;
  QuestionModel({
    this.id,
    this.f_question,
    this.m_question,
    this.type,
    this.scrollable,
    this.skippable,
    this.creation_date,
    this.image,
    this.options,
  });

  QuestionModel copyWith({
    String? id,
    String? f_question,
    String? m_question,
    String? type,
    String? scrollable,
    String? skippable,
    String? creation_date,
    String? image,
    List<OptionModel>? options,
  }) {
    return QuestionModel(
      id: id ?? this.id,
      f_question: f_question ?? this.f_question,
      m_question: m_question ?? this.m_question,
      type: type ?? this.type,
      scrollable: scrollable ?? this.scrollable,
      skippable: skippable ?? this.skippable,
      creation_date: creation_date ?? this.creation_date,
      image: image ?? this.image,
      options: options ?? this.options,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'f_question': f_question,
      'm_question': m_question,
      'type': type,
      'scrollable': scrollable,
      'skippable': skippable,
      'creation_date': creation_date,
      'image': image,
      'options': options?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      id: map['id'] != null ? map['id'] : null,
      f_question: map['f_question'] != null ? map['f_question'] : null,
      m_question: map['m_question'] != null ? map['m_question'] : null,
      type: map['type'] != null ? map['type'] : null,
      scrollable: map['scrollable'] != null ? map['scrollable'] : null,
      skippable: map['skippable'] != null ? map['skippable'] : null,
      creation_date: map['creation_date'] != null ? map['creation_date'] : null,
      image: map['image'] != null ? map['image'] : null,
      options: map['options'] != null
          ? List<OptionModel>.from(
              map['options']?.map((x) => OptionModel.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuestionModel.fromJson(String source) =>
      QuestionModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'QuestionModel(id: $id, f_question: $f_question, m_question: $m_question, type: $type, scrollable: $scrollable, skippable: $skippable, creation_date: $creation_date, image: $image, options: $options)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is QuestionModel &&
        other.id == id &&
        other.f_question == f_question &&
        other.m_question == m_question &&
        other.type == type &&
        other.scrollable == scrollable &&
        other.skippable == skippable &&
        other.creation_date == creation_date &&
        other.image == image &&
        listEquals(other.options, options);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        f_question.hashCode ^
        m_question.hashCode ^
        type.hashCode ^
        scrollable.hashCode ^
        skippable.hashCode ^
        creation_date.hashCode ^
        image.hashCode ^
        options.hashCode;
  }
}
