import 'dart:convert';

import 'package:aduaba_fresh/model/style_refactor.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../categories_grid.dart';

class CategoriesPage extends StatefulWidget {
  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  List categories = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchCategories();
  }

  fetchCategories() async {
    setState(() {
      isLoading = true;
    });
    var response = await http.get(
      Uri.parse(
          "https://aduabawebapi.azurewebsites.net/api/Category/GetCategories"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Charset': 'utf-8'
      },
    );
    if (response.statusCode == 200) {
      var categoryItems = json.decode(response.body);
      setState(() {
        categories = categoryItems;
        isLoading = false;
      });
    } else {
      categories = [];
      isLoading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.keyboard_backspace,
            color: Colors.black,
            size: 35.0,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(80.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    stylus('Categories', FontWeight.w700, 24,
                        textcolor: greenGrey),
                    CircleAvatar(
                      backgroundColor: primaryGreen,
                      child: IconButton(
                        icon: ImageIcon(AssetImage('assets/images/cart.png'),
                            size: 30),
                        color: white,
                        onPressed: () {
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) => Cart()));
                        },
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text('${categories.length} Categories'),
                SizedBox(
                  height: 12.0,
                ),
              ],
            ),
          ),
        ),
      ),
      //bottomNavigationBar: BottomNav(),
      body: getCategoriesListCard(),
    );
  }

  Widget getCategoriesListCard() {
    if (categories.contains(null) || categories.length < 0 || isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return categoriesListCard(categories[index]);
      },
    );
  }

  Widget categoriesListCard(item) {
    var categoryName = item['categoryName'];
    var categoryId = item['categoryId'];
    var categoryImage = item['categoryImage'];
    return Container(
      color: Colors.white,
      child: Card(
        child: ListTile(
          contentPadding: EdgeInsets.all(15),
          leading: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  categoryImage.toString(),
                ),
              ),
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                categoryName.toString(),
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
          subtitle: Text(
            '243 Items',
            style: TextStyle(
              color: Colors.grey[400],
            ),
          ),
          trailing: Icon(
            Icons.arrow_right_alt,
            size: 35.0,
            color: Colors.grey[400],
          ),
          onTap: () {
            navigateToGridPage(categoryName);
          },
        ),
      ),
    );
  }

  void navigateToGridPage(String gridTitle) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => CategoriesGrid(gridTitle)));
  }
}
