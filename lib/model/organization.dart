import 'dart:convert';

List<Organization> organizationFromJson(String str) =>
    List<Organization>.from(json.decode(str).map((x) => Organization.fromJson(x)));

String organizationToJson(List<Organization> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Organization {
  final String? login;
  final int? id;
  final String? nodeId;
  final String? url;
  final String? reposUrl;
  final String? eventsUrl;
  final String? hooksUrl;
  final String? issuesUrl;
  final String? membersUrl;
  final String? publicMembersUrl;
  final String? avatarUrl;
  final String? description;

  Organization({
    this.login,
    this.id,
    this.nodeId,
    this.url,
    this.reposUrl,
    this.eventsUrl,
    this.hooksUrl,
    this.issuesUrl,
    this.membersUrl,
    this.publicMembersUrl,
    this.avatarUrl,
    this.description,
  });

  factory Organization.fromJson(Map<String, dynamic> json) => Organization(
        login: json["login"],
        id: json["id"],
        nodeId: json["node_id"],
        url: json["url"],
        reposUrl: json["repos_url"],
        eventsUrl: json["events_url"],
        hooksUrl: json["hooks_url"],
        issuesUrl: json["issues_url"],
        membersUrl: json["members_url"],
        publicMembersUrl: json["public_members_url"],
        avatarUrl: json["avatar_url"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "login": login,
        "id": id,
        "node_id": nodeId,
        "url": url,
        "repos_url": reposUrl,
        "events_url": eventsUrl,
        "hooks_url": hooksUrl,
        "issues_url": issuesUrl,
        "members_url": membersUrl,
        "public_members_url": publicMembersUrl,
        "avatar_url": avatarUrl,
        "description": description,
      };
}
