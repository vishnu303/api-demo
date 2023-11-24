import 'package:api_demo/model/book.dart';
import 'package:api_demo/repo/api_call.dart';
import 'package:api_demo/screens/detail_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Books'),
          backgroundColor: Colors.green[200],
        ),
        body: FutureBuilder(
            future: ApiCall.getData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return const Text('Someting went wrong !!!');
              } else {
                BookModel books = snapshot.data!;
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        crossAxisCount: 2,
                      ),
                      itemCount: books.items!.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    DetailScreen(id: books.items![index].id!),
                              ),
                            );
                          },
                          child: Card(
                            child: GridTile(
                              footer: GridTileBar(
                                backgroundColor: Colors.black45,
                                title: Text(
                                  books.items![index].volumeInfo!.title
                                      .toString(),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              child: Image.network(
                                books.items![index].volumeInfo!.imageLinks!
                                    .thumbnail!,
                              ),
                            ),
                          ),
                        );
                      }),
                );
              }
            }));
  }
}
