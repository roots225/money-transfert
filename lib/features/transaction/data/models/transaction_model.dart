import '../../domains/entities/Transaction.dart';

class TransactionModel extends Transaction {
  const TransactionModel({
    required super.operator,
    required super.amount,
    required super.direction,
    super.transactionDate,
  });
}
