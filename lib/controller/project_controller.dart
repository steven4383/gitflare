import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:gitflare/controller/login_contoller.dart';
import 'package:gitflare/model/repo_model.dart';

class RepoDetailsController extends GetxController {
  final Rx<RepoDetails?> repoDetails = Rx<RepoDetails?>(null);
  final RxList<String> branches = <String>[].obs;
  final RxList<RepoContent> contents = <RepoContent>[].obs;
  final RxBool isLoading = true.obs;
  final RxString currentBranch = ''.obs;

  Future<void> fetchRepoDetails(String owner, String repo) async {
    try {
      final LoginContoller controller = Get.find<LoginContoller>();
      final dio = Dio();
      final response = await dio.get(
        'https://api.github.com/repos/$owner/$repo',
        options: Options(
          headers: {
            'Authorization': 'Bearer ${controller.githubAccessToken}',
            'Accept': 'application/vnd.github.v3+json',
          },
        ),
      );

      if (response.statusCode == 200) {
        repoDetails.value = RepoDetails.fromJson(response.data);
        currentBranch.value = repoDetails.value!.defaultBranch;
        await fetchBranches(owner, repo);
        await fetchContents(owner, repo, currentBranch.value);
      } else {
        throw Exception('Failed to load repo details');
      }
    } catch (e) {
      log('Error fetching repo details: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchBranches(String owner, String repo) async {
    try {
      final LoginContoller controller = Get.find<LoginContoller>();
      final dio = Dio();
      final response = await dio.get(
        'https://api.github.com/repos/$owner/$repo/branches',
        options: Options(
          headers: {
            'Authorization': 'Bearer ${controller.githubAccessToken}',
            'Accept': 'application/vnd.github.v3+json',
          },
        ),
      );

      if (response.statusCode == 200) {
        branches.value = (response.data as List).map((branch) => branch['name'] as String).toList();
      } else {
        throw Exception('Failed to load branches');
      }
    } catch (e) {
      log('Error fetching branches: $e');
    }
  }

  Future<void> fetchContents(String owner, String repo, String branch, {String path = ''}) async {
    try {
      final LoginContoller controller = Get.find<LoginContoller>();
      final dio = Dio();
      final response = await dio.get(
        'https://api.github.com/repos/$owner/$repo/contents/$path',
        options: Options(
          headers: {
            'Authorization': 'Bearer ${controller.githubAccessToken}',
            'Accept': 'application/vnd.github.v3+json'
          },
        ),
        queryParameters: {'ref': branch},
      );

      if (response.statusCode == 200) {
        contents.value = (response.data as List).map((content) => RepoContent.fromJson(content)).toList();
      } else {
        throw Exception('Failed to load contents');
      }
    } catch (e) {
      log('Error fetching contents: $e');
    }
  }
}
