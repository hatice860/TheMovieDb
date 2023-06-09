///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class MovieModelResults {
/*
{
  "adult": false,
  "backdrop_path": "/7cra09dpSPto2jGZlK7OMbeO90O.jpg",
  "genre_ids": [
    10749
  ],
  "id": 654374,
  "original_language": "ko",
  "original_title": "막내 처제",
  "overview": "One day, her family gathers for an offering and they worry that she's the only one without a boyfriend. Her brother-in-law, Ho-seok, sets her up on a blind date with his colleague, Min-soo, who has always been nice to him. The more she talks to Min-soo, the more Seo-ri realizes she is interested in her brother-in-law, Ho-seok. She then tries to meet up with him frequently.",
  "popularity": 306.383,
  "poster_path": "/hC9yqXygRNVDz2B9NfZocqmhczM.jpg",
  "release_date": "2019-12-08",
  "title": "The Youngest Sister-in-law",
  "video": false,
  "vote_average": 0.1,
  "vote_count": 0
} 
*/

  bool? adult;
  String? backdropPath;
  List<int?>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  MovieModelResults({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });
  MovieModelResults.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path']?.toString();
    if (json['genre_ids'] != null) {
      final v = json['genre_ids'];
      final arr0 = <int>[];
      v.forEach((v) {
        arr0.add(v.toInt());
      });
      genreIds = arr0;
    }
    id = json['id']?.toInt();
    originalLanguage = json['original_language']?.toString();
    originalTitle = json['original_title']?.toString();
    overview = json['overview']?.toString();
    popularity = json['popularity']?.toDouble();
    posterPath = json['poster_path']?.toString();
    releaseDate = json['release_date']?.toString();
    title = json['title']?.toString();
    video = json['video'];
    voteAverage = json['vote_average']?.toDouble();
    voteCount = json['vote_count']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['adult'] = adult;
    data['backdrop_path'] = backdropPath;
    if (genreIds != null) {
      final v = genreIds;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v);
      });
      data['genre_ids'] = arr0;
    }
    data['id'] = id;
    data['original_language'] = originalLanguage;
    data['original_title'] = originalTitle;
    data['overview'] = overview;
    data['popularity'] = popularity;
    data['poster_path'] = posterPath;
    data['release_date'] = releaseDate;
    data['title'] = title;
    data['video'] = video;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount;
    return data;
  }
}

class MovieModel {
/*
{
  "page": 5,
  "results": [
    {
      "adult": false,
      "backdrop_path": "/7cra09dpSPto2jGZlK7OMbeO90O.jpg",
      "genre_ids": [
        10749
      ],
      "id": 654374,
      "original_language": "ko",
      "original_title": "막내 처제",
      "overview": "One day, her family gathers for an offering and they worry that she's the only one without a boyfriend. Her brother-in-law, Ho-seok, sets her up on a blind date with his colleague, Min-soo, who has always been nice to him. The more she talks to Min-soo, the more Seo-ri realizes she is interested in her brother-in-law, Ho-seok. She then tries to meet up with him frequently.",
      "popularity": 306.383,
      "poster_path": "/hC9yqXygRNVDz2B9NfZocqmhczM.jpg",
      "release_date": "2019-12-08",
      "title": "The Youngest Sister-in-law",
      "video": false,
      "vote_average": 0.1,
      "vote_count": 0
    }
  ],
  "total_pages": 38263,
  "total_results": 765256
} 
*/

  int? page;
  List<MovieModelResults>? results;
  int? totalPages;
  int? totalResults;

  MovieModel({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });
  MovieModel.fromJson(Map<String, dynamic> json) {
    page = json['page']?.toInt();
    if (json['results'] != null) {
      final v = json['results'];
      final arr0 = <MovieModelResults>[];
      v.forEach((v) {
        arr0.add(MovieModelResults.fromJson(v));
      });
      results = arr0;
    }
    totalPages = json['total_pages']?.toInt();
    totalResults = json['total_results']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['page'] = page;
    if (results != null) {
      final v = results;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v.toJson());
      });
      data['results'] = arr0;
    }
    data['total_pages'] = totalPages;
    data['total_results'] = totalResults;
    return data;
  }
}
