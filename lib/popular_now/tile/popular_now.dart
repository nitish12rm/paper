import 'package:flutter/material.dart';

class tilePopularNow extends StatelessWidget {
  const tilePopularNow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, top: 8),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        height: 400,
        width: 250,
        child: Center(
          child: Text(
            'title',
            style: TextStyle(
                fontSize: 30,
                decoration: TextDecoration.none,
                color: Colors.white),
          ),
        ),
      ),
    );
  }
}
