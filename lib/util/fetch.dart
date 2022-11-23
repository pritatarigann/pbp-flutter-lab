import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:counter_7/model/watchlist.dart';

// List for temporary status of watched movies
List<bool> listOfWatched = [];

Future<List<WatchList>> fetchWatchList() async {
  var url = Uri.parse("https://mykatalog.herokuapp.com/mywatchlist/json/");
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  var data = jsonDecode(utf8.decode(response.bodyBytes));

  List<WatchList> listWatchList = [];
  for (var wl in data) {
    if (wl != null){
      listWatchList.add(WatchList.fromJson(wl));
      listOfWatched.add(WatchList.fromJson(wl).fields.watched);
    }
  }

  return listWatchList;
}