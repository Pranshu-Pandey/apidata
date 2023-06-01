import 'package:http/http.dart' as http;

import '../models/random.dart';

class RemoteServices {
  Future<List<Result>?> dummydata() async {
    var client = http.Client();

    var uri = Uri.parse('https://hoblist.com/api/movieList');
    var response = await client.post(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return Random.fromRawJson(json).result;
    }
  }

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
        print('success');
      } else {
        print('not sucess');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
