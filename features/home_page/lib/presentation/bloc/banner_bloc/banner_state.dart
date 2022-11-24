import 'package:common/utils/state/view_data_state.dart';
import 'package:dependencies/equatable/equatable.dart';
import 'package:product/domain/entities/response/banner_data_entity.dart';

class BannerState extends Equatable {
  final ViewData<List<BannerDataEntity>> bannerState;

  BannerState({
    required this.bannerState,
  });

  BannerState copyWith({ViewData<List<BannerDataEntity>>? bannerState}) {
    return BannerState(
      bannerState: bannerState ?? this.bannerState,
    );
  }

  @override
  List<Object?> get props => [bannerState];
}
