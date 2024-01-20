import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/view/widgets/card_widget.dart';

import '../controller/bus_provider.dart';
import 'bus_details.dart';
import 'drivers_list.dart';

int buttonIndex = 0;

class BusHomeScreen extends StatefulWidget {
  const BusHomeScreen({super.key});

  @override
  State<BusHomeScreen> createState() => _BusHomeScreenState();
}

class _BusHomeScreenState extends State<BusHomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          bottom: const PreferredSize(
              preferredSize: Size.fromHeight(25), child: SizedBox()),
          backgroundColor: const Color.fromRGBO(43, 43, 43, 1),
          centerTitle: true,
          title: Image.asset(
            'assets/images/splash.png',
            scale: 1.5,
          )),
      body: FutureBuilder(
          future: context.read<BusProvider>().getBusList(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasData) {
              var buses = snapshot.data.bus.length.toString();
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CardWidget(
                          color: Color.fromRGBO(252, 21, 59, 1),
                          title: 'Bus',
                          subtitle: 'Manage your Bus',
                          image: 'assets/images/yellow_bus.png',
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    const DriversListScreen()));
                          },
                          child: const CardWidget(
                            color: Color.fromRGBO(43, 43, 43, 1),
                            title: 'Driver',
                            subtitle: 'Manage your Driver',
                            image:
                                'assets/images/img_99_996004_get_d_112x94.png',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '$buses Buses Found',
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 13),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            var bus = snapshot.data.bus[index];
                            return Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Color.fromRGBO(193, 193, 193, 1))
                                  ],
                                  color: Colors.white,
                                  border: Border.all(
                                      width: 0.3,
                                      color: const Color.fromRGBO(
                                          193, 193, 193, 1))),
                              child: ListTile(
                                leading: Image.asset(
                                  'assets/images/img_image_3.png',
                                  scale: 3,
                                ),
                                title: Text(
                                  bus.name,
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                                subtitle: Text(
                                  bus.type,
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                                trailing: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      backgroundColor:
                                          const Color.fromRGBO(252, 21, 59, 1),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        buttonIndex = index;
                                      });

                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => BusDetails(
                                                index: index, data: bus),
                                          ));
                                    },
                                    child: const Text('Manage')),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                                height: 10,
                              ),
                          itemCount: snapshot.data.bus.length),
                    ),
                  ],
                ),
              );
            }
            return Container();
          }),
    );
  }
}
