class GithubRepo {
  final String name;
  final int starCount;
  final String avatarUrl;

  GithubRepo(this.name, this.starCount, this.avatarUrl);

  factory GithubRepo.fromMap(Map<String, dynamic> json) {
    return GithubRepo(
      json['name'],
      json['stargazers_count'],
      json['owner']['avatar_url'],
    );
  }

}