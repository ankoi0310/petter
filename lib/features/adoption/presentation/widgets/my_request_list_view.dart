import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petter/features/adoption/presentation/bloc/adoption_bloc.dart';
import 'package:petter/features/adoption/presentation/widgets/request_card.dart';

class MyRequestListView extends StatelessWidget {
  const MyRequestListView({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<AdoptionBloc>().add(
          const AdoptionEvent.getMyAdoptionRequests(),
        );
      },
      child: BlocBuilder<AdoptionBloc, AdoptionState>(
        builder: (context, state) {
          return state.maybeWhen(
            loaded: (_, myRequests) {
              if (myRequests.isEmpty) {
                return const Center(
                  child: Text(
                    'Bạn chưa tạo yêu cầu nhận nuôi nào cả',
                  ),
                );
              }

              return ListView.separated(
                shrinkWrap: true,
                padding: const .symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                itemCount: myRequests.length,
                itemBuilder: (context, index) {
                  final request = myRequests[index];
                  return RequestCard(request: request);
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
    );
  }
}
