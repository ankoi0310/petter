import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petter/core/extensions/build_context_extension.dart';
import 'package:petter/core/extensions/date_time_extension.dart';
import 'package:petter/core/gen/assets.gen.dart';
import 'package:petter/features/adoption/presentation/bloc/adoption_bloc.dart';

class AdoptionRequestPage extends StatefulWidget {
  const AdoptionRequestPage({super.key});

  @override
  State<AdoptionRequestPage> createState() =>
      _AdoptionRequestPageState();
}

class _AdoptionRequestPageState extends State<AdoptionRequestPage> {
  @override
  void initState() {
    super.initState();
    context.read<AdoptionBloc>().add(
      const AdoptionEvent.getAdoptionRequests(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adoption Request'),
        titleSpacing: 0,
      ),
      body: SafeArea(
        child: BlocBuilder<AdoptionBloc, AdoptionState>(
          builder: (context, state) {
            return state.maybeWhen(
              loaded: (requests) {
                if (requests.isEmpty) {
                  return const Center(
                    child: Text(
                      "You don't have any adoption request",
                    ),
                  );
                }

                return ListView.separated(
                  shrinkWrap: true,
                  padding: const .symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  itemCount: requests.length,
                  itemBuilder: (context, index) {
                    final request = requests[index];
                    return Container(
                      padding: const .symmetric(
                        horizontal: 12,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: context.colors.primaryContainer,
                        borderRadius: .circular(24),
                      ),
                      child: IntrinsicHeight(
                        child: Row(
                          spacing: 8,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: .all(
                                  color: context.colors.primary,
                                  width: 2,
                                ),
                                borderRadius: .circular(12),
                              ),
                              child: ClipRRect(
                                borderRadius: .circular(12),
                                child: Assets.images.pets.pet0.image(
                                  width: 120,
                                  height: 120,
                                  fit: .cover,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                spacing: 4,
                                children: [
                                  Row(
                                    spacing: 4,
                                    children: [
                                      Text(
                                        request.petName,
                                        style: context
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                              fontWeight: .bold,
                                            ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    spacing: 4,
                                    mainAxisAlignment: .spaceBetween,
                                    children: [
                                      const Text('Adopter:'),
                                      Text(
                                        request.adopterName,
                                        style: context
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                              fontWeight: .bold,
                                            ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    spacing: 4,
                                    mainAxisAlignment: .spaceBetween,
                                    children: [
                                      const Text('Phone:'),
                                      Text(
                                        request.adopterPhone,
                                        style: context
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                              fontWeight: .bold,
                                            ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    spacing: 4,
                                    mainAxisAlignment: .spaceBetween,
                                    children: [
                                      const Text('Created at:'),
                                      Text(
                                        request
                                            .createdAt
                                            .fullTimeDate,
                                        style: context
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                              fontWeight: .bold,
                                            ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    spacing: 4,
                                    mainAxisAlignment: .spaceBetween,
                                    children: [
                                      const Text('Status:'),
                                      Text(
                                        request.status.name,
                                        style: context
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                              fontWeight: .bold,
                                            ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 16);
                  },
                );
              },
              orElse: () => const SizedBox(),
            );
          },
        ),
      ),
    );
  }
}
