import 'package:equatable/equatable.dart';
import 'package:portfolio_mobile/model/me_model.dart';
import 'package:portfolio_mobile/utils/enum.dart';

class MeState extends Equatable {
  final StateStatus meStatus;
  final List<Me> meList;
  const MeState({
    required this.meStatus,
    required this.meList,
  });

  factory MeState.init({
    List<Me>? meList,
  }) {
    return const MeState(
      meList: [],
      meStatus: StateStatus.init,
    );
  }

  MeState copyWith({
    List<Me>? meList,
    StateStatus? meStatus,
  }) {
    return MeState(
      meList: meList ?? this.meList,
      meStatus: meStatus ?? this.meStatus,
    );
  }

  @override
  List<Object?> get props => [meList];
}
