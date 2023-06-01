import 'dart:convert';

import 'package:fetchapi/models/random.dart';
import 'package:fetchapi/services/remoteservices.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // bool isLoaded = false;
  // List<Result>? results;

  // @override
  // void initState() {
  //   super.initState();
  //   // fetch api
  //   getData();

  // }

  // void getData() async {
  //   results =   RemoteServices().getdata();
  //   if (results != null) {
  //     setState(() {
  //       // isLoaded = true;
  //     });
  //   }
  // } pdf diakho

  // var n = data['result'][0]['director'][0];

  void getdata() async {
    try {
      var client = http.Client();
      var uri = Uri.parse('https://hoblist.com/api/movieList');
      var response = await client.post(uri, body: {
        'category': 'movies',
        'genre': 'all',
        'language': 'kannada',
        'sort': 'voting',
      });
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data['result'][0]['director'][0]);
        print(data['result'][0]);
        print('success nnnnnnn');
      } else {
        print('not sucess');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Fetch Data",
        ),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: ListView.builder(
          // itemCount: results?.length,
          itemCount: 2,
          itemBuilder: (context, index) {
            return Container(
              height: 180,
              // color: Colors.greenAccent,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Icon(
                            Icons.arrow_drop_up_outlined,
                            size: 40,
                          ),
                          Text("1"),
                          Icon(
                            Icons.arrow_drop_down_outlined,
                            size: 40,
                          ),
                          Text("Votes")
                        ],
                      ),
                      SizedBox(
                        width: 18,
                      ),
                      Container(
                        height: 100.0,
                        width: 70.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/bg.jpg'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 18,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "BOND 25",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text("Genre: Action,Adventure"),
                          Text("Category: Cary Joi"),
                          Text("Sort: Ana De"),
                          Text("Language: Ana De"),
                          Text(
                            "137 views | Voted by People",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 500,
                    child: ElevatedButton(
                      onPressed: getdata,
                      child: Text("Watch Trailer"),
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}

// Future<List<Result>> getData() async {
//   final response =
//       await http.post(Uri.parse('https://hoblist.com/api/movieList'));
//   var data = jsonDecode(response.body.toString());

//   if (response.statusCode == 200) {
//     for (Map<String, dynamic> index in data) {
//       result.add(Result.fromJson(index));
//     }
//     return result;
//   } else {
//     return result;
//   }
// }
