import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:the_movie_database/model/model.dart';
import 'package:the_movie_database/service/service.dart';

final getDataControllerProvider =
    ChangeNotifierProvider.autoDispose((ref) => GetDataController());

class GetDataController extends ChangeNotifier {
  final PagingController<int, MovieModelResults> _pagingController =
      PagingController(firstPageKey: 1);

  PagingController<int, MovieModelResults> get pagingController =>
      _pagingController;
  String _searchQuery = '';

  GetDataController() {
    _pagingController.addPageRequestListener((pageKey) {
      getMoviesPage(pageKey);
    });
  }
  void updateSearchQuery(String query) {
    _searchQuery = query;
  }

  void getMoviesPage(int pageKey) {
    ApiService<MovieModel>()
        .getMethod(
            fromJson: (json) => MovieModel.fromJson(json),
            isLoad: false,
            pageKey: pageKey)
        .then((value) {
      if (value != null) {
        if (value.results != null) {
          final movieList = value.results!;
          if (movieList.isNotEmpty) {
            if (_searchQuery.isNotEmpty) {
              final filteredMovies = movieList.where((movie) {
                return movie.title!
                    .toLowerCase()
                    .contains(_searchQuery.toLowerCase());
              }).toList();

              _pagingController.appendPage(filteredMovies, pageKey + 1);
            } else {
              _pagingController.appendPage(movieList, pageKey + 1);
            }
          } else {
            print("Filmler alınırken bir sorun oluştu.");
          }
        }
      }
    });
  }
}
/*
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_movie_database/model/model.dart';
import 'package:the_movie_database/service/service.dart';

final getDataController =
    ChangeNotifierProvider.autoDispose((ref) => GetDataController());
final scrollControllerProvider = Provider<ScrollController>((ref) {
  final scrollController = ScrollController();

  return scrollController;
});

class GetDataController extends ChangeNotifier {
  List<MovieModelResults?> moviesList = [];
  void getMovies() {
    ApiService<MovieModel>()
        .getMethod(fromJson: (json) => MovieModel.fromJson(json), isLoad: false)
        .then((value) {
      if (value != null) {
        if (value.results != null) {
          moviesList = value.results!;
          notifyListeners();
        } else {
          print("Kategoriler alınırken bir sorun oluştu.");
        }
      }
    });
  }
}

*/