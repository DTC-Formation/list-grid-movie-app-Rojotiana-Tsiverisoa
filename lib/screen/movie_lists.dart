import 'package:flutter/material.dart';

import 'package:movie_app/colors/my_colors.dart';

class MoviesList extends StatefulWidget {
  final String category;
  final List<Map<String, dynamic>> movies;

  const MoviesList({super.key, required this.category, required this.movies});

  @override
  State<MoviesList> createState() => _MoviesListState();
}

class _MoviesListState extends State<MoviesList> {
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
              Text(
                widget.category,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: MyColors.c1,
                  fontSize: 25,
                  decoration: TextDecoration.underline,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  bottom: 10,
                ),
              ),
              Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              const Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  'Nos recommandations',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: MyColors.c1,
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 4,
                  right: 4,
                ),
                child: SizedBox(
                  height: 120,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          left: 4,
                          right: 4,
                        ),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15),
                          ),
                          child: Image.asset(
                            widget.movies[index]["image"],
                            fit: BoxFit.cover,
                            height: 120,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  bottom: 5,
                ),
              ),
              ],
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Les plus populaires',
                      style: TextStyle(
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
                    SizedBox(
                      width: size.width,
                      height: size.height / 2,
                      child: ListView.builder(
                        itemCount: widget.movies.length,
                        itemBuilder: (context, index) {
                          bool isLongTitle =
                              widget.movies[index]["title"].length >= 25;
                          return TextButton(
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.all(0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                              ),
                            ),
                            onPressed: () => {},
                            child: Container(
                              width: size.width,
                              color: MyColors.c2,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  right: 10,
                                  bottom: 8,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(15),
                                        ),
                                        child: Image.asset(
                                          widget.movies[index]["image"],
                                          fit: BoxFit.cover,
                                          height: 120,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            5, 0.0, 0.0, 0.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              isLongTitle
                                                  ? '${widget.movies[index]["title"].substring(0, 25)}...'
                                                  : widget.movies[index]
                                                      ["title"],
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 18,
                                                color: Colors.black,
                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 2),
                                            ),
                                            Text(
                                              '${widget.movies[index]["descri"].substring(0, 70)}...',
                                              style: const TextStyle(
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const Icon(
                                      Icons.play_circle_outlined,
                                      size: 30,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
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
