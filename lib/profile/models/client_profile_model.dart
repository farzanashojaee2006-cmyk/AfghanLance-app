class ClientProfileModel {
  final String id;
  final String companyName;
  final String ownerName;
  final String location;
  final String imageUrl;
  final bool isVerified;

  final double rating;
  final int activeProjects;
  final int totalHires;
  final String budgetRange;

  final String about;
  final List<String> categories;
  final List<String> recentProjects;
  final List<String> reviews;

  const ClientProfileModel({
    required this.id,
    required this.companyName,
    required this.ownerName,
    required this.location,
    required this.imageUrl,
    required this.isVerified,
    required this.rating,
    required this.activeProjects,
    required this.totalHires,
    required this.budgetRange,
    required this.about,
    required this.categories,
    required this.recentProjects,
    required this.reviews,
  });

  ClientProfileModel copyWith({
    String? id,
    String? companyName,
    String? ownerName,
    String? location,
    String? imageUrl,
    bool? isVerified,
    double? rating,
    int? activeProjects,
    int? totalHires,
    String? budgetRange,
    String? about,
    List<String>? categories,
    List<String>? recentProjects,
    List<String>? reviews,
  }) {
    return ClientProfileModel(
      id: id ?? this.id,
      companyName: companyName ?? this.companyName,
      ownerName: ownerName ?? this.ownerName,
      location: location ?? this.location,
      imageUrl: imageUrl ?? this.imageUrl,
      isVerified: isVerified ?? this.isVerified,
      rating: rating ?? this.rating,
      activeProjects: activeProjects ?? this.activeProjects,
      totalHires: totalHires ?? this.totalHires,
      budgetRange: budgetRange ?? this.budgetRange,
      about: about ?? this.about,
      categories: categories ?? this.categories,
      recentProjects: recentProjects ?? this.recentProjects,
      reviews: reviews ?? this.reviews,
    );
  }
}