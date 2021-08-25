
class TodayNotif {
  final String title, time;
  final int id, type;

  TodayNotif(
      {required this.type,
      required this.title,
      required this.time,
      required this.id});
}

List<TodayNotif> todayNotif = [
  TodayNotif(
      id: 1, title: "Beli Emas Potongan hingga 20rb", time: "11.00", type: 1),
  TodayNotif(
    id: 2,
    title: "Danamu telah berhasil ditransfer",
    time: "10.00",
    type: 2,
  ),
  TodayNotif(
    id: 3,
    title: "Extra Promo 20% Cashback",
    time: "09.00",
    type: 1,
  ),
  TodayNotif(id: 4, title: "Pembayaranmu berhasil", time: "07.00", type: 3),
];

class YesterdayNotif {
  final String title, time;
  final int id, type;

  YesterdayNotif(
      {required this.type,
      required this.title,
      required this.time,
      required this.id});
}

List<YesterdayNotif> yesterdayNotif = [
  YesterdayNotif(
      id: 1, title: "Extra Cashback Top Up Gopay", time: "11.50", type: 1),
  YesterdayNotif(id: 2, title: "Pembayaranmu berhasil", time: "10.15", type: 3),
  YesterdayNotif(
      id: 3, title: "Promo khusus pelanggan perta;ma", time: "08.20", type: 1),
  YesterdayNotif(
      id: 4, title: "Akunmu telah terverifikasi", time: "07.00", type: 0),
];

class NotifType {
  final String label;
  final int id;

  NotifType({required this.label, required this.id});
}

List<NotifType> notifType = [
  NotifType(label: 'verified', id: 0),
  NotifType(label: 'promo', id: 1),
  NotifType(label: 'transfer', id: 2),
  NotifType(label: 'success', id: 3)
];
