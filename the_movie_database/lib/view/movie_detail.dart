import 'package:flutter/material.dart';
import 'package:grock/grock_exports.dart';
import 'package:the_movie_database/model/model.dart';
import 'package:the_movie_database/service/service.dart';
import 'package:the_movie_database/view/home_view.dart';

class MovieDetail extends StatelessWidget {
  final MovieModelResults movie;
  ApiService apiService = ApiService();
  List<MovieModel> movieList = [];
  MovieDetail({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final baseUrl = 'https://image.tmdb.org/t/p/original/';
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Grock.to(const HomeView());
                  },
                  icon: const Icon(Icons.arrow_back_ios),
                ).paddingAll(12),
              ],
            ),
            SingleChildScrollView(
              child: Stack(
                children: [
                  Hero(
                    tag: 'movieBackdrop${movie.id}',
                    child: GrockScaleAnimation(
                      child: Container(
                        height: context.width * 0.8,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(31, 26, 25, 25)
                                  .withOpacity(0.7),
                              spreadRadius: 10,
                              blurRadius: 15,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Image.network(baseUrl + movie.backdropPath!)
                            .blur(x: 6, y: 6)
                            .paddingVertical(12),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 25,
                    child: Stack(
                      children: [
                        Hero(
                          tag: 'moviePoster${movie.id}',
                          child: Image.network(baseUrl + movie.posterPath!)
                              .borderRadius(8)
                              .size(height: 200)
                              .paddingAll(20),
                        ),
                        Positioned(
                          right: 15,
                          top: 15,
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: const BoxDecoration(
                              color: Colors.orange,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                movie.voteAverage.toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: context.width * 0.1),
            const Text("Details").paddingHorizontal(14),
            Text(movie.overview.toString()).paddingAll(14),
            Container(
              height: 1,
              width: context.width,
              decoration: const BoxDecoration(color: Colors.grey),
            ).paddingAll(14),
            const Text("Type").paddingHorizontal(14),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: 8.allBR,
                    border: Border.all(color: Colors.grey, width: 1),
                  ),
                  child: Text(movie.originalTitle.toString()).marginAll(8),
                ).paddingAll(14),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: 8.allBR,
                    border: Border.all(color: Colors.grey, width: 1),
                  ),
                  child: Text(movie.originalLanguage.toString()).marginAll(8),
                ).paddingVertical(12)
              ],
            )
          ],
        ),
      ),
    );
  }
}
