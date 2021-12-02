
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:understandprovider/bookshelf_screen.dart';


class nextpage extends StatelessWidget {
  const nextpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Center(
        child: ChangeNotifierProvider(
          create: (ctx) => Books(),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Bookshelf(),
              ),
              Consumer<Books>(
                builder: (ctx, booksData, _) => Center(
                  child:
                  Text('totalFavoriteCount: ${booksData.favoriteCount}'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
