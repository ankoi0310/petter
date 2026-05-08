import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petter/core/extensions/build_context_extension.dart';
import 'package:petter/features/adoption/presentation/bloc/adoption_bloc.dart';
import 'package:petter/features/adoption/presentation/widgets/my_request_list_view.dart';
import 'package:petter/features/adoption/presentation/widgets/request_list_view.dart';

class AdoptionRequestPage extends StatefulWidget {
  const AdoptionRequestPage({super.key});

  @override
  State<AdoptionRequestPage> createState() =>
      _AdoptionRequestPageState();
}

class _AdoptionRequestPageState extends State<AdoptionRequestPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    context.read<AdoptionBloc>()
      ..add(const AdoptionEvent.getMyAdoptionRequests())
      ..add(const AdoptionEvent.getAdoptionRequests());

    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yêu cầu nhận nuôi'),
        bottom: TabBar(
          controller: _tabController,
          indicatorSize: TabBarIndicatorSize.tab,
          splashFactory: NoSplash.splashFactory,
          labelStyle: context.textTheme.titleLarge,
          unselectedLabelStyle: context.textTheme.titleLarge!
              .copyWith(fontWeight: FontWeight.w500),
          tabs: const [
            Tab(text: 'Yêu cầu của tôi'),
            Tab(text: 'Yêu cầu gửi đến'),
          ],
        ),
      ),
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: TabBarView(
            controller: _tabController,
            children: const [MyRequestListView(), RequestListView()],
          ),
        ),
      ),
    );
  }
}
