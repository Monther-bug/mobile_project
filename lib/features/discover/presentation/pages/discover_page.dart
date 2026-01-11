import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:final_mobile_project/features/discover/presentation/views/discover_view.dart';
import 'package:final_mobile_project/features/home/providers/exercise_provider.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<ExerciseProvider>();
      if (provider.exercises.isEmpty) {
        provider.fetchExercises(refresh: true);
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DiscoverView(
      searchController: _searchController,
    );
  }
}
