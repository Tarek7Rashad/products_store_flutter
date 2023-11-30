import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
import 'package:product_store/pages/homePage.dart';
import 'package:product_store/pages/updatePage.dart';

void main() {
  runApp(const ProductStore());
}

class ProductStore extends StatelessWidget {
  const ProductStore({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.id,
      routes: {
        HomePage.id: (context) => const HomePage(),
        UpdatePage.id: (context) => UpdatePage(),
      },
    );
  }
}

        // floatingActionButton: FloatingActionButton(
        //   onPressed: () async {
        //     http.Response response =
        //         await http.post(Uri.parse('https://fakestoreapi.com/products'),
        //             body: ({
        //               'title': 'test product',
        //               "price": '13.5',
        //               'description': ' lorem ipsum set',
        //               'image': 'https://i.pravatar.cc',
        //               'category': ' electronic'
        //             }),
        //             headers: {
        //           'Accept': 'application/json',
        //           "Content-Type": 'application/x-www-form-urlencoded',
                  
        //         });
        //     print(response.body);
        //   },
        //   child: Icon(Icons.add),
        // ),