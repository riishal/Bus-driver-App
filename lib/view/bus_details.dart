import 'package:flutter/material.dart';

import 'widgets/grid_view_widget.dart';

class BusDetails extends StatelessWidget {
  const BusDetails({super.key, required this.data, required this.index});
  final dynamic data;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          bottom: const PreferredSize(
              preferredSize: Size.fromHeight(25), child: SizedBox()),
          backgroundColor: const Color.fromRGBO(43, 43, 43, 1),
          centerTitle: true,
          title: Text(data.name)),
      body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 19, vertical: 20),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromRGBO(43, 43, 43, 1),
                ),
                height: 116,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.driverName,
                            style: const TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'License no: ${data.driverLicenseNo}',
                            style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          )
                        ],
                      ),
                      Image.asset(
                          'assets/images/img_99_996004_get_d_112x94.png')
                    ]),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 400,
                width: 323,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  color: Colors.white,
                  border:
                      Border.all(color: const Color.fromRGBO(220, 220, 220, 1)),
                ),
                child: Column(children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const SizedBox(
                        width: 140,
                      ),
                      Image.asset('assets/images/Seat.png'),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [GridviewWidget()],
                      ),
                      Column(
                        children: [GridviewWidget()],
                      )
                    ],
                  )
                ]),
              )
            ],
          )),
    );
  }
}
