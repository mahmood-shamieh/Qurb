import 'dart:convert';

class ResponseModel {
  int? code;
  String? message;
  bool? status;
  dynamic body;
  ResponseModel({
    this.code,
    this.message,
    this.status,
    required this.body,
  });

  ResponseModel copyWith({
    int? code,
    String? message,
    bool? status,
    dynamic? body,
  }) {
    return ResponseModel(
      code: code ?? this.code,
      message: message ?? this.message,
      status: status ?? this.status,
      body: body ?? this.body,
    );
  }

  factory ResponseModel.noInternet() {
    return ResponseModel(
        body: null,
        code: 10,
        message:
            'لا يوجد اتصال بالإنترنت \n يرجى التحقق من اتصالك ثم إعادة المحاولة',
        status: false);
  }
  factory ResponseModel.processError() {
    return ResponseModel(
        body: null,
        code: 500,
        message:
            'حدث خطأ غير معروف أثناء المعالجة  \n يرجي مراجعة الدعم التقني ',
        status: false);
  }
  factory ResponseModel.connectionTiemOut() {
    return ResponseModel(
        body: null,
        code: 1,
        message:
            'Connection time out ... please check your internet connection and try again later',
        status: false);
  }
  factory ResponseModel.undefinedProblem() {
    return ResponseModel(
        body: null,
        code: 501,
        message: 'حدثت مشكلة غير متوقعة \n يرجى التواصل مع الدعم التقني',
        status: false);
  }
  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'message': message,
      'status': status,
      'body': body,
    };
  }

  factory ResponseModel.fromMap(Map<String, dynamic> map) {
    return ResponseModel(
      code: map['code'] != null ? map['code'] : null,
      message: map['message'] != null ? map['message'] : null,
      status: map['status'] != null ? map['status'] : null,
      body: map['body'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ResponseModel.fromJson(String source) =>
      ResponseModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ResponseModel(code: $code, message: $message, status: $status, body: $body)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ResponseModel &&
        other.code == code &&
        other.message == message &&
        other.status == status &&
        other.body == body;
  }

  @override
  int get hashCode {
    return code.hashCode ^ message.hashCode ^ status.hashCode ^ body.hashCode;
  }
}
