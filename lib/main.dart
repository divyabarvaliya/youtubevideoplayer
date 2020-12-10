import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:youtubevideoplayer/model.dart';
import 'package:youtubevideoplayer/videoscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: VedioPlayer(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.green[700]),
    );
  }
}

class VedioPlayer extends StatefulWidget {
  @override
  _VedioPlayerState createState() => _VedioPlayerState();
}

class _VedioPlayerState extends State<VedioPlayer> {
  UserModel userModel = UserModel();

  Future getDeta() async {
    http.Response response = await http.get("https://hemu002.herokuapp.com");
    String body = response.body;
    var jsonResult = {"data": jsonDecode(body)};
    userModel = UserModel.fromJson(jsonResult);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: appBar(),
          body: FutureBuilder(
            future: getDeta(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                print("Connection done");
                print("item length : ${userModel.data.length}");
                return GridView.builder(
                  itemCount: userModel.data.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1, childAspectRatio: 2),
                  itemBuilder: (context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => VedioPlay(
                                            uri:
                                                "${userModel.data[index].contentDetails.videoId}",
                                          )));
                            },
                            child: Image.network(
                              userModel.data[index].snippet.thumbnails.high.url,
                              fit: BoxFit.cover,
                            )),
                      ),
                    );
                  },
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          )),
    );
  }

  appBar() {
    return AppBar(
      centerTitle: true,
      title: Text(
        "Flutter video",
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}
