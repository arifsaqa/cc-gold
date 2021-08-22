import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:learnUI/bindings/formater.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/constants/fontSizes.dart';
import 'package:learnUI/controllers/app_data/dataTreesController.dart';
import 'package:learnUI/controllers/transactionController.dart';
import 'package:learnUI/models/transaction/transaction.dart';
import 'package:learnUI/screens/successPayment/components/Body.dart';
import 'package:learnUI/screens/successPayment/components/Separator.dart';

class TransactionDetailScreen extends StatefulWidget {
  final Transaction data;

  const TransactionDetailScreen({Key? key, required this.data})
      : super(key: key);
  TransactionDetailScreenState createState() => TransactionDetailScreenState();
}

class TransactionDetailScreenState extends State<TransactionDetailScreen> {
  final dataController = Get.find<DataTreeController>();
  bool _loading = true;
  int _price = 0;
  String getLabelOrTitle(int type) {
    switch (type) {
      case 1:
        return "Pembelian";
      case 2:
        return "Penjualan";
      default:
        return "Transfer";
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    if (widget.data.type == 1) {
      int price = await dataController.getBuyPriceById(widget.data.priceId);
      setState(() {
        _price = price;
        _loading = false;
      });
    } else {
      int price = await dataController.getSellPriceById(widget.data.priceId);
      setState(() {
        _price = price;
        _loading = false;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.data.priceId);
    final formatter = Get.find<Formatter>();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Transaksi"),
      ),
      body: Stack(children: [
        Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 26, bottom: 26),
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(.05),
                    spreadRadius: 10,
                    blurRadius: 2,
                    offset: Offset(2, 10))
              ]),
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 58,
                      width: 58,
                      child: Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.center,
                        children: [
                          CustomPaint(
                            painter: Painter(),
                          ),
                          Icon(
                            Icons.pending_actions,
                            size: 30,
                            color: Colors.white,
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    getLabelOrTitle(widget.data.type) + " Emas",
                    textScaleFactor: 1.0,
                    style: TextStyle(
                        fontSize: header,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  const MySeparator(
                    color: Color.fromRGBO(151, 151, 151, 1),
                    height: 1,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
              Row(children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        textScaleFactor: 1.0,
                        text: TextSpan(
                            text: getLabelOrTitle(widget.data.type),
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Color(priceLabel),
                                fontSize: normal,
                                fontFamily: "MetroReg"),
                            children: [
                              TextSpan(
                                text: ' Emas ',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Color(priceLabel),
                                    fontSize: normal,
                                    fontFamily: "MetroReg"),
                              ),
                              TextSpan(
                                text: widget.data.gram.toString() + " gram",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Color(priceLabel),
                                    fontSize: normal,
                                    fontFamily: "MetroReg"),
                              ),
                            ]),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      RichText(
                        textScaleFactor: 1.0,
                        text: TextSpan(
                            text: "Harga Emas : ",
                            style: TextStyle(
                                color: Color(priceLabel),
                                fontSize: sm,
                                fontFamily: "MetroReg"),
                            children: [
                              TextSpan(
                                text: widget.data.type == 1
                                    ? "Rp. " + formatter.addDot(_price)
                                    : "Rp. " + formatter.addDot(_price),
                                style: TextStyle(
                                    color: Color(priceLabel),
                                    fontSize: sm,
                                    fontFamily: "MetroReg"),
                              ),
                              TextSpan(
                                text: "/gram",
                                style: TextStyle(
                                    color: Color(priceLabel),
                                    fontSize: sm,
                                    fontFamily: "MetroReg"),
                              ),
                            ]),
                      ),
                    ],
                  ),
                ),
              ]),
              Container(
                margin: EdgeInsets.only(top: 26),
                height: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.data.type == 3 ? "Jumlah" : "Nominal",
                          textScaleFactor: 1.0,
                          style: TextStyle(color: Colors.black, fontSize: sm),
                        ),
                        Text(
                          "Rp. " + formatter.addDot(widget.data.nominal),
                          // typeId == 2 ? label : price,
                          textScaleFactor: 1.0,
                          style: TextStyle(color: Colors.black, fontSize: sm),
                        )
                      ],
                    ),
                    widget.data.type == 3
                        ? SizedBox(
                            height: 0,
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Biaya Admin",
                                textScaleFactor: 1.0,
                                style: TextStyle(
                                    color: Colors.black, fontSize: sm),
                              ),
                              Text(
                                "Rp " + widget.data.adminFee.toString(),
                                textScaleFactor: 1.0,
                                style: TextStyle(
                                    color: Colors.black, fontSize: sm),
                              )
                            ],
                          ),
                    widget.data.type == 3
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "No Tujuan",
                                textScaleFactor: 1.0,
                                style: TextStyle(
                                    height: 1.5,
                                    fontWeight: FontWeight.w500,
                                    color: Color(priceLabel),
                                    fontSize: normal),
                              ),
                              Text(
                                widget.data.destinationNumber.toString(),
                                textScaleFactor: 1.0,
                                style: TextStyle(
                                    height: 1.5,
                                    fontWeight: FontWeight.w500,
                                    color: Color(priceLabel),
                                    fontSize: normal),
                              ),
                              Text(
                                  "a/n " +
                                      widget.data.destinationNumber.toString(),
                                  textScaleFactor: 1.0,
                                  style: TextStyle(
                                      height: 1.5, color: Color(priceLabel))),
                              Text("Pesan : " + widget.data.message.toString(),
                                  textScaleFactor: 1.0,
                                  style: TextStyle(
                                      height: 1.5, color: Color(priceLabel))),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total",
                                textScaleFactor: 1.0,
                                style: TextStyle(
                                    color: Colors.black, fontSize: sm),
                              ),
                              Text(
                                "Rp. " +
                                    formatter.addDot(widget.data.adminFee +
                                        widget.data.nominal),
                                textScaleFactor: 1.0,
                                style: TextStyle(
                                    color: Colors.black, fontSize: sm),
                              )
                            ],
                          ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              const MySeparator(
                color: Color.fromRGBO(151, 151, 151, 1),
                height: 1,
              ),
              SizedBox(
                height: 22,
              ),
              widget.data.status == 1
                  ? Column(children: [
                      BarcodeWidget(
                        barcode: Barcode.code128(),
                        data: widget.data.barcode,
                        height: 67,
                      ),
                      Text(
                        "No Pref " + widget.data.barcode,
                        textScaleFactor: 1.0,
                        style: TextStyle(color: Colors.black, fontSize: sm),
                      )
                    ])
                  : ElevatedButton(
                      onPressed: () {
                        Get.defaultDialog(
                            custom: Icon(
                              Icons.pending,
                              color: Color(background),
                            ),
                            middleText: "Working on it :)",
                            middleTextStyle:
                                TextStyle(color: Color(background)));
                      },
                      child: Text("Verifikasi Transaksi")),
            ],
          ),
        ),
        Positioned(
            top: 10,
            right: 20,
            child: InkWell(
              onTap: () {
                Get.offAndToNamed('/logged');
              },
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Color(upperGradient),
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(8))),
                child: Image.asset(
                  "images/navs/homeActive.png",
                  width: 25,
                  height: 25,
                ),
              ),
            )),
        Container(
          height: _loading ? size.height : 0,
          width: _loading ? size.width : 0,
          color: Colors.black.withOpacity(0.5),
          child: SpinKitCircle(
            color: Color(background),
          ),
        ),
      ]),
    );
  }
}
