import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:paper/categoryPage.dart';
import 'package:paper/imagePage.dart';
import 'package:paper/services/categoryImages.dart';

import 'package:paper/services/getCuratedPhotos.dart';

import 'category/category_tile/category_file.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int page = 1;
  Future? curated;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    print('gelo');

    curated = getCuratedPhotos(page);
  }

  Widget build(BuildContext context) {
    double Swidth = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Title
                Container(
                  child: Text(
                    "Papers",
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 40,
                        color: Colors.redAccent,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Material(
                  child: Container(
                    child: TextField(
                      onSubmitted: (s) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CategoryPage(
                              title: s.toString(),
                              page: 1,
                            ),
                          ),
                        );
                      },
                      decoration: InputDecoration(
                        hintText: 'search...',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(
                            width: 3,
                            color: Colors.black,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(
                            width: 3,
                            color: Colors.redAccent,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Text(
                    "Categories",
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                //category listview
                Container(
                  width: double.infinity,
                  height: 80,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      tileCategory(
                        title: "Nature",
                        Curl: categoryLinks[0],
                      ),
                      tileCategory(
                        title: "Abstract",
                        Curl: categoryLinks[1],
                      ),
                      tileCategory(
                        title: "Animals",
                        Curl: categoryLinks[2],
                      ),
                      tileCategory(
                        title: "Flowers",
                        Curl: categoryLinks[3],
                      ),
                      tileCategory(
                        title: "Underwater",
                        Curl: categoryLinks[4],
                      ),
                      tileCategory(
                        title: "Art",
                        Curl: categoryLinks[5],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  child: Text(
                    "Popular now",
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                //Popular photos. implemented Futurebuilder bcz any time working api requires you to work in async mode thats why we used it
                Material(
                  child: FutureBuilder(
                    future: curated,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Container(
                          child: MasonryGridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: snapshot.data['photos'].length,
                              gridDelegate:
                                  SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2),
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.all(8),
                                  child: InkWell(
                                    child: Image.network(
                                      snapshot.data['photos'][index]['src']
                                          ['medium'],
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => pageImage(
                                            url: snapshot.data['photos'][index]
                                                ['src']['portrait'],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              }),
                        );
                      } else {
                        return CircularProgressIndicator();
                      }
                    },
                  ),
                ),
                // Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                //   TextButton(
                //       onPressed: () {
                //         Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //               builder: (context) =>
                //                   CategoryPage(title: 'popular', page: page++)),
                //         );
                //       },
                //       child: Text('Next')),
                // ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
