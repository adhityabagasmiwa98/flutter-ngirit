class TransactionDomain {
  final int amount;
  final String category;
  final String date;
  final String notes;

  TransactionDomain({
    required this.amount,
    required this.category,
    required this.date,
    required this.notes,
  });

  factory TransactionDomain.fromJson(Map<String, dynamic> json) {
    return TransactionDomain(
      amount: json['amount'],
      category: json['category'],
      date: json['date'],
      notes: json['notes'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "amount": amount,
      "category": category,
      "date": date,
      "notes": notes,
    };
  }
}
