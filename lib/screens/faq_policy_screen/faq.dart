import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learnUI/constants/colors.dart';
import 'package:learnUI/constants/fontSizes.dart';
import 'package:learnUI/controllers/app_data/dataTreesController.dart';
import 'package:learnUI/models/faq/faq.dart';
import 'package:shimmer/shimmer.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({Key? key}) : super(key: key);

  @override
  _FaqScreenState createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  final controller = Get.find<DataTreeController>();
  var _data = [];
  var isExpanded = false;
  var loading = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      _getPolicies();
    });
    print(_data);
  }

  @override
  void dispose() {
    super.dispose();
  }

  _getPolicies() async {
    setState(() {
      loading = true;
    });
    await controller.getFaqs();
    setState(() {
      _data = controller.faqs.value.data;
    });
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget _buildPanel() {
      return ExpansionPanelList(
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            _data[index].isExpanded = !isExpanded;
          });
        },
        children: _data.map<ExpansionPanel>((dynamic item) {
          return ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                title: Text(
                  item.question!,
                  textScaleFactor: 1.0,
                  style: TextStyle(
                      color: Color(background),
                      fontFamily: "MetroBold",
                      fontSize: sm),
                ),
              );
            },
            body: ListTile(
              title: Text(
                item.answer!,
                textScaleFactor: 1.0,
                style: TextStyle(color: Color(background), fontSize: sm),
              ),
              // subtitle:
              //     const Text('To delete this panel, tap the trash can icon'),
              // // trailing: const Icon(Icons.delete),
              // // onTap: () {
              // //   setState(() {
              // //     _data.removeWhere(
              // //         (dynamic currentItem) => item == currentItem);
              // //   });
            ),
            isExpanded: item.isExpanded!,
          );
        }).toList(),
      );
    }

    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Title(
              color: Color(background),
              child: Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(
                  "FAQ",
                  textScaleFactor: 1.0,
                  style: TextStyle(fontFamily: "MetroBold"),
                ),
              )),
          automaticallyImplyLeading: false,
          backgroundColor: Color(background),
        ),
        body: SingleChildScrollView(
            child: Container(
          child: Obx(() => controller.loading.value
              ? Container(
                  width: double.infinity,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 1),
                          child: Shimmer(
                              gradient: LinearGradient(stops: [
                                0.4,
                                0.5,
                                0.6
                              ], colors: [
                                Color(lowerGradient),
                                Color(upperGradient),
                                Color(lowerGradient)
                              ]),
                              child: Container(
                                // margin: EdgeInsets.symmetric(
                                // vertical: 10, horizontal: 20),
                                width: 327,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Color(background),
                                  // borderRadius: BorderRadius.circular(8)
                                ),
                              )),
                        );
                      }))
              : _data.length > 0
                  ? _buildPanel()
                  : Container(
                      height: size.height - 100,
                      width: size.width,
                      child: Center(
                        child: Text(
                          "Belum ada data",
                          textScaleFactor: 1.0,
                          style: TextStyle(color: Color(background)),
                        ),
                      ),
                    )),
        )));
  }
}
