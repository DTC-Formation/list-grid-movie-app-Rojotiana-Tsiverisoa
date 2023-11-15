import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

import 'package:movie_app/colors/my_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> _items = [];

  // Fetch content from the json file
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/data/films.json');
    final data = await json.decode(response);

    setState(() {
      _items = List<Map<String, dynamic>>.from(data["items"]);
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  Widget buildCategorySection(Map<String, dynamic> category) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Category Title
        Text(
          category["categories"],
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: MyColors.c1,
            fontSize: 20,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 190,
          child: GridView(
            scrollDirection: Axis.horizontal,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            children: [
              ...category["posts"].take(5).map((post) {
                bool isLongTitle = post["title"].length >= 20;

                return TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () => {},
                  child: SizedBox(
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          ),
                          child: Image.asset(
                            post["image"],
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.8),
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                            ),
                            child: Text(
                              isLongTitle
                                  ? '${post["title"].substring(0, 20)}...'
                                  : post["title"],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: MyColors.c1,
                  padding: const EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () => {},
                child: const SizedBox(
                  child: Text(
                    'Voir Plus',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 15),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.c2,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: MyColors.c1,
                child: Image(
                  image: const AssetImage(
                    'assets/images/logo.png',
                  ),
                  fit: BoxFit.contain,
                  width: size.width,
                  height: 60,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  bottom: 15,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: _items.map((category) {
                    return buildCategorySection(category);
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
