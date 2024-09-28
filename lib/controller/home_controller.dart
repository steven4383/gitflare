import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:gitflare/controller/login_contoller.dart';
import 'package:gitflare/model/Organization.dart';
import 'package:gitflare/model/project.dart';

class HomeController extends GetxController {
  RxString userName = ''.obs;
  RxString profilePic = ''.obs;
  RxString profileEmail = ''.obs;
  RxString selectedOrgName = ''.obs;
  RxString selectedOrgUrl = ''.obs;
  RxString selectedOrgDes = ''.obs;
  final Dio dio = Dio();
  RxList<Projects>? projects = RxList<Projects>();
  RxList<Organization>? organization = RxList<Organization>();

  @override
  void onInit() {
    final LoginContoller contoller = Get.find<LoginContoller>();

    fetchGitHubUsername(contoller.githubAccessToken.value)
        .then((_) => fetchGitHubOrganizations(contoller.githubAccessToken.value))
        .then((_) => fetchOrganizationRepos(contoller.githubAccessToken.value, organization?.first.login ?? ""));

    super.onInit();
  }

  Future fetchGitHubUsername(String accessToken) async {
    try {
      final response = await dio.get('https://api.github.com/user',
          options: Options(headers: {
            'Authorization': 'token $accessToken',
          }));

      if (response.statusCode == 200) {
        userName.value = response.data['login'];
        profilePic.value = response.data['avatar_url'];
        profileEmail.value = response.data['bio'];
      } else {
        log('Failed to fetch GitHub user: ${response.statusCode}');
      }
    } catch (e) {
      log('Error fetching GitHub user: $e');
      return null;
    }
  }

  Future<List<dynamic>> fetchGitHubOrganizations(String accessToken) async {
    try {
      final response = await dio.get(
        'https://api.github.com/user/orgs',
        options: Options(
          headers: {
            'Authorization': 'token $accessToken',
            'Accept': 'application/vnd.github.v3+json',
          },
        ),
      );

      if (response.statusCode == 200) {
        List<Organization>? orgList = organizationFromJson(json.encode(response.data));
        organization?.assignAll(orgList);
        selectedOrgName.value = organization?.first.login ?? "";
        selectedOrgUrl.value = organization?.first.avatarUrl ?? "";
        selectedOrgDes.value = organization?.first.description ?? "";
        return response.data;
      } else {
        log('Failed to fetch GitHub organizations: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      log('Error fetching GitHub organizations: $e');
      return [];
    }
  }

  Future<void> fetchGitHubProjects(String accessToken) async {
    try {
      final response = await dio.get(
        'https://api.github.com/users/${userName.value}/repos',
        options: Options(
          headers: {
            'Authorization': 'token $accessToken',
          },
        ),
      );

      if (response.statusCode == 200) {
        List<Projects> projectList = projectsFromJson(json.encode(response.data));
        projects?.assignAll(projectList);
      } else {
        log('Failed to fetch GitHub repositories: ${response.statusCode}');
      }
    } catch (e) {
      log('Error fetching GitHub repositories: $e');
    }
  }

  Future<void> fetchOrganizationRepos(String accessToken, String orgName) async {
    final dio = Dio();
    try {
      final response = await dio.get(
        'https://api.github.com/orgs/$orgName/repos',
        options: Options(
          headers: {
            'Authorization': 'Bearer $accessToken',
            'Accept': 'application/vnd.github.v3+json',
          },
        ),
      );

      if (response.statusCode == 200) {
        List<Projects> projectList = projectsFromJson(json.encode(response.data));
        projects?.assignAll(projectList);
      } else {
        log('Failed to fetch repositories: ${response.statusCode}');
      }
    } catch (e) {
      log('Error fetching repositories: $e');
    }
  }
}
