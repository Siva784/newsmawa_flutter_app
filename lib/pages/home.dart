import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:newsmawa/pages/categories_add.dart';
import 'package:newsmawa/pages/news_get.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String url = "f";
  String urlToImage;
  List newlist = [];
  List newlis = [];
  bool _loading = true;

  NewsGet k = new NewsGet();
  NewsGet kp = new NewsGet();
  void setting() async {
    await k.getnews();
    setState(() {
      newlist = k.articals1;
      _loading = false;
    });
  }

  // ignore: non_constant_identifier_names
  void setting1(int cat_index) async {
    await kp.getnews1(all_cats[cat_index].cat_name);
    setState(() {
      newlist = kp.articals2;
      _loading = false;
    });
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    setting();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "News",
              style: TextStyle(
                fontFamily: 'Pangolin',
                letterSpacing: 2.0,
                color: Colors.black,
              ),
            ),
            Text(
              " Mawa",
              style: TextStyle(
                letterSpacing: 2.0,
                fontFamily: 'Pangolin',
                color: Colors.blueAccent,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              height: 100,
              child: ListView.builder(
                itemCount: all_cats.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () async {
                      setState(() {
                        _loading = true;
                      });
                      // ignore: await_only_futures
                      await setting1(index);

                      // Navigator.pushNamed(context, '/categorydis',
                      //     arguments: {
                      //       'allobjects': newlis,
                      //       'cat_index': index
                      //     });
                    },
                    child: Container(
                      height: 100,
                      margin: EdgeInsets.only(right: 8.0),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(9),
                            child: CachedNetworkImage(
                              imageUrl: all_cats[index].cat_img,
                              width: 170,
                              height: 100,
                              fit: BoxFit.fill,
                              placeholder: (context, url) =>
                                  Center(child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                          ),
                          Container(
                            width: 170,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9),
                              color: Colors.black26,
                            ),
                            child: Center(
                              child: Text(
                                all_cats[index].cat_name,
                                style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 18,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(top: 4),
                height: MediaQuery.of(context).size.height -
                    AppBar().preferredSize.height -
                    150,
                child: _loading
                    ? Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        itemCount: newlist.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(9),
                                  child: CachedNetworkImage(
                                    imageUrl: newlist[index].urlToImage,
                                    fit: BoxFit.fill,
                                    placeholder: (context, url) => Center(
                                        child: CircularProgressIndicator()),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                                ),
                                SizedBox(
                                  height: 3.0,
                                ),
                                Text(
                                  newlist[index].title,
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  height: 3.0,
                                ),
                                Text(
                                  newlist[index].description,
                                  style: TextStyle(
                                    //fontSize: 10,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),

                                // Linkify(
                                //   onOpen: (url) => print("Clicked hello!"),
                                //   text: "Made by https://cretezy.com",
                                // ),

                                Divider(
                                  height: 15.0,
                                  color: Colors.grey[500],
                                )
                              ],
                            ),
                          );
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
