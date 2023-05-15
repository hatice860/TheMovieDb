import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grock/grock.dart';
import 'package:the_movie_database/controller/controller.dart';

class SearchWidget extends ConsumerStatefulWidget {
  const SearchWidget({super.key});

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends ConsumerState<SearchWidget> {
  bool _isSearching = false;
  String _searchQuery = '';

  void _toggleSearch() {
    setState(() {
      _isSearching = !_isSearching;
      _searchQuery = '';
    });
  }

  void _performSearch(String query) {
    final getDataController = ref.read(getDataControllerProvider);
    getDataController.updateSearchQuery(query);
    getDataController.pagingController.refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          elevation: 0,
          backgroundColor: Color.fromARGB(19, 56, 54, 54),
          toolbarHeight: context.width * 0.2,
          title: _isSearching
              ? TextField(
                  onChanged: (query) {
                    setState(() {
                      _searchQuery = query;
                    });
                    if (query.length >= 2) {
                      _performSearch(query);
                    }
                  },
                  onSubmitted: (query) {
                    _performSearch(query);
                  },
                  decoration: InputDecoration(
                      hintText: 'Arama yapın...',
                      prefixIcon: IconButton(
                        icon: const Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          _performSearch(_searchQuery);
                        },
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          _performSearch(_searchQuery);
                        },
                      ),
                      contentPadding: 10.allP,
                      filled: true,
                      fillColor: const Color.fromARGB(50, 105, 105, 105),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide.none)),
                )
              : const Center(child: Text('The Movie DB')),
          actions: [
            IconButton(
              icon: Icon(_isSearching ? Icons.close : Icons.search),
              onPressed: _toggleSearch,
            ),
          ],
        )
      ],
    );
  }
}
