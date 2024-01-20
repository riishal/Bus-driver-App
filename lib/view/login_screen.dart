import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/login_provider.dart';
import 'widgets/textform_field.dart';
import 'bus_home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Consumer<LoginProvider>(builder: (context, state, child) {
          return Column(
            children: [
              Container(
                height: 260,
                width: double.infinity,
                color: const Color.fromRGBO(43, 43, 43, 1),
                child: Stack(children: [
                  Positioned(
                    bottom: 75,
                    left: 140,
                    child: Transform.rotate(
                      angle: 4,
                      child: Container(
                        color: const Color.fromRGBO(252, 21, 59, 1),
                        height: 350,
                        width: 350,
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 110,
                    left: 30,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 41,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Manage your Bus and Drivers",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  )
                ]),
              ),
              const SizedBox(
                height: 40,
              ),
              TextformWidget(
                  size: size, controller: nameController, hintText: "username"),
              const SizedBox(
                height: 20,
              ),
              TextformWidget(
                  size: size,
                  controller: passwordController,
                  hintText: "password"),
              const Expanded(
                child: SizedBox(),
              ),
              SizedBox(
                height: size.height * 0.080,
                width: size.width * 0.89,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13),
                        ),
                        backgroundColor: const Color.fromRGBO(252, 21, 59, 1)),
                    onPressed: () async {
                      dynamic login = await context
                          .read<LoginProvider>()
                          .loginUser(nameController.text.trim(),
                              passwordController.text.trim());
                      if (login != null) {
                        if (!mounted) return;
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const BusHomeScreen()));
                      }
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          );
        }));
  }
}
