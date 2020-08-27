import 'package:dio/dio.dart';
import 'package:github_app/models/github_repo.dart';

class ApiService {
  var dio = new Dio();
  var url = 'https://api.github.com/search/repositories?sort=stars&q=';

  Future<List<GithubRepo>> search(String q) async{
    final response = await dio.get(url + q);

    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result['items'];
      return list.map((repo) => GithubRepo.fromMap(repo)).toList();
    } else {
      throw Exception("failed to get repo");
    }

  }

}