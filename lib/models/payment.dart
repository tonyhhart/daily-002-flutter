class Payment {
  final String holder;
  final String number;
  final String cvv;
  final String expiration;

  String get number_obfuscated {
    return this.number.length == 19
        ? "**** **** **** " + this.number.substring(15, 19)
        : "";
  }

  Payment(
      {required this.holder,
      required this.number,
      required this.cvv,
      required this.expiration});
}
