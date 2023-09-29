import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_wallpaper_app/Model/photosModel.dart';
import 'package:http/http.dart' as http;

class ApiOperation {
  static List<PhotosModel> trendingWallpapers = [];
  static List<PhotosModel> searchWallpaperList = [];
  static Future<List<PhotosModel>> getTrandingWallpapers() async {
    await http.get(Uri.parse("https://api.pexels.com/v1/curated"), headers: {
      "Authorization":
          "rvHXhT1MFASxjKu8VajQHLNCLppJqEwbJ0NJUB5uh8RdagNtAGMim8ee"
    }).then((value) {
      print(value.body);
      Map<String, dynamic> jsonData = jsonDecode(value.body);
      var photos = jsonDecode(value.body)['photos'];
      photos.forEach((element) {
        trendingWallpapers.add(PhotosModel.fromApitoApp(element));
      });
    });
    return trendingWallpapers;
  }

  static Future<List<PhotosModel>> searchWallpapers(String query) async {
    await http.get(
        Uri.parse(
            "https://api.pexels.com/v1/search?query=$query&per_page=10&page=1"),
        headers: {
          "Authorization":
              "rvHXhT1MFASxjKu8VajQHLNCLppJqEwbJ0NJUB5uh8RdagNtAGMim8ee"
        }).then((value) {
      print(value.body);
      Map<String, dynamic> jsonData = jsonDecode(value.body);
      var photos = jsonDecode(value.body)['photos'];
      photos.forEach((element) {
        searchWallpaperList.clear();
        searchWallpaperList.add(PhotosModel.fromApitoApp(element));
      });
    });
    return searchWallpaperList;
  }
}
