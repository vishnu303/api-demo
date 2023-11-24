import 'package:api_demo/model/book.dart';
import 'package:api_demo/repo/api_call.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class DetailScreen extends StatelessWidget {
  final String id;
  const DetailScreen({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    var sHeight = MediaQuery.of(context).size.height;
    var sWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          title: Text('Details'),
          backgroundColor: Colors.green[200],
        ),
        body: FutureBuilder(
          future: ApiCall.getDataByid(id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const Text(" Something went wrong !!!1");
            } else {
              Item bookData = snapshot.data!;
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        bookData.volumeInfo!.imageLinks!.thumbnail!,
                        fit: BoxFit.contain,
                        width: double.infinity,
                        height: sHeight * 0.2,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: SizedBox(
                            width: sWidth,
                            child: Text(
                              bookData.volumeInfo!.title!,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: SizedBox(
                            width: sWidth,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Descripion',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  ReadMoreText(
                                    bookData.volumeInfo!.description!,
                                    trimLines: 7,
                                    colorClickableText: Colors.pink,
                                    trimMode: TrimMode.Line,
                                    trimCollapsedText: 'Show more',
                                    trimExpandedText: 'Show less',
                                    moreStyle: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                    lessStyle: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ]),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
          },
        ));
  }
}
