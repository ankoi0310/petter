import 'package:flutter/material.dart';
import 'package:petter/core/extensions/build_context_extension.dart';
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
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adoption Request'),
        titleSpacing: 0,
        bottom: TabBar(
          controller: _tabController,
          indicatorSize: TabBarIndicatorSize.tab,
          splashFactory: NoSplash.splashFactory,
          labelStyle: context.textTheme.bodyLarge,
          unselectedLabelStyle: context.textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.w500,
          ),
          tabs: const [
            Tab(text: 'My Requests'),
            Tab(text: 'Other Requests'),
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
