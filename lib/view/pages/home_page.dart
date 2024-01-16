import 'package:flutter/material.dart';
import 'package:portfolio_mobile/model/record_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final supabase = Supabase.instance.client;
  List<RecordModel>? records;
  List<dynamic> data = [];

  void getRecords() async {
    records = await supabase.from('page').select().then(
          (value) => records =
              value.map<RecordModel>((e) => RecordModel.fromMap(e)).toList(),
        );
    setState(() {});
  }

  String buttonText = '컨텐츠 추가';
  String subtitle = '프론트엔드 개발자 고은서입니다.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: records != null
              ? records!
                  .map<Widget>(
                    (record) => Text(record.title ?? 'No title'),
                  )
                  .toList()
              : [
                  Text(
                    subtitle,
                  ),
                ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getRecords,
        tooltip: buttonText,
        child: const Icon(Icons.add),
      ),
    );
  }
}
