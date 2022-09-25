//before let's add the http package.
import 'dart:convert';

import 'package:http/http.dart';
import 'package:soccer_tutorial/models/soccer_model.dart';

class SoccerApi {
  //Now let's set our variables.
  //First : let's add the endpoint URL.
  //We will get all the data from api-sport.io.

  final String apiUrl =
      "https://v3.football.api-sports.io/fixtures?season=2022&league=39";
  //In our tutorial we will only see how to get the live matches.
  //Make sure to read the api documentation to be ables too understand it.
  // static const api_key = "445ad951acd40e0d5f81b4ebe4141048";
  //You will find your api key in your dashboard.
  //so create your account it's free.
  //Now let's add the headers.
  static const headers = {
    'x-rapidapi-host': 'v3.football.api-sports.io',
    'x-rapidapi-key': "d90055d4df184b3a261cdf8920e95916"
  };

  //Now we will create our method.SoccerApi
  //but before this we need to create our model.

  //Now we finished with our Model
  Future<List<SoccerMatch>?> getAllMatches() async {
    Response res = await get(Uri.parse(apiUrl), headers: headers);
    var body;

    if (res.statusCode == 200) {
      // this mean that we are connected to the data base
      body = jsonDecode(res.body);
      List<dynamic> matchesList = body['response'];
      print("Api service: ${body}"); // to debug
      List<SoccerMatch> matches = matchesList
          .map((dynamic item) => SoccerMatch.fromJson(item))
          .toList();

      return matches;
    }
  }
}
