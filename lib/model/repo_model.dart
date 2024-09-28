class RepoContent {
  final String name;
  final String type;
  final String path;
  final String sha;
  final int size;
  final String downloadUrl;

  RepoContent({
    required this.name,
    required this.type,
    required this.path,
    required this.sha,
    required this.size,
    required this.downloadUrl,
  });

  factory RepoContent.fromJson(Map<String, dynamic> json) {
    return RepoContent(
      name: json['name'],
      type: json['type'],
      path: json['path'],
      sha: json['sha'],
      size: json['size'],
      downloadUrl: json['download_url'] ?? '',
    );
  }
}

class RepoDetails {
  final String name;
  final String owner;
  final String description;
  final String defaultBranch;
  final DateTime updatedAt;
  final int stars;
  final int forks;
  final int openIssues;
  final String language;
  final bool isPrivate;

  RepoDetails({
    required this.name,
    required this.owner,
    required this.description,
    required this.defaultBranch,
    required this.updatedAt,
    required this.stars,
    required this.forks,
    required this.openIssues,
    required this.language,
    required this.isPrivate,
  });

  factory RepoDetails.fromJson(Map<String, dynamic> json) {
    return RepoDetails(
      name: json['name'],
      owner: json['owner']['login'],
      description: json['description'] ?? 'No description',
      defaultBranch: json['default_branch'],
      updatedAt: DateTime.parse(json['updated_at']),
      stars: json['stargazers_count'],
      forks: json['forks_count'],
      openIssues: json['open_issues_count'],
      language: json['language'] ?? 'Not specified',
      isPrivate: json['private'],
    );
  }
}
