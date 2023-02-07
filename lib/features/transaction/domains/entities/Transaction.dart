import 'package:equatable/equatable.dart';

abstract class Transaction extends Equatable {
  final int? id;
  final String operator;
  final double amount;
  final String direction;
  final String? transactionDate;

  const Transaction({
    this.id,
    required this.operator,
    required this.amount,
    required this.direction,
    this.transactionDate,
  });

  String get price {
    return "FCFA$amount";
  }

  @override
  List<Object?> get props => [id, operator, amount, direction, transactionDate];
}
