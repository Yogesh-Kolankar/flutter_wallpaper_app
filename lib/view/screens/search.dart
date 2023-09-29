import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wallpaper_app/Model/photosModel.dart';
import 'package:flutter_wallpaper_app/controller/apiOperation.dart';
import 'package:flutter_wallpaper_app/view/widgets/catblock.dart';
import 'package:flutter_wallpaper_app/view/widgets/custom_app_bar.dart';
import 'package:flutter_wallpaper_app/view/widgets/search_bar.dart';

class SearchScreen extends StatefulWidget {
  String query;

  SearchScreen({required this.query});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late List<PhotosModel> searchResults = [];

  GetSearchResults() async {
    searchResults = await ApiOperation.searchWallpapers(widget.query);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetSearchResults();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Custom_App_Bar(),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Search_Bar()),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 4000,
            child: GridView.builder(
                physics: BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 400,
                    crossAxisSpacing: 13,
                    mainAxisSpacing: 10),
                itemCount: searchResults.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 400,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.amberAccent),
                    width: 50,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        fit: BoxFit.cover,
                        searchResults[index].imgSrc,
                        height: 500,
                        width: 50,
                      ),
                    ),
                  );
                }),
          ),
        ]),
      ),
    );
  }
}
