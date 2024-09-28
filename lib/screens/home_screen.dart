import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:gitflare/controller/home_controller.dart';
import 'package:gitflare/controller/login_contoller.dart';
import 'package:gitflare/screens/login_screen.dart';
import 'package:gitflare/screens/project_view_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find<HomeController>();

    return Scaffold(
        backgroundColor: Colors.white,
        drawer: SafeArea(
          child: SizedBox(
            width: 250,
            child: Drawer(
              backgroundColor: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    const Gap(5),
                    Obx(
                      () => ListTile(
                        leading: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(image: NetworkImage(homeController.profilePic.value))),
                        ),
                        title: Text(
                          "${homeController.userName}",
                          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        subtitle: Text("${homeController.profileEmail.value ?? ""} "),
                      ),
                    ),
                    const Gap(30),
                    SizedBox(
                        height: 600,
                        child: Obx(
                          () => ListView.builder(
                            itemCount: homeController.organization?.length ?? 0,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: ListTile(
                                  leading: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.grey,
                                        image: DecorationImage(
                                            image: NetworkImage(homeController.organization?[index].avatarUrl ?? ""))),
                                  ),
                                  title: Text(
                                    homeController.organization?[index].login ?? "",
                                    style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                                  ),
                                  onTap: () async {
                                    final LoginContoller contoller = Get.find<LoginContoller>();
                                    homeController.selectedOrgDes.value =
                                        homeController.organization?[index].description ?? "";
                                    homeController.selectedOrgName.value =
                                        homeController.organization?[index].login ?? "";
                                    homeController.selectedOrgUrl.value =
                                        homeController.organization?[index].avatarUrl ?? "";

                                    homeController.fetchOrganizationRepos(contoller.githubAccessToken.value,
                                        homeController.organization?[index].login ?? "");
                                  },
                                ),
                              );
                            },
                          ),
                        )),
                    ListTile(
                      leading: const Icon(Icons.logout, color: Colors.black),
                      title: const Text(
                        'Logout',
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      onTap: () async {
                        final SharedPreferences prefs = await SharedPreferences.getInstance();
                        await prefs.remove('githubAccessToken').then((_) {
                          Get.offAll(const LoginScreen());
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text(
            "Github",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: const Color(0xff706CFF),
          actions: const [Icon(Icons.notifications)],
        ),
        body: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 100,
                  width: double.infinity,
                  color: const Color(0xff706CFF),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Obx(() => Text(
                          "Hi ${homeController.userName}",
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                        )),
                  ),
                ),
                const Gap(40),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Projects",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Expanded(
                    child: Container(
                  color: Colors.white,
                  child: Padding(
                      padding: const EdgeInsets.only(top: 0.5),
                      child: Obx(
                        () => homeController.projects!.isEmpty
                            ? const Center(child: Text("No repo Available"))
                            : ListView.builder(
                                itemCount: homeController.projects?.length ?? 0,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => ProjectViewScreen(
                                                owner: homeController.projects?[index].owner?.login ?? "",
                                                repo: homeController.projects?[index].name ?? "",
                                                avathar: homeController.selectedOrgUrl.value ?? "",
                                              ),
                                            ));
                                      },
                                      child: Container(
                                          width: double.infinity,
                                          height: 100,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            border: Border.all(color: const Color.fromARGB(255, 219, 219, 219)),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                      width: 50,
                                                      height: 50,
                                                      decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(15),
                                                          image: DecorationImage(
                                                              image: NetworkImage(
                                                                  homeController.projects?[index].owner?.avatarUrl ??
                                                                      ""))),
                                                    ),
                                                    const Gap(20),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Text(
                                                          "${homeController.projects?[index].name ?? ''} ",
                                                          style: const TextStyle(
                                                              fontWeight: FontWeight.normal,
                                                              fontSize: 18,
                                                              color: Colors.black),
                                                        ),
                                                        const Gap(5),
                                                        Text(homeController.projects?[index].owner?.login ?? '')
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                const Icon(Icons.chevron_right_rounded, size: 35)
                                              ],
                                            ),
                                          )),
                                    ),
                                  );
                                },
                              ),
                      )),
                )),
              ],
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 40),
                child: SizedBox(
                  width: double.infinity - 10,
                  height: 100,
                  child: Card(
                      color: Colors.white,
                      child: Obx(
                        () => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Gap(10),
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                        image: NetworkImage(homeController.selectedOrgUrl.value ?? ""))),
                              ),
                              const Gap(10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    " ${homeController.selectedOrgName.value}",
                                    style: const TextStyle(fontSize: 22),
                                  ),
                                  Text(" ${homeController.selectedOrgDes.value}")
                                ],
                              ),
                            ],
                          ),
                        ),
                      )),
                ),
              ),
            )
          ],
        ));
  }
}
