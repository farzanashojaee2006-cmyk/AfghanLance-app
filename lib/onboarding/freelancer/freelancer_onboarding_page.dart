import 'package:flutter/material.dart';
import '../../Home.dart';
import '../success_screen.dart';
import '../widgets/onboarding_background.dart';
import '../widgets/onboarding_header.dart';
import '../widgets/onboarding_button.dart';
import '../widgets/onboarding_welcome.dart';
import '../widgets/option_grid.dart';
import '../widgets/other_input_box.dart';
import '../widgets/selected_summary_box.dart';
import '../widgets/selection_list.dart';
import '../widgets/skill_selector.dart';

class FreelancerOnboardingPage extends StatefulWidget {
  const FreelancerOnboardingPage({super.key});

  @override
  State<FreelancerOnboardingPage> createState() =>
      _FreelancerOnboardingPageState();
}

class _FreelancerOnboardingPageState extends State<FreelancerOnboardingPage> {
  int step = 0;
  final int totalSteps = 5;

  String? service;
  String? experience;
  String customService = "";
  String bio = "";

  final List<String> skills = [];

  final TextEditingController otherServiceController = TextEditingController();
  final TextEditingController otherSkillController = TextEditingController();

  final List<OptionItem> services = const [
    OptionItem(title: "Development", subtitle: "Apps & websites", icon: Icons.code_rounded),
    OptionItem(title: "Design", subtitle: "UI/UX & branding", icon: Icons.design_services_rounded),
    OptionItem(title: "Marketing", subtitle: "Growth & social", icon: Icons.trending_up_rounded),
    OptionItem(title: "Writing", subtitle: "Content & copy", icon: Icons.edit_note_rounded),
    OptionItem(title: "Video Editing", subtitle: "Reels & videos", icon: Icons.movie_creation_outlined),
    OptionItem(title: "Other", subtitle: "Write your own", icon: Icons.add_circle_outline_rounded),
  ];

  final List<OptionItem> experiences = const [
    OptionItem(title: "Beginner", subtitle: "Starting out", icon: Icons.spa_outlined),
    OptionItem(title: "Intermediate", subtitle: "Some experience", icon: Icons.rocket_launch_outlined),
    OptionItem(title: "Expert", subtitle: "Professional level", icon: Icons.workspace_premium_outlined),
  ];

  final List<OptionItem> skillOptions = const [
    OptionItem(title: "Flutter", subtitle: "Mobile apps", icon: Icons.phone_android_rounded),
    OptionItem(title: "Firebase", subtitle: "Backend & auth", icon: Icons.cloud_outlined),
    OptionItem(title: "Figma", subtitle: "UI design", icon: Icons.brush_outlined),
    OptionItem(title: "React", subtitle: "Web apps", icon: Icons.web_rounded),
    OptionItem(title: "Laravel", subtitle: "Backend web", icon: Icons.layers_rounded),
    OptionItem(title: "Other", subtitle: "Add skill", icon: Icons.add_circle_outline_rounded),
  ];

  bool get canGoNext {
    if (step == 0) return true;
    if (step == 1) {
      if (service == "Other") return customService.trim().isNotEmpty;
      return service != null;
    }
    if (step == 2) return experience != null;
    if (step == 3) return skills.isNotEmpty;
    if (step == 4) return bio.trim().isNotEmpty;
    return true;
  }

  String get finalService {
    if (service == "Other") return customService;
    return service ?? "-";
  }

