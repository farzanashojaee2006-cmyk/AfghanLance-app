class FreelancerProfileModel {
  final String id;
  final String name;
  final String title;
  final String location;
  final String imageUrl;
  final bool isVerified;

  final double rating;
  final int completedProjects;
  final String responseTime;
  final String hourlyRate;
  final String portfolioLink;

  final String about;
  final List<String> topSkills;
  final List<String> skills;
  final List<String> portfolioImages;
  final List<String> reviews;

  const FreelancerProfileModel({
    required this.id,
    required this.name,
    required this.title,
    required this.location,
    required this.imageUrl,
    required this.isVerified,
    required this.rating,
    required this.completedProjects,
    required this.responseTime,
    required this.hourlyRate,
    required this.portfolioLink,
    required this.about,
    required this.topSkills,
    required this.skills,
    required this.portfolioImages,
    required this.reviews,
  });

  FreelancerProfileModel copyWith({
    String? id,
    String? name,
    String? title,
    String? location,
    String? imageUrl,
    bool? isVerified,
    double? rating,
    int? completedProjects,
    String? responseTime,
    String? hourlyRate,
    String? portfolioLink,
    String? about,
    List<String>? topSkills,
    List<String>? skills,
    List<String>? portfolioImages,
    List<String>? reviews,
  }) {
    return FreelancerProfileModel(
      id: id ?? this.id,
      name: name ?? this.name,
      title: title ?? this.title,
      location: location ?? this.location,
      imageUrl: imageUrl ?? this.imageUrl,
      isVerified: isVerified ?? this.isVerified,
      rating: rating ?? this.rating,
      completedProjects: completedProjects ?? this.completedProjects,
      responseTime: responseTime ?? this.responseTime,
      hourlyRate: hourlyRate ?? this.hourlyRate,
      portfolioLink: portfolioLink ?? this.portfolioLink,
      about: about ?? this.about,
      topSkills: topSkills ?? this.topSkills,
      skills: skills ?? this.skills,
      portfolioImages: portfolioImages ?? this.portfolioImages,
      reviews: reviews ?? this.reviews,
    );
  }
}