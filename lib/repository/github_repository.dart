import 'package:crypto_count/models/github_user_model.dart';
import 'package:dio/dio.dart';

class GitHubRepository {
  GitHubRepository(this.dio);
  List<GithubUserModel> user = [];
  final Dio dio;

  Future<List<GithubUserModel>> getUser() async {
    try {
      final response = await dio.get('https://api.github.com/users');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data as List<dynamic>;

        // Mapeando os dados para GithubUserModel e atribuindo à lista user
        user = data
            .map((i) => GithubUserModel.fromMap(i as Map<String, dynamic>))
            .toList();

        return user;
      }
      return user;
    } catch (e) {
      throw Exception(e);
    }
  }
}
