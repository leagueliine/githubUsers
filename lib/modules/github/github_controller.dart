import 'package:crypto_count/models/github_user_model.dart';
import 'package:crypto_count/repository/github_repository.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class GithubController extends GetxController {
  final GitHubRepository githubRepository;
  GithubController({required this.githubRepository});

  final Rx<List<GithubUserModel>> _githubUsers = Rx<List<GithubUserModel>>([]);
  final Rx<GithubUserModel> _user = Rx<GithubUserModel>(GithubUserModel(
    login: "",
    avatarUrl: '',
  ));
  final RxBool _isLoading = false.obs;

  List<GithubUserModel> get githubUsers => _githubUsers.value;

  set githubUsers(List<GithubUserModel> value) {
    _githubUsers.value = value;
    _githubUsers.refresh();
  }

  GithubUserModel get user => _user.value;

  set user(GithubUserModel value) {
    _user.value = value;
    _user.refresh();
  }

  Future<void> getUser() async {
    try {
      _isLoading.value = true;

      final data = await githubRepository.getUser();

      if (data.isNotEmpty) {
        githubUsers = data
            .map(
              (e) => GithubUserModel(
                login: e.login,
                avatarUrl: e.avatarUrl,
                url: e.url,
                id: e.id,
              ),
            )
            .toList();
      }
      _isLoading.value = false;
    } catch (e) {
      throw Exception(e);
    }
  }
}
