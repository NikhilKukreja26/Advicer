import 'package:adviser/1_domain/entities/advice_entity.dart';

class AdviceModel extends AdviceEntity {
  const AdviceModel({
    required super.id,
    required super.advice,
  });

  factory AdviceModel.fromJson(Map<String, dynamic> json) {
    return AdviceModel(
      id: json['advice_id'],
      advice: json['advice'],
    );
  }

  // @override
  // List<Object> get props => [];
}
