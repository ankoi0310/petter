import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petter/features/adoption/presentation/bloc/adoption_bloc.dart';
import 'package:petter/features/adoption/presentation/widgets/request_card.dart';

class RequestListView extends StatefulWidget {
  const RequestListView({super.key});

  @override
  State<RequestListView> createState() => _RequestListViewState();
}

class _RequestListViewState extends State<RequestListView> {
  @override
  void initState() {
    super.initState();
    context.read<AdoptionBloc>().add(
      const AdoptionEvent.getAdoptionRequests(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdoptionBloc, AdoptionState>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (requests, _) {
            if (requests.isEmpty) {
              return const Center(
                child: Text("You don't have any adoption request"),
              );
            }

            return ListView.separated(
              shrinkWrap: true,
              padding: const .symmetric(horizontal: 16, vertical: 12),
              itemCount: requests.length,
              itemBuilder: (context, index) {
                final request = requests[index];
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
    );
  }
}
