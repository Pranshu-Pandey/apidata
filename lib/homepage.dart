import 'dart:convert';

import 'package:fetchapi/companyinfo.dart';
import 'package:fetchapi/models/random.dart';
import 'package:fetchapi/services/remoteservices.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var apiData;

  Future<void> fetchData() async {
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
        setState(() {
          apiData = data;
        });
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

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
  // } p

  // var n = data['result'][0]['director'][0];

  // Future<dynamic> getdata() async {
  //   try {
  //     var client = http.Client();
  //     var uri = Uri.parse('https://hoblist.com/api/movieList');
  //     var response = await client.post(uri, body: {
  //       'category': 'movies',
  //       'genre': 'all',
  //       'language': 'kannada',
  //       'sort': 'voting',
  //     });
  //     if (response.statusCode == 200) {
  //       var data = jsonDecode(response.body.toString());
  //       print(data['result'][0]['director'][0]);
  //       print(data['result'][0]);
  //       print('success nnnnnnn');
  //       return data;
  //     } else {
  //       print('not sucess');
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  void handleClick(int item) {
    switch (item) {
      case 0:
        break;
      case 1:
        break;
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
          PopupMenuButton<int>(
            onSelected: (item) => handleClick(item),
            itemBuilder: (context) => [
              PopupMenuItem<int>(
                  value: 1,
                  child: GestureDetector(
                    child: Text('Company Info'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CompanyInfo()),
                      );
                    },
                  )),
            ],
          ),
        ],
      ),
      body: ListView.builder(
          // itemCount: results?.length,
          itemCount: apiData['result'].length,
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
                          Text('1'),
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
                            image: NetworkImage(
                                apiData['result'][index]['poster']),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              apiData['result'][index]['director'][0],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text("Genre: " + apiData['result'][index]['genre']),
                            Text("Category: Cary Joi"),
                            Text(
                              "Stars:" + apiData['result'][index]['stars'][0],
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text("Language: Ana De"),
                            Text(
                              "137 views | Voted by People",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 500,
                    child: ElevatedButton(
                      onPressed: () {},
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
