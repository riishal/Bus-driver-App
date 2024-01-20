import 'package:flutter/material.dart';
import 'package:test_app/view/bus_home.dart';

class BusDetails extends StatelessWidget {
  const BusDetails({super.key, required this.data, required this.index});
  final dynamic data;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          bottom: PreferredSize(
              child: SizedBox(), preferredSize: Size.fromHeight(25)),
          backgroundColor: Color.fromRGBO(43, 43, 43, 1),
          centerTitle: true,
          title: Text(data.name)),
      body: Container(
          margin: EdgeInsets.symmetric(horizontal: 19, vertical: 26),
          child: Column(
            children: [
              Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.driverName,
                            style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'License no: ${data.driverLicenseNo}',
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          )
                        ],
                      ),
                      Image.asset(
                          'assets/images/img_99_996004_get_d_112x94.png')
                    ]),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromRGBO(43, 43, 43, 1),
                ),
                height: 116,
              )
            ],
          )),
    );
  }
}
