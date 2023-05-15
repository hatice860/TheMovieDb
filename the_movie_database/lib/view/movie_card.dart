import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:grock/grock.dart';
import 'package:the_movie_database/model/model.dart';
import 'package:the_movie_database/view/movie_detail.dart';

class MovieCard extends StatefulWidget {
  final MovieModelResults? movie;

  MovieCard({Key? key, required this.movie}) : super(key: key);

  @override
  _MovieCardState createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  final GlobalKey titleKey = GlobalKey();
  double textHeight = 0.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      calculateTextHeight();
    });
  }

  void calculateTextHeight() {
    final text = widget.movie!.title.toString();
    final style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 12,
      color: Colors.white,
    );
    final maxWidth = MediaQuery.of(context).size.width - 24;

    final textSpan = TextSpan(text: text, style: style);
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
      maxLines: 1,
    );

    textPainter.layout(maxWidth: maxWidth);
    final height = textPainter.height;

    setState(() {
      textHeight = height;
    });
  }

  double calculateBoxHeight() {
    final title = widget.movie!.title.toString();
    return title.length > 20 ? textHeight * 3.2 : textHeight * 2.5;
  }

  @override
  Widget build(BuildContext context) {
    return GrockContainer(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MovieDetail(movie: widget.movie!),
          ),
        );
      },
      child: LayoutBuilder(
        builder: (context, constraints) {
          final maxWidth = constraints.maxWidth;
          final maxHeight = constraints.maxHeight;

          return Stack(
            alignment: Alignment.center,
            children: [
              Image.network(
                'https://image.tmdb.org/t/p/original/${widget.movie!.posterPath}',
              ).borderRadius(8),
              Positioned(
                right: 5,
                top: 0,
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: const BoxDecoration(
                    color: Colors.orange,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      widget.movie!.voteAverage.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 10,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    height: calculateBoxHeight(),
                    width: maxWidth * 0.6,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6.0),
                      child: Center(
                        child: Text(
                          widget.movie!.title.toString(),
                          key: titleKey,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ).paddingHorizontal(7)),
            ],
          );
        },
      ),
    );
  }
}
