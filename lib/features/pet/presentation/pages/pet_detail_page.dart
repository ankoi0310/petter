import 'package:flutter/material.dart';
import 'package:petter/features/pet/presentation/widgets/bottom_action_widget.dart';
import 'package:petter/features/pet/presentation/widgets/pet_description_view_more.dart';
import 'package:petter/features/pet/presentation/widgets/pet_image_view.dart';
import 'package:petter/features/pet/presentation/widgets/pet_overview_widget.dart';

class PetDetailPage extends StatelessWidget {
  const PetDetailPage({required this.id, super.key});

  final String id;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: .symmetric(horizontal: 16, vertical: 12),
            child: Column(
              spacing: 32,
              children: [
                PetImageView(),
                PetInfoWidget(),
                PetDescriptionViewMore(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(child: BottomActionWidget()),
    );
  }
}
