import 'package:flutter/material.dart';
import 'package:paper/categoryPage.dart';

class tileCategory extends StatelessWidget {
  final String title;
  final String Curl;

  const tileCategory({super.key, required this.title, required this.Curl});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.only(right: 10, top: 0),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CategoryPage(
                  title: title,
                  page: 1,
                ),
              ),
            );
          },
          child: Container(
            width: 150,
            child: Center(
              child: Stack(
                children: [
                  Center(
                    child: Container(
                      height: 80,
                      width: 150,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: Image.network(
                          Curl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      title,
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 15,
                          decoration: TextDecoration.none,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
