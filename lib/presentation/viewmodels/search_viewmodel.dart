import 'package:flutter/material.dart';
import 'package:ringo/domain/entities/song.dart';
import 'package:ringo/domain/usecase/search_usecase.dart';

class SearchViewModel extends ChangeNotifier {
  final SearchSongs usecase;

  SearchViewModel(this.usecase);

  List<Song> results = [];
  bool loading = false;

  Future<void> search(String query) async {
    loading = true;
    notifyListeners();

    results = await usecase(query);

    loading = false;
    notifyListeners();
  }
}
