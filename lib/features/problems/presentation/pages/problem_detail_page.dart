import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../home/data/models/exercise_model.dart';
import '../../controllers/problem_controller.dart';
import '../../providers/problem_provider.dart';
import '../views/problem_detail_view.dart';

class ProblemDetailPage extends StatefulWidget {
  final Problem problem;

  const ProblemDetailPage({super.key, required this.problem});

  @override
  State<ProblemDetailPage> createState() => _ProblemDetailPageState();
}

class _ProblemDetailPageState extends State<ProblemDetailPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ProblemController _controller;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _controller = ProblemController(
      context: context,
      problem: widget.problem,
      tabController: _tabController,
    );
    _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProblemProvider>(
      builder: (context, problemProvider, child) {
        return ProblemDetailView(
          problem: _controller.getDisplayProblem(problemProvider),
          isLoading: _controller.isLoading(problemProvider),
          errorMessage: _controller.hasError(problemProvider)
              ? problemProvider.errorMessage
              : null,
          tabController: _tabController,
          onBack: _controller.goBack,
          onCodeTap: _controller.switchToSolutionTab,
          onRetry: _controller.retryFetch,
        );
      },
    );
  }
}
