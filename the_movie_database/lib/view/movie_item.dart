import 'package:flutter/material.dart';
import 'package:grock/grock.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:the_movie_database/controller/controller.dart';
import 'package:the_movie_database/model/model.dart';
import 'package:the_movie_database/view/movie_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieItem extends ConsumerStatefulWidget {
  const MovieItem({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MovieItemState();
}

class _MovieItemState extends ConsumerState<MovieItem> {
  @override
  void initState() {
    super.initState();

    final getDataController = ref.read(getDataControllerProvider);
    getDataController.pagingController.addPageRequestListener((pageKey) {
      getDataController.getMoviesPage(pageKey);
    });
  }

  void performSearch(String query) {
    final getDataController = ref.read(getDataControllerProvider);
    getDataController.pagingController.refresh();
  }

  @override
  Widget build(BuildContext context) {
    final watch = ref.watch(getDataControllerProvider);

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Expanded(
            child: PagedGridView<int, MovieModelResults?>(
                pagingController: watch.pagingController,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 0,
                  childAspectRatio: 0.74,
                ),
                builderDelegate: PagedChildBuilderDelegate<MovieModelResults?>(
                  itemBuilder: (context, movie, index) {
                    if (movie != null) {
                      return MovieCard(
                        movie: movie,
                      );
                    } else {
                      return Container();
                    }
                  },
                )),
          ),
        ],
      ),
    ).paddingVertical(16);
  }
}

