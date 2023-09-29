import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wallpaper_app/Model/photosModel.dart';
import 'package:flutter_wallpaper_app/controller/apiOperation.dart';
import 'package:flutter_wallpaper_app/view/widgets/catblock.dart';
import 'package:flutter_wallpaper_app/view/widgets/custom_app_bar.dart';
import 'package:flutter_wallpaper_app/view/widgets/search_bar.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PhotosModel> trendingWallList = [];

  GetTrendingWallpapers() async {
    trendingWallList = await ApiOperation.getTrandingWallpapers();

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetTrendingWallpapers();
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
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            child: SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 30,
                  itemBuilder: (context, index) => Category_Block()),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 400,
            child: GridView.builder(
                physics: BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 400,
                    crossAxisSpacing: 13,
                    mainAxisSpacing: 10),
                itemCount: trendingWallList.length,
                itemBuilder: (context, index) {
                  return GridTile(
                    child: Container(
                      height: 500,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.amberAccent),
                      width: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          fit: BoxFit.cover,
                          trendingWallList[index].imgSrc,
                          height: 500,
                          width: 50,
                        ),
                      ),
                    ),
                  );
                }),
          )
        ]),
      ),
    );
  }
}
