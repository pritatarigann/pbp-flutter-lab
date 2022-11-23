import 'package:counter_7/page/drawer.dart';
import 'package:counter_7/page/watchlist_detail.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/util/fetch.dart';

class MyWatchList extends StatefulWidget {
  const MyWatchList({Key? key}) : super(key: key);

  @override
  State<MyWatchList> createState() => _MyWatchListState();
}

class _MyWatchListState extends State<MyWatchList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Watch List'),
      ),
      drawer: const NavigationDrawer(),
      body: FutureBuilder(
        future: fetchWatchList(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null){
            return const Center(child: CircularProgressIndicator());
          } else{
            if (!snapshot.hasData){
              return Column(
                children: const [
                  Text("Tidak ada Watchlist", style: TextStyle(
                    fontSize: 25
                  ),)
                ],
              );
            } else{
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (_, index) => Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: BorderSide(
                      color: ((listOfWatched[index])
                      ? Colors.blue
                      : Colors.red),
                      width: 2
                    )
                  ),
                  child: InkWell(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 10,
                          child: Container(
                            padding: const EdgeInsets.all(11.0),
                            child: Text("${snapshot.data![index].fields.title}", style: const TextStyle(
                                fontSize: 17
                            ),),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Checkbox(
                            activeColor: Colors.blue,
                            value: listOfWatched[index],
                            onChanged: (value){
                              setState(() {
                                listOfWatched[index] = !listOfWatched[index];
                              });
                            },
                          ),
                        )
                      ],
                    ),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>
                          WatchListDetail(watchListFields: snapshot.data![index].fields, status: listOfWatched[index],)));
                    },
                  )
                ),
              );
            }
          }
        },
      ),
    );
  }
}