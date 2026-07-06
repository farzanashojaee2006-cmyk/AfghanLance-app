import '../models/client_profile_model.dart';
import '../models/freelancer_profile_model.dart';

class ProfileService {
  static FreelancerProfileModel getFreelancerProfile() {
    return const FreelancerProfileModel(
      id: "",
      name: "",
      title: "",
      location: "",
      imageUrl: "assets/images/profile.png",
      isVerified: false,
      rating: 0,
      completedProjects: 0,
      responseTime: "0h",
      hourlyRate: "",
      portfolioLink: "",
      about: "",
      topSkills: [],
      skills: [],
      portfolioImages: [],
      reviews: [],
    );
  }

  static ClientProfileModel getClientProfile() {
    return const ClientProfileModel(
      id: "",
      companyName: "",
      ownerName: "",
      location: "",
      imageUrl: "assets/images/profile.png",
      isVerified: false,
      rating: 0,
      activeProjects: 0,
      totalHires: 0,
      budgetRange: "",
      about: "",
      categories: [],
      recentProjects: [],
      reviews: [],
    );
  }
}