  void nextStep() {
    if (!canGoNext) return;

    if (step < totalSteps) {
      setState(() => step++);
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const SuccessScreen(isClient: false),
        ),
      );
    }
  }

  void previousStep() {
    if (step > 0) {
      setState(() => step--);
    } else {
      Navigator.pop(context);
    }
  }

  void skipToHome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const HomePage(isClient: false),
      ),
    );
  }

  void selectService(String value) {
    setState(() {
      service = value;
      if (value != "Other") {
        customService = "";
        otherServiceController.clear();
      }
    });
  }

  void saveOtherService() {
    final text = otherServiceController.text.trim();
    if (text.isEmpty) return;

    FocusScope.of(context).unfocus();

    setState(() {
      service = "Other";
      customService = text;
    });
  }

  void toggleSkill(String value) {
    setState(() {
      if (skills.contains(value)) {
        skills.remove(value);
      } else {
        skills.add(value);
      }
    });
  }

  void addOtherSkill() {
    final text = otherSkillController.text.trim();
    if (text.isEmpty) return;

    FocusScope.of(context).unfocus();

    setState(() {
      if (!skills.contains(text)) {
        skills.add(text);
      }
      otherSkillController.clear();
    });
  }

  void removeSkill(String value) {
    setState(() {
      skills.remove(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: step == 0
                ? OnboardingWelcome(onStart: nextStep)
                : Column(
              children: [
                OnboardingHeader(
                  currentStep: step,
                  totalSteps: totalSteps,
                  title: title,
                  subtitle: subtitle,
                  onBack: previousStep,
                ),
                const SizedBox(height: 26),
                Expanded(
                  child: SingleChildScrollView(
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 250),
                      child: buildStep(),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                OnboardingButton(
                  text: step == totalSteps ? "Finish Setup" : "Next",
                  enabled: canGoNext,
                  onPressed: nextStep,
                ),
                const SizedBox(height: 18),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String get title {
    switch (step) {
      case 1:
        return "What do you do best?";
      case 2:
        return "Your experience";
      case 3:
        return "Select your skills";
      case 4:
        return "About you";
      default:
        return "Review your profile";
    }
  }

  String get subtitle {
    switch (step) {
      case 1:
        return "Choose the field that matches your main service.";
      case 2:
        return "Choose the level that best describes you.";
      case 3:
        return "Pick your main skills. You can add your own skill too.";
      case 4:
        return "Introduce yourself and your experience.";
      default:
        return "Check your selections before continuing.";
    }
  }

  Widget buildStep() {
    switch (step) {
      case 1:
        return Column(
          key: const ValueKey("freelancer_service"),
          children: [
            OptionGrid(
              items: services,
              selectedItem: service,
              onSelected: selectService,
            ),
            if (service == "Other")
              OtherInputBox(
                controller: otherServiceController,
                hint: "Write your service...",
                buttonText: "Save",
                onSave: saveOtherService,
              ),
            if (service == "Other" && customService.isNotEmpty)
              SelectedSummaryBox(
                title: "You wrote",
                items: [customService],
              ),
            if (service != null && service != "Other")
              SelectedSummaryBox(
                title: "Selected service",
                items: [service!],
              ),
          ],
        );

      case 2:
        return SelectionList(
          key: const ValueKey("experience"),
          items: experiences,
          selectedItem: experience,
          onSelected: (value) {
            setState(() => experience = value);
          },
        );

      case 3:
        return SkillSelector(
          key: const ValueKey("skills"),
          skills: skillOptions,
          selectedSkills: skills,
          otherController: otherSkillController,
          onToggle: toggleSkill,
          onAddOther: addOtherSkill,
          onRemove: removeSkill,
        );

      case 4:
        return _BioBox(
          key: const ValueKey("bio_box"),
          initialText: bio,
          onChanged: (value) {
            setState(() {
              bio = value;
            });
          },
        );

      default:
        return buildReview();
    }
  }

  Widget buildReview() {
    return Column(
      key: const ValueKey("freelancer_review"),
      children: [
        ReviewTile(
          title: "Field",
          value: finalService,
          icon: Icons.work_outline_rounded,
        ),
        ReviewTile(
          title: "Experience",
          value: experience ?? "-",
          icon: Icons.rocket_launch_outlined,
        ),
        ReviewTile(
          title: "Skills",
          value: skills.isEmpty ? "-" : skills.join(" • "),
          icon: Icons.star_outline_rounded,
        ),
        ReviewTile(
          title: "About me",
          value: bio.isEmpty ? "-" : bio,
          icon: Icons.person_outline_rounded,
        ),
      ],
    );
  }

  @override
  void dispose() {
    otherServiceController.dispose();
    otherSkillController.dispose();
    super.dispose();
  }
}

class _BioBox extends StatefulWidget {
  final String initialText;
  final ValueChanged<String> onChanged;

  const _BioBox({
    super.key,
    required this.initialText,
    required this.onChanged,
  });

  @override
  State<_BioBox> createState() => _BioBoxState();
}

class _BioBoxState extends State<_BioBox> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.initialText);
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
        borderRadius: BorderRadius.circular(26),
        border: Border.all(
          color: isDark ? Colors.white12 : Colors.black12,
        ),
      ),
      child: TextField(
        controller: controller,
        maxLines: 10,
        minLines: 8,
        onChanged: widget.onChanged,
        style: TextStyle(
          color: isDark ? Colors.white : Colors.black,
          fontSize: 15,
          height: 1.5,
        ),
        decoration: InputDecoration(
          hintText: "Tell clients about yourself...",
          hintStyle: TextStyle(
            color: isDark ? Colors.white38 : Colors.black38,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class ReviewTile extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const ReviewTile({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    const accent = Color(0xFF1D837F);

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: isDark ? Colors.white10 : Colors.black12,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(isDark ? .18 : .05),
            blurRadius: 18,
            offset: const Offset(0, 9),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 23,
            backgroundColor: accent.withOpacity(.12),
            child: Icon(icon, color: accent),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: isDark ? Colors.white54 : Colors.black45,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.35,
                    fontWeight: FontWeight.w800,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}