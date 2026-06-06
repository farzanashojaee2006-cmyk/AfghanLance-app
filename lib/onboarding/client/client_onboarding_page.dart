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

class ClientOnboardingPage extends StatefulWidget {
  const ClientOnboardingPage({super.key});

  @override
  State<ClientOnboardingPage> createState() => _ClientOnboardingPageState();
}

class _ClientOnboardingPageState extends State<ClientOnboardingPage> {
  int step = 0;
  final int totalSteps = 5;

  String? service;
  String? budget;
  String? duration;
  String customService = "";
  String projectDetails = "";

  final TextEditingController otherServiceController = TextEditingController();

  final List<OptionItem> services = const [
    OptionItem(title: "Development", subtitle: "Apps & websites", icon: Icons.code_rounded),
    OptionItem(title: "Design", subtitle: "UI/UX & branding", icon: Icons.design_services_rounded),
    OptionItem(title: "Mobile App", subtitle: "iOS & Android", icon: Icons.phone_android_rounded),
    OptionItem(title: "Marketing", subtitle: "Growth & social", icon: Icons.trending_up_rounded),
    OptionItem(title: "Writing", subtitle: "Content & copy", icon: Icons.edit_note_rounded),
    OptionItem(title: "Other", subtitle: "Write your own", icon: Icons.add_circle_outline_rounded),
  ];

  final List<OptionItem> budgets = const [
    OptionItem(title: "\$50 - \$500", subtitle: "Small project", icon: Icons.payments_outlined),
    OptionItem(title: "\$500 - \$1000", subtitle: "Medium project", icon: Icons.account_balance_wallet_outlined),
    OptionItem(title: "\$1000+", subtitle: "Large project", icon: Icons.diamond_outlined),
  ];

  final List<OptionItem> durations = const [
    OptionItem(title: "One Time", subtitle: "Single project", icon: Icons.task_alt_rounded),
    OptionItem(title: "Long Term", subtitle: "More than 1 month", icon: Icons.timeline_rounded),
    OptionItem(title: "Ongoing", subtitle: "Continuous work", icon: Icons.autorenew_rounded),
    OptionItem(title: "Not Sure", subtitle: "Decide later", icon: Icons.help_outline_rounded),
  ];

  bool get canGoNext {
    if (step == 0) return true;
    if (step == 1) {
      if (service == "Other") return customService.trim().isNotEmpty;
      return service != null;
    }
    if (step == 2) return budget != null;
    if (step == 3) return duration != null;
    if (step == 4) return projectDetails.trim().isNotEmpty;
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
          builder: (_) => const SuccessScreen(isClient: true),
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
        builder: (_) => const HomePage(isClient: true),
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
        return "What do you need?";
      case 2:
        return "Project budget";
      case 3:
        return "Project duration";
      case 4:
        return "Project details";
      default:
        return "Review your project";
    }
  }

  String get subtitle {
    switch (step) {
      case 1:
        return "Choose the type of service you want to hire for.";
      case 2:
        return "Select your estimated budget.";
      case 3:
        return "Tell freelancers how long the work may continue.";
      case 4:
        return "Write the important details of your project.";
      default:
        return "Check your selections before continuing.";
    }
  }

  Widget buildStep() {
    switch (step) {
      case 1:
        return Column(
          key: const ValueKey("client_service"),
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
          key: const ValueKey("budget"),
          items: budgets,
          selectedItem: budget,
          onSelected: (value) {
            setState(() => budget = value);
          },
        );

      case 3:
        return SelectionList(
          key: const ValueKey("duration"),
          items: durations,
          selectedItem: duration,
          onSelected: (value) {
            setState(() => duration = value);
          },
        );

      case 4:
        return _ProjectDetailsBox(
          key: const ValueKey("project_details"),
          initialText: projectDetails,
          onChanged: (value) {
            setState(() {
              projectDetails = value;
            });
          },
        );

      default:
        return buildReview();
    }
  }

  Widget buildReview() {
    return Column(
      key: const ValueKey("client_review"),
      children: [
        ReviewTile(
          title: "Service",
          value: finalService,
          icon: Icons.work_outline_rounded,
        ),
        ReviewTile(
          title: "Budget",
          value: budget ?? "-",
          icon: Icons.payments_outlined,
        ),
        ReviewTile(
          title: "Duration",
          value: duration ?? "-",
          icon: Icons.timeline_rounded,
        ),
        ReviewTile(
          title: "Project details",
          value: projectDetails.isEmpty ? "-" : projectDetails,
          icon: Icons.notes_rounded,
        ),
      ],
    );
  }

  @override
  void dispose() {
    otherServiceController.dispose();
    super.dispose();
  }
}

class _ProjectDetailsBox extends StatefulWidget {
  final String initialText;
  final ValueChanged<String> onChanged;

  const _ProjectDetailsBox({
    super.key,
    required this.initialText,
    required this.onChanged,
  });

  @override
  State<_ProjectDetailsBox> createState() => _ProjectDetailsBoxState();
}

class _ProjectDetailsBoxState extends State<_ProjectDetailsBox> {
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
          hintText: "Write your project details here...",
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