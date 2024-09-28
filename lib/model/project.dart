// To parse this JSON data, do
//
//     final projects = projectsFromJson(jsonString);

import 'dart:convert';

List<Projects> projectsFromJson(String str) => List<Projects>.from(json.decode(str).map((x) => Projects.fromJson(x)));

String projectsToJson(List<Projects> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Projects {
  int? id;
  String? nodeId;
  String? name;
  String? fullName;
  Owner? owner;
  bool? private;
  String? htmlUrl;
  String? description;
  bool? fork;
  String? url;
  String? archiveUrl;
  String? assigneesUrl;
  String? blobsUrl;
  String? branchesUrl;
  String? collaboratorsUrl;
  String? commentsUrl;
  String? commitsUrl;
  String? compareUrl;
  String? contentsUrl;
  String? contributorsUrl;
  String? deploymentsUrl;
  String? downloadsUrl;
  String? eventsUrl;
  String? forksUrl;
  String? gitCommitsUrl;
  String? gitRefsUrl;
  String? gitTagsUrl;
  String? gitUrl;
  String? issueCommentUrl;
  String? issueEventsUrl;
  String? issuesUrl;
  String? keysUrl;
  String? labelsUrl;
  String? languagesUrl;
  String? mergesUrl;
  String? milestonesUrl;
  String? notificationsUrl;
  String? pullsUrl;
  String? releasesUrl;
  String? sshUrl;
  String? stargazersUrl;
  String? statusesUrl;
  String? subscribersUrl;
  String? subscriptionUrl;
  String? tagsUrl;
  String? teamsUrl;
  String? treesUrl;
  String? cloneUrl;
  String? mirrorUrl;
  String? hooksUrl;
  String? svnUrl;
  String? homepage;
  dynamic language;
  int? forksCount;
  int? stargazersCount;
  int? watchersCount;
  int? size;
  String? defaultBranch;
  int? openIssuesCount;
  bool? isTemplate;
  List<String>? topics;
  bool? hasIssues;
  bool? hasProjects;
  bool? hasWiki;
  bool? hasPages;
  bool? hasDownloads;
  bool? hasDiscussions;
  bool? archived;
  bool? disabled;
  String? visibility;
  DateTime? pushedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  Permissions? permissions;
  SecurityAndAnalysis? securityAndAnalysis;

  Projects({
    this.id,
    this.nodeId,
    this.name,
    this.fullName,
    this.owner,
    this.private,
    this.htmlUrl,
    this.description,
    this.fork,
    this.url,
    this.archiveUrl,
    this.assigneesUrl,
    this.blobsUrl,
    this.branchesUrl,
    this.collaboratorsUrl,
    this.commentsUrl,
    this.commitsUrl,
    this.compareUrl,
    this.contentsUrl,
    this.contributorsUrl,
    this.deploymentsUrl,
    this.downloadsUrl,
    this.eventsUrl,
    this.forksUrl,
    this.gitCommitsUrl,
    this.gitRefsUrl,
    this.gitTagsUrl,
    this.gitUrl,
    this.issueCommentUrl,
    this.issueEventsUrl,
    this.issuesUrl,
    this.keysUrl,
    this.labelsUrl,
    this.languagesUrl,
    this.mergesUrl,
    this.milestonesUrl,
    this.notificationsUrl,
    this.pullsUrl,
    this.releasesUrl,
    this.sshUrl,
    this.stargazersUrl,
    this.statusesUrl,
    this.subscribersUrl,
    this.subscriptionUrl,
    this.tagsUrl,
    this.teamsUrl,
    this.treesUrl,
    this.cloneUrl,
    this.mirrorUrl,
    this.hooksUrl,
    this.svnUrl,
    this.homepage,
    this.language,
    this.forksCount,
    this.stargazersCount,
    this.watchersCount,
    this.size,
    this.defaultBranch,
    this.openIssuesCount,
    this.isTemplate,
    this.topics,
    this.hasIssues,
    this.hasProjects,
    this.hasWiki,
    this.hasPages,
    this.hasDownloads,
    this.hasDiscussions,
    this.archived,
    this.disabled,
    this.visibility,
    this.pushedAt,
    this.createdAt,
    this.updatedAt,
    this.permissions,
    this.securityAndAnalysis,
  });

  factory Projects.fromJson(Map<String, dynamic> json) => Projects(
        id: json["id"],
        nodeId: json["node_id"],
        name: json["name"],
        fullName: json["full_name"],
        owner: json["owner"] == null ? null : Owner.fromJson(json["owner"]),
        private: json["private"],
        htmlUrl: json["html_url"],
        description: json["description"],
        fork: json["fork"],
        url: json["url"],
        archiveUrl: json["archive_url"],
        assigneesUrl: json["assignees_url"],
        blobsUrl: json["blobs_url"],
        branchesUrl: json["branches_url"],
        collaboratorsUrl: json["collaborators_url"],
        commentsUrl: json["comments_url"],
        commitsUrl: json["commits_url"],
        compareUrl: json["compare_url"],
        contentsUrl: json["contents_url"],
        contributorsUrl: json["contributors_url"],
        deploymentsUrl: json["deployments_url"],
        downloadsUrl: json["downloads_url"],
        eventsUrl: json["events_url"],
        forksUrl: json["forks_url"],
        gitCommitsUrl: json["git_commits_url"],
        gitRefsUrl: json["git_refs_url"],
        gitTagsUrl: json["git_tags_url"],
        gitUrl: json["git_url"],
        issueCommentUrl: json["issue_comment_url"],
        issueEventsUrl: json["issue_events_url"],
        issuesUrl: json["issues_url"],
        keysUrl: json["keys_url"],
        labelsUrl: json["labels_url"],
        languagesUrl: json["languages_url"],
        mergesUrl: json["merges_url"],
        milestonesUrl: json["milestones_url"],
        notificationsUrl: json["notifications_url"],
        pullsUrl: json["pulls_url"],
        releasesUrl: json["releases_url"],
        sshUrl: json["ssh_url"],
        stargazersUrl: json["stargazers_url"],
        statusesUrl: json["statuses_url"],
        subscribersUrl: json["subscribers_url"],
        subscriptionUrl: json["subscription_url"],
        tagsUrl: json["tags_url"],
        teamsUrl: json["teams_url"],
        treesUrl: json["trees_url"],
        cloneUrl: json["clone_url"],
        mirrorUrl: json["mirror_url"],
        hooksUrl: json["hooks_url"],
        svnUrl: json["svn_url"],
        homepage: json["homepage"],
        language: json["language"],
        forksCount: json["forks_count"],
        stargazersCount: json["stargazers_count"],
        watchersCount: json["watchers_count"],
        size: json["size"],
        defaultBranch: json["default_branch"],
        openIssuesCount: json["open_issues_count"],
        isTemplate: json["is_template"],
        topics: json["topics"] == null ? [] : List<String>.from(json["topics"]!.map((x) => x)),
        hasIssues: json["has_issues"],
        hasProjects: json["has_projects"],
        hasWiki: json["has_wiki"],
        hasPages: json["has_pages"],
        hasDownloads: json["has_downloads"],
        hasDiscussions: json["has_discussions"],
        archived: json["archived"],
        disabled: json["disabled"],
        visibility: json["visibility"],
        pushedAt: json["pushed_at"] == null ? null : DateTime.parse(json["pushed_at"]),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        permissions: json["permissions"] == null ? null : Permissions.fromJson(json["permissions"]),
        securityAndAnalysis:
            json["security_and_analysis"] == null ? null : SecurityAndAnalysis.fromJson(json["security_and_analysis"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "node_id": nodeId,
        "name": name,
        "full_name": fullName,
        "owner": owner?.toJson(),
        "private": private,
        "html_url": htmlUrl,
        "description": description,
        "fork": fork,
        "url": url,
        "archive_url": archiveUrl,
        "assignees_url": assigneesUrl,
        "blobs_url": blobsUrl,
        "branches_url": branchesUrl,
        "collaborators_url": collaboratorsUrl,
        "comments_url": commentsUrl,
        "commits_url": commitsUrl,
        "compare_url": compareUrl,
        "contents_url": contentsUrl,
        "contributors_url": contributorsUrl,
        "deployments_url": deploymentsUrl,
        "downloads_url": downloadsUrl,
        "events_url": eventsUrl,
        "forks_url": forksUrl,
        "git_commits_url": gitCommitsUrl,
        "git_refs_url": gitRefsUrl,
        "git_tags_url": gitTagsUrl,
        "git_url": gitUrl,
        "issue_comment_url": issueCommentUrl,
        "issue_events_url": issueEventsUrl,
        "issues_url": issuesUrl,
        "keys_url": keysUrl,
        "labels_url": labelsUrl,
        "languages_url": languagesUrl,
        "merges_url": mergesUrl,
        "milestones_url": milestonesUrl,
        "notifications_url": notificationsUrl,
        "pulls_url": pullsUrl,
        "releases_url": releasesUrl,
        "ssh_url": sshUrl,
        "stargazers_url": stargazersUrl,
        "statuses_url": statusesUrl,
        "subscribers_url": subscribersUrl,
        "subscription_url": subscriptionUrl,
        "tags_url": tagsUrl,
        "teams_url": teamsUrl,
        "trees_url": treesUrl,
        "clone_url": cloneUrl,
        "mirror_url": mirrorUrl,
        "hooks_url": hooksUrl,
        "svn_url": svnUrl,
        "homepage": homepage,
        "language": language,
        "forks_count": forksCount,
        "stargazers_count": stargazersCount,
        "watchers_count": watchersCount,
        "size": size,
        "default_branch": defaultBranch,
        "open_issues_count": openIssuesCount,
        "is_template": isTemplate,
        "topics": topics == null ? [] : List<dynamic>.from(topics!.map((x) => x)),
        "has_issues": hasIssues,
        "has_projects": hasProjects,
        "has_wiki": hasWiki,
        "has_pages": hasPages,
        "has_downloads": hasDownloads,
        "has_discussions": hasDiscussions,
        "archived": archived,
        "disabled": disabled,
        "visibility": visibility,
        "pushed_at": pushedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "permissions": permissions?.toJson(),
        "security_and_analysis": securityAndAnalysis?.toJson(),
      };
}

class Owner {
  String? login;
  int? id;
  String? nodeId;
  String? avatarUrl;
  String? gravatarId;
  String? url;
  String? htmlUrl;
  String? followersUrl;
  String? followingUrl;
  String? gistsUrl;
  String? starredUrl;
  String? subscriptionsUrl;
  String? organizationsUrl;
  String? reposUrl;
  String? eventsUrl;
  String? receivedEventsUrl;
  String? type;
  bool? siteAdmin;

  Owner({
    this.login,
    this.id,
    this.nodeId,
    this.avatarUrl,
    this.gravatarId,
    this.url,
    this.htmlUrl,
    this.followersUrl,
    this.followingUrl,
    this.gistsUrl,
    this.starredUrl,
    this.subscriptionsUrl,
    this.organizationsUrl,
    this.reposUrl,
    this.eventsUrl,
    this.receivedEventsUrl,
    this.type,
    this.siteAdmin,
  });

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        login: json["login"],
        id: json["id"],
        nodeId: json["node_id"],
        avatarUrl: json["avatar_url"],
        gravatarId: json["gravatar_id"],
        url: json["url"],
        htmlUrl: json["html_url"],
        followersUrl: json["followers_url"],
        followingUrl: json["following_url"],
        gistsUrl: json["gists_url"],
        starredUrl: json["starred_url"],
        subscriptionsUrl: json["subscriptions_url"],
        organizationsUrl: json["organizations_url"],
        reposUrl: json["repos_url"],
        eventsUrl: json["events_url"],
        receivedEventsUrl: json["received_events_url"],
        type: json["type"],
        siteAdmin: json["site_admin"],
      );

  Map<String, dynamic> toJson() => {
        "login": login,
        "id": id,
        "node_id": nodeId,
        "avatar_url": avatarUrl,
        "gravatar_id": gravatarId,
        "url": url,
        "html_url": htmlUrl,
        "followers_url": followersUrl,
        "following_url": followingUrl,
        "gists_url": gistsUrl,
        "starred_url": starredUrl,
        "subscriptions_url": subscriptionsUrl,
        "organizations_url": organizationsUrl,
        "repos_url": reposUrl,
        "events_url": eventsUrl,
        "received_events_url": receivedEventsUrl,
        "type": type,
        "site_admin": siteAdmin,
      };
}

class Permissions {
  bool? admin;
  bool? push;
  bool? pull;

  Permissions({
    this.admin,
    this.push,
    this.pull,
  });

  factory Permissions.fromJson(Map<String, dynamic> json) => Permissions(
        admin: json["admin"],
        push: json["push"],
        pull: json["pull"],
      );

  Map<String, dynamic> toJson() => {
        "admin": admin,
        "push": push,
        "pull": pull,
      };
}

class SecurityAndAnalysis {
  AdvancedSecurity? advancedSecurity;
  AdvancedSecurity? secretScanning;
  AdvancedSecurity? secretScanningPushProtection;
  AdvancedSecurity? secretScanningNonProviderPatterns;

  SecurityAndAnalysis({
    this.advancedSecurity,
    this.secretScanning,
    this.secretScanningPushProtection,
    this.secretScanningNonProviderPatterns,
  });

  factory SecurityAndAnalysis.fromJson(Map<String, dynamic> json) => SecurityAndAnalysis(
        advancedSecurity:
            json["advanced_security"] == null ? null : AdvancedSecurity.fromJson(json["advanced_security"]),
        secretScanning: json["secret_scanning"] == null ? null : AdvancedSecurity.fromJson(json["secret_scanning"]),
        secretScanningPushProtection: json["secret_scanning_push_protection"] == null
            ? null
            : AdvancedSecurity.fromJson(json["secret_scanning_push_protection"]),
        secretScanningNonProviderPatterns: json["secret_scanning_non_provider_patterns"] == null
            ? null
            : AdvancedSecurity.fromJson(json["secret_scanning_non_provider_patterns"]),
      );

  Map<String, dynamic> toJson() => {
        "advanced_security": advancedSecurity?.toJson(),
        "secret_scanning": secretScanning?.toJson(),
        "secret_scanning_push_protection": secretScanningPushProtection?.toJson(),
        "secret_scanning_non_provider_patterns": secretScanningNonProviderPatterns?.toJson(),
      };
}

class AdvancedSecurity {
  String? status;

  AdvancedSecurity({
    this.status,
  });

  factory AdvancedSecurity.fromJson(Map<String, dynamic> json) => AdvancedSecurity(
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
      };
}
