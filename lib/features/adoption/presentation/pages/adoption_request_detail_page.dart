import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:petter/core/utils/show_snack_bar.dart';
import 'package:petter/features/adoption/domain/entities/adoption_request.dart';
import 'package:petter/features/adoption/presentation/bloc/adoption_bloc.dart';
import 'package:petter/features/adoption/presentation/widgets/adopter_info_section.dart';
import 'package:petter/features/adoption/presentation/widgets/adoption_request_detail_bottom_bar.dart';
import 'package:petter/features/adoption/presentation/widgets/adoption_request_info_section.dart';
import 'package:petter/features/adoption/presentation/widgets/pet_info_section.dart';

class AdoptionRequestDetailPage extends StatelessWidget {
  const AdoptionRequestDetailPage({required this.request, super.key});

  final AdoptionRequest request;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AdoptionBloc, AdoptionState>(
      listener: (context, state) {
        state.maybeWhen(
          updateRequestSuccess: () {
            showSnackBar(
              context,
              content: 'Cập nhật yêu cầu thành công',
            );
            context.pop();
          },
          error: (message) {
            showSnackBar(context, content: message);
          },
          orElse: () {},
        );
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Adoption Request Detail')),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const .symmetric(vertical: 8),
            child: Column(
              crossAxisAlignment: .stretch,
              spacing: 16,
              children: [
                PetInfoSection(request: request),
                AdopterInfoSection(request: request),
                AdoptionRequestInfoSection(request: request),
              ],
            ),
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const .symmetric(horizontal: 16, vertical: 12),
            child: AdoptionRequestDetailBottomBar(request: request),
          ),
        ),
      ),
    );
  }
}
