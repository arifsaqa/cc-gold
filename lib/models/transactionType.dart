
class TransactionType {
  final String title;
  final int id;

  TransactionType({required this.title, required this.id});
}

List<TransactionType> transactionTypes = [
  TransactionType(
    id: 1,
    title: "Pembelian",
  ),
  TransactionType(
    id: 2,
    title: "Penjualan",
  ),
  TransactionType(
    id: 3,
    title: "Transfer",
  ),
];
