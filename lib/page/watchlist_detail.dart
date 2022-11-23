import 'package:counter_7/page/drawer.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String convertDatetime(datetime){
  String formattedDate = DateFormat.yMMMMd('en_US').format(datetime);
  return formattedDate;
}

class WatchListDetail extends StatelessWidget {
  final watchListFields;
  final status;
  const WatchListDetail({Key? key, required this.watchListFields, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      drawer: const NavigationDrawer(),
      body: Column(
        children: [
          Expanded(
            flex: 11,
            child: Column(
              children: [
                Center(
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    child: Text("${watchListFields.title}", textAlign: TextAlign.center, style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),),
                  ),
                ),
                Container(
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.all(7),
                    child: Text.rich(
                        TextSpan(
                            text: 'Release Date: ',
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                            children: <InlineSpan>[
                              TextSpan(
                                  text: convertDatetime(watchListFields.releaseDate),
                                  style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 17)
                              )
                            ]
                        )
                    )
                ),
                Container(
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.all(7),
                    child: Text.rich(
                        TextSpan(
                            text: 'Rating: ',
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                            children: <InlineSpan>[
                              TextSpan(
                                  text: "${watchListFields.rating.toString()}/5",
                                  style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 17)
                              )
                            ]
                        )
                    )
                ),
                Container(
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.all(7),
                    child: Text.rich(
                        TextSpan(
                            text: 'Status: ',
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                            children: <InlineSpan>[
                              TextSpan(
                                  text: status
                                      ? "watched"
                                      : "not watched",
                                  style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 17)
                              )
                            ]
                        )
                    )
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.fromLTRB(7, 7, 7, 0),
                  child: const Text("Review: ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),
                ),
                Container(
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.symmetric(horizontal: 7),
                    child: Flexible(
                      child: Text("${watchListFields.review}", style: const TextStyle(fontSize: 17),),
                    )
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.fromLTRB(7, 7, 7, 15),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Back'),
              ),
            ),
          )
        ],
      )
    );
  }
}