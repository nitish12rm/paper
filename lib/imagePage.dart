import 'package:async_wallpaper/async_wallpaper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:wallpaper/wallpaper.dart';

class pageImage extends StatelessWidget {
  final String url;

  const pageImage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Material(
      child: Stack(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            child: Image.network(
              url,
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.save_alt,
                color: Colors.black,
              ),
              SizedBox(
                width: 10,
              )
            ],
          )),
          Container(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    setWallpaper();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0x36FFFFFF), Color(0x0FFFFFFF)]),
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Colors.black, width: 1)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Set as Wallpaper',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            decoration: TextDecoration.none),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Cancel',
                    style: TextStyle(color: Colors.black),
                  ),
                )),
                SizedBox(
                  height: 50,
                )
              ],
            ),
          )
        ],
      ),
    ));
  }

  Future setWallpaper() async {
    String result;
// Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await AsyncWallpaper.setWallpaper(
        goToHome: true,
        url: url,
        wallpaperLocation: AsyncWallpaper.HOME_SCREEN,
        // toastDetails: ToastDetails.success(),
        // errorToastDetails: ToastDetails.error(),
      )
          ? 'Wallpaper set'
          : 'Failed to get wallpaper.';
      print(result);
    } on PlatformException {}

    // try {
    //   int location = 1; // or location = WallpaperManager.LOCK_SCREEN;
    //   var file = await DefaultCacheManager().getSingleFile(url);
    //   print(file.path);
    //   final bool result =
    //       await WallpaperManager.setWallpaperFromFile(file.path, location);
    //   print(result);
    // } on PlatformException {}
  }
}
