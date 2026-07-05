class ProjectModel {
  final String title;
  final String company;
  final String budget;
  final String time;
  final List tags;
  final int proposals;

  ProjectModel({
    required this.title,
    required this.company,
    required this.budget,
    required this.time,
    required this.tags,
    required this.proposals,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      title: json['title'] ?? '',
      company: json['company'] ?? '',
      budget: json['budget'] ?? '',
      time: json['time'] ?? '',
      tags: List.from(json['tags'] ?? []),
      proposals: (json['proposals'] as num).toInt(),
    );
  }
}