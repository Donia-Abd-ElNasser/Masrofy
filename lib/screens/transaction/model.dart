// lib/screens/transaction/model.dart
class TransactionModel {
  final String? id;
  final String userId;
  final double amount;
  final String description;
  final String category;
  final String currency;
  final String transactionType;
  final String repetition;
  final DateTime date;
  final DateTime createdAt;

  TransactionModel({
    this.id,
    required this.userId,
    required this.amount,
    required this.description,
    required this.category,
    required this.currency,
    required this.transactionType,
    required this.repetition,
    required this.date,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      'amount': amount,
      'description': description,
      'category': category,
      'currency': currency,
      'transactionType': transactionType,
      'repetition': repetition,
      'date': date.millisecondsSinceEpoch,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory TransactionModel.fromMap(String id, Map<String, dynamic> map) {
    return TransactionModel(
      id: id,
      userId: map['userId'] ?? '', // Make sure to include userId here
      amount: (map['amount'] as num).toDouble(),
      description: map['description'] ?? '',
      category: map['category'] ?? '',
      currency: map['currency'] ?? 'Egyptian pound',
      transactionType: map['transactionType'] ?? 'expense',
      repetition: map['repetition'] ?? 'One time',
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
    );
  }

  TransactionModel copyWith({
    String? id,
    String? userId,
    double? amount,
    String? description,
    String? category,
    String? currency,
    String? transactionType,
    String? repetition,
    DateTime? date,
    DateTime? createdAt,
  }) {
    return TransactionModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      amount: amount ?? this.amount,
      description: description ?? this.description,
      category: category ?? this.category,
      currency: currency ?? this.currency,
      transactionType: transactionType ?? this.transactionType,
      repetition: repetition ?? this.repetition,
      date: date ?? this.date,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
