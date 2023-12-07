import 'package:crypto_count/models/github_user_model.dart';
import 'package:crypto_count/modules/github/github_controller.dart';
import 'package:crypto_count/repository/github_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class GithubUserView extends StatefulWidget {
  const GithubUserView({Key? key}) : super(key: key);

  @override
  State<GithubUserView> createState() => _GithubUserViewState();
}

class _GithubUserViewState extends State<GithubUserView> {
  late final GithubController _controller;

  @override
  void initState() {
    super.initState();
    _controller = GithubController(
        githubRepository:
            GitHubRepository(Dio())); // Inicialize seu controlador aqui
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Github Users'),
      ),
      body: Container(
        color: Colors.black12,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(
              6,
            ),
            child: Column(
              children: [
                FloatingActionButton(
                  child: const Icon(Icons.person_search_rounded),
                  onPressed: () async {
                    await _controller.getUser();
                    setState(() {});
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: _controller.githubUsers.length,
                    itemBuilder: (BuildContext context, int index) {
                      final GithubUserModel user =
                          _controller.githubUsers[index];
                      return SizedBox(
                        width: 70,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(Icons.add_circle_rounded),
                            const SizedBox(
                              width: 5,
                            ),
                            SizedBox(
                              height: 30,
                              child: Text(
                                '${user.login} / ${user.url}',
                                style: const TextStyle(fontSize: 18),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
