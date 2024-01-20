import 'package:flutter/material.dart';
import 'package:test_app/view/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromRGBO(252, 21, 59, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Center(child: Image.asset('assets/images/splash.png'))),
          SizedBox(
            height: size.height * 0.080,
            width: size.width * 0.89,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                    backgroundColor: Colors.white),
                onPressed: () async {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const LoginScreen()));
                },
                child: const Text(
                  'Login',
                  style: TextStyle(
                      fontSize: 20,
                      color: const Color.fromRGBO(252, 21, 59, 1),
                      fontWeight: FontWeight.w500),
                )),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
