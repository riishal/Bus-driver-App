import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/controller/bus_provider.dart';

import 'package:test_app/view/widgets/textform_field.dart';

import 'drivers_list.dart';

class AddDriverScreen extends StatefulWidget {
  const AddDriverScreen({super.key});

  @override
  State<AddDriverScreen> createState() => _AddDriverScreenState();
}

class _AddDriverScreenState extends State<AddDriverScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController licenseNoController = TextEditingController();
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
            'Add Driver',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Consumer<BusProvider>(builder: (context, state, child) {
              return Column(
                children: [
                  TextformWidget(
                      size: size, controller: nameController, hintText: 'name'),
                  SizedBox(
                    height: 15,
                  ),
                  TextformWidget(
                      size: size,
                      controller: mobileController,
                      hintText: 'mobile Number'),
                  SizedBox(
                    height: 15,
                  ),
                  TextformWidget(
                      size: size,
                      controller: licenseNoController,
                      hintText: 'license Number'),
                  Expanded(
                    child: const SizedBox(),
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
                        onPressed: () async {
                          dynamic created = await context
                              .read<BusProvider>()
                              .addDriver(
                                  nameController.text.trim(),
                                  mobileController.text.toString().trim(),
                                  licenseNoController.text.trim());
                          if (created.status) {
                            if (!mounted) return;
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const DriversListScreen()));
                          }
                          nameController.clear();
                          mobileController.clear();
                          licenseNoController.clear();
                        },
                        child: const Text(
                          'Save',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        )),
                  ),
                ],
              );
            }),
          ),
        ));
  }
}
