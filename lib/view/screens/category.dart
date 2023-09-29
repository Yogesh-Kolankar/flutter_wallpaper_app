import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wallpaper_app/view/widgets/catblock.dart';
import 'package:flutter_wallpaper_app/view/widgets/custom_app_bar.dart';
import 'package:flutter_wallpaper_app/view/widgets/search_bar.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Custom_App_Bar(),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Stack(children: [
            Image.network(
                height: 150,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
                "https://images.pexels.com/photos/1287145/pexels-photo-1287145.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
            Container(
              height: 150,
              width: MediaQuery.of(context).size.width,
              color: Colors.black38,
              child: Center(
                child: Text("Mountains",
                    style: TextStyle(fontSize: 30, color: Colors.white)),
              ),
            )
          ]),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: MediaQuery.of(context).size.height,
            child: GridView.builder(
                physics: BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 400,
                    crossAxisSpacing: 13,
                    mainAxisSpacing: 10),
                itemCount: 16,
                itemBuilder: (context, index) {
                  return Container(
                    height: 500,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.amberAccent),
                    width: 50,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        fit: BoxFit.cover,
                        "https://images.pexels.com/photos/1545743/pexels-photo-1545743.jpeg?auto=compress&cs=tinysrgb&w=600",
                        height: 500,
                        width: 50,
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
