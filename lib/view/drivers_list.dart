import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/bus_provider.dart';
import 'add_driver.dart';

class DriversListScreen extends StatefulWidget {
  const DriversListScreen({super.key});

  @override
  State<DriversListScreen> createState() => _DriversListScreenState();
}

class _DriversListScreenState extends State<DriversListScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        bottom: PreferredSize(
            child: SizedBox(), preferredSize: Size.fromHeight(15)),
        backgroundColor: Color.fromRGBO(43, 43, 43, 1),
        centerTitle: true,
        title: Text(
          'Driver List',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
      body: Consumer<BusProvider>(builder: (context, state, child) {
        return FutureBuilder(
            future: context.read<BusProvider>().getDriversList(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasData) {
                var driverslength = snapshot.data.drivers.length.toString();
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$driverslength Drivers Found',
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: ListView.separated(
                            itemBuilder: (context, index) {
                              var driver = snapshot.data.drivers[index];
                              return Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color:
                                              Color.fromRGBO(193, 193, 193, 1))
                                    ],
                                    color: Colors.white,
                                    border: Border.all(
                                        width: 0.3,
                                        color:
                                            Color.fromRGBO(193, 193, 193, 1))),
                                child: ListTile(
                                  title: Text(driver.name),
                                  subtitle: Text(driver.licenseNo),
                                  leading: Container(
                                      // height: 60,
                                      // color: Color.fromRGBO(193, 193, 193, 1),
                                      child: Image.asset(
                                    'assets/images/img_ellipse.png',
                                    scale: 3,
                                  )),
                                  // leading: Text(driver.id.toString()),
                                  trailing: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      backgroundColor:
                                          Color.fromRGBO(252, 21, 59, 1),
                                    ),
                                    child: Text('Delete'),
                                    onPressed: () {
                                      context
                                          .read<BusProvider>()
                                          .deleteDriver(driver.id.toString());
                                    },
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  height: 10,
                                ),
                            itemCount: snapshot.data.drivers.length),
                      ),
                      SizedBox(
                        height: size.height * 0.080,
                        width: size.width * 0.89,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(13),
                                ),
                                backgroundColor:
                                    const Color.fromRGBO(252, 21, 59, 1)),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const AddDriverScreen()));
                            },
                            child: const Text(
                              'Add Driver',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            )),
                      ),
                    ],
                  ),
                );
              }
              return Container();
            });
      }),
    );
  }
}
