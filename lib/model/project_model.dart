class Project {
  final String title;
  final String description;
  final List<String> technologies;
  final List<String> screenshots;
  final String? demoVideoUrl;
  final String githubUrl;
  final String category;

  const Project({
    required this.title,
    required this.description,
    required this.technologies,
    required this.screenshots,
    this.demoVideoUrl,
    required this.githubUrl,
    required this.category,
  });
}