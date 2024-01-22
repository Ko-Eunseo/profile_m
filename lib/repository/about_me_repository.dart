import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_mobile/model/me_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AboutMeRepository {
  AboutMeRepository();

  Supabase supabase = Supabase.instance;

  Future<List<Me>> getAboutMe() async {
    try {
      final res = await supabase.client.from('me').select();
      return [
        for (final me in res) Me.fromMap(me),
      ];
    } catch (e) {
      throw e.toString();
    }
  }
}

final aboutMeRepositoryProvider = Provider<AboutMeRepository>(
  (ref) => AboutMeRepository(),
);
