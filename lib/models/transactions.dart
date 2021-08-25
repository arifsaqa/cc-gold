
class Transaction {
  final String title, date, type;
  final int id;

  Transaction(
      {required this.title,
      required this.date,
      required this.id,
      required this.type});
}

List<Transaction> transactions = [
  Transaction(
      id: 1, title: "Beli Emas 10 gram", date: "10 Juni 2021", type: "beli"),
  Transaction(
      id: 1, title: "Beli Emas 2 gram", date: "10 Juni 2021", type: "beli"),
  Transaction(
      id: 1, title: "Jual Emas 2 gram", date: "10 Juni 2021", type: "jual"),
];
