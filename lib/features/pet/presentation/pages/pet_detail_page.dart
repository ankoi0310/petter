import 'package:flutter/material.dart';
import 'package:petter/features/pet/domain/entities/pet.dart';
import 'package:petter/features/pet/presentation/widgets/bottom_action_widget.dart';
import 'package:petter/features/pet/presentation/widgets/pet_detail_description_view_more.dart';
import 'package:petter/features/pet/presentation/widgets/pet_detail_image_view.dart';
import 'package:petter/features/pet/presentation/widgets/pet_detail_overview_widget.dart';

class PetDetailPage extends StatelessWidget {
  const PetDetailPage({
    required this.id,
    required this.pet,
    super.key,
  });

  final String id;
  final Pet pet;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const .symmetric(horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: .stretch,
              spacing: 32,
              children: [
                PetDetailImageView(
                  id: pet.id,
                  imageUrl: pet.imageUrl,
                ),
                PetDetailOverviewWidget(pet: pet),
                PetDetailDescriptionViewMore(
                  description: pet.description,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const SafeArea(
        child: BottomActionWidget(),
      ),
    );
  }
}
