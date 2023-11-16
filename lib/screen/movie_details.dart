import 'package:flutter/material.dart';

import 'package:movie_app/colors/my_colors.dart';

class MoviesDetails extends StatefulWidget {
  final Map<String, dynamic> movieDetails;
  final String category;

  const MoviesDetails(
      {super.key, required this.category, required this.movieDetails});

  @override
  State<MoviesDetails> createState() => _MoviesDetailsState();
}

class _MoviesDetailsState extends State<MoviesDetails> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.c2,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              Stack(
                children: [
                  Container(
                    height: 220,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          widget.movieDetails["image"],
                        ),
                        colorFilter: const ColorFilter.mode(
                          Color.fromARGB(122, 0, 0, 0),
                          BlendMode.darken,
                        ),
                      ),
                    ),
                  ),
                  const Positioned(
                    left: 0,
                    right: 0,
                    top: 0,
                    bottom: 0,
                    child: Icon(
                      Icons.play_circle_outlined,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.movieDetails["title"],
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: MyColors.c1,
                        fontSize: 20,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        bottom: 5,
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        text: 'Catégorie ',
                        children: [
                          const TextSpan(
                            text: '.',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(text: ' ${widget.category}'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 5,
                        bottom: 5,
                      ),
                      child: Row(
                        children: List.generate(
                          widget.movieDetails["stars"],
                          (index) => const Icon(
                            Icons.star,
                            size: 25,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      widget.movieDetails["descri"],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
