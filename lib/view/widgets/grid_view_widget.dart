import 'package:flutter/material.dart';

class GridviewWidget extends StatelessWidget {
  const GridviewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 100,
        height: 350,
        child: GridView.builder(
          itemCount: 18,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              mainAxisExtent: 58,
              maxCrossAxisExtent: 50,
              childAspectRatio: 50,
              mainAxisSpacing: 0,
              crossAxisSpacing: 10),
          itemBuilder: (context, index) => Image.asset(
            'assets/images/Seat.png',
            color: const Color.fromRGBO(252, 21, 59, 1),
          ),
        ));
  }
}
