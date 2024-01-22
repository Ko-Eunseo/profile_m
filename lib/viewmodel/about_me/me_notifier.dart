import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_mobile/model/me_model.dart';
import 'package:portfolio_mobile/repository/about_me_repository.dart';
import 'package:portfolio_mobile/utils/enum.dart';
import 'package:portfolio_mobile/viewmodel/about_me/me_state.dart';

class MeNotifier extends StateNotifier<MeState> {
  final AboutMeRepository aboutMeRepository;

  MeNotifier(this.aboutMeRepository) : super(MeState.init());

  Future<void> getAboutMe() async {
    try {
      state = state.copyWith(meStatus: StateStatus.fetching);
      List<Me> meList = await aboutMeRepository.getAboutMe();

      state = state.copyWith(
        meList: meList,
        meStatus: StateStatus.success,
      );
    } catch (e) {
      state = state.copyWith(meStatus: StateStatus.error);
      rethrow;
    }
  }
}

final meProvider = StateNotifierProvider<MeNotifier, MeState>(
  (ref) {
    final meNotifier = MeNotifier(AboutMeRepository());
    ref.onDispose(() {
      meNotifier.dispose();
    });
    meNotifier.getAboutMe();
    return meNotifier;
  },
);
