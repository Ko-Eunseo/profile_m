import 'package:flutter/material.dart';
import 'package:portfolio_mobile/model/me_model.dart';
import 'package:portfolio_mobile/utils/enum.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_mobile/viewmodel/about_me/me_notifier.dart';

class HomePage extends ConsumerWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(meProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('은서의 포트폴리오'),
        centerTitle: true,
      ),
      body: state.meStatus == StateStatus.fetching
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : state.meList.isEmpty
              ? const Text('No data available')
              : ListMe(
                  about: state.meList,
                ),
    );
  }
}

class ListMe extends StatelessWidget {
  const ListMe({
    super.key,
    required this.about,
  });
  final List<Me> about;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          final me = about[index];
          return ListTile(
            title: Text(me.title!),
            subtitle: Text(me.description!),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider();
        },
        itemCount: about.length);
  }
}
