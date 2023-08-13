import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:paper/services/getSearchPhotos.dart';

import 'imagePage.dart';

class CategoryPage extends StatefulWidget {
  final String title;
  int page = 1;
  CategoryPage({super.key, required this.title, required this.page});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Future? C_photos;

  void initState() {
    // TODO: implement initState
    super.initState();
    C_photos = getSearchPhotos(widget.title, widget.page);
  }

  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.redAccent,
            title: Text(
              widget.title,
              style: TextStyle(fontSize: 20),
            ),
          ),
          body: SingleChildScrollView(
            child: Material(
              child: Column(
                children: [
                  FutureBuilder(
                    future: C_photos,
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
                            itemBuilder: (context, hello) => Padding(
                              padding: EdgeInsets.all(8),
                              child: InkWell(
                                child: Image.network(
                                  snapshot.data['photos'][hello]['src']
                                      ['medium'],
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => pageImage(
                                        url: snapshot.data['photos'][hello]
                                            ['src']['portrait'],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        );
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    },
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
