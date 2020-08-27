
import 'package:flutter/cupertino.dart';
import 'package:github_app/models/github_repo.dart';
import 'package:github_app/repositories/api_service.dart';

class HomeViewModel extends ChangeNotifier {

  List<GithubRepo> _repo = [];
  String query = "";

  void search() async{
    _repo = await ApiService().search(query);
    notifyListeners();
  }

  void setQuery(String _query) {
    query = _query;
  }

  int getCount(){
      return _repo.length;
  }


  List<GithubRepo> getRepo(){
      return _repo;
  }




}