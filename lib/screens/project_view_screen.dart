import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:gitflare/controller/project_controller.dart';
import 'package:intl/intl.dart';
import '../model/repo_model.dart';

class ProjectViewScreen extends StatelessWidget {
  final String owner;
  final String repo;
  final String avathar;

  ProjectViewScreen({
    super.key,
    required this.owner,
    required this.repo,
    required this.avathar,
  }) {
    final controller = Get.put(RepoDetailsController());
    controller.fetchRepoDetails(owner, repo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xff706CFF),
        title: const Text('Project', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: GetX<RepoDetailsController>(
        builder: (controller) {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else if (controller.repoDetails.value == null) {
            return const Center(child: Text('Failed to load repository details'));
          } else {
            final details = controller.repoDetails.value!;
            return Column(
              children: [
                _buildProjectHeader(details),
                const Gap(10),
                _buildBranchSelector(controller),
                Expanded(child: _buildFileList(controller)),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _buildProjectHeader(RepoDetails details) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: const Color(0xff706CFF),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(image: NetworkImage(avathar ?? ""))),
              ),
              const Gap(10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    details.name,
                    style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const Gap(2),
                  Text(
                    details.owner,
                    style: const TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ],
          ),
          const Gap(5),
          Text(
            'Last update: ${DateFormat.yMMMEd().format(details.updatedAt)}',
            style: const TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }

  Widget _buildBranchSelector(RepoDetailsController controller) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        itemCount: controller.branches.length,
        itemBuilder: (context, index) {
          return _branchChip(
            controller.branches[index],
            isSelected: controller.currentBranch.value == controller.branches[index],
            onTap: () {
              controller.currentBranch.value = controller.branches[index];
              controller.fetchContents(owner, repo, controller.currentBranch.value);
            },
          );
        },
      ),
    );
  }

  Widget _branchChip(String label, {bool isSelected = false, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        margin: const EdgeInsets.only(right: 8),
        child: Chip(
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
          side: const BorderSide(width: 0, color: Colors.white),
          label: Text(label),
          backgroundColor: isSelected ? const Color(0xff27274A) : Colors.grey[300],
          labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.black),
        ),
      ),
    );
  }

  Widget _buildFileList(RepoDetailsController controller) {
    return ListView.builder(
      itemCount: controller.contents.length,
      itemBuilder: (context, index) {
        final content = controller.contents[index];
        return ListTile(
          leading: Icon(
            content.type == 'file' ? Icons.insert_drive_file : Icons.folder,
            color: content.type == 'file' ? Colors.blue : Colors.amber,
          ),
          title: Text(content.name),
          onTap: content.type == 'dir'
              ? () {
                  controller.fetchContents(owner, repo, controller.currentBranch.value, path: content.path);
                }
              : null,
        );
      },
    );
  }
}
