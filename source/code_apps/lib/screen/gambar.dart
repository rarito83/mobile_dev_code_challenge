import 'package:code_apps/network/data_network.dart';
import 'package:flutter/material.dart';

class Gambar extends StatefulWidget {
  const Gambar({Key? key}) : super(key: key);

  @override
  _GambarState createState() => _GambarState();
}

class _GambarState extends State<Gambar> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DataNetwork().getDataLocal(),
      builder: (context, data) {
        if (data.hasError) {
          return Center(
            child: Text("${data.error}"),
          );
        } else if (data.hasData) {
          var listAll = data.data as List<dynamic>;
          var listGambar = listAll
              .where((element) => element.attachment!.contains("image"))
              .toList();
          print("List all $listGambar");
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: ListView.builder(
              itemCount: listGambar.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 6,
                  margin: const EdgeInsets.all(4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        margin: const EdgeInsets.fromLTRB(18, 8, 6, 8),
                        child: Text("${listGambar[index].id.toString()}"),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(10, 4, 4, 4),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                "${listGambar[index].body}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              Text(
                                "${listGambar[index].attachment}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 10),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(10, 4, 4, 4),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "${listGambar[index].from}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  SizedBox(width: 8.0),
                                  Text(
                                    "to",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  SizedBox(width: 8.0),
                                  Text(
                                    "${listGambar[index].to}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ],
                              ),
                              Text(
                                "${listGambar[index].timestamp}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 10),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
