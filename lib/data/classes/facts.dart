class Fact {
  final String fact;

  const Fact({required this.fact});

  factory Fact.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'data': [String fact, ...],
      } =>
        Fact(fact: fact),
      _ => throw const FormatException('Failed to load fact.'),
    };
  }
}
