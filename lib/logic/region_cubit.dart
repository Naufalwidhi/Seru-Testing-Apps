import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seru_testing_app/helper/exception.dart';
import 'package:seru_testing_app/model/province_model.dart';
import 'package:seru_testing_app/services/region_repository.dart';

part 'region_state.dart';

class ProvinceCubit extends Cubit<ProvinceState> {
  ProvinceCubit({required this.regionRepository})
      : super(const ProvinceState());

  final RegionRepositoryAbstract regionRepository;

  Future<void> getProvince() async {
    emit(state.copyWith(status: ProvinceStatus.loading));
    try {
      final responseDetailProduct = await regionRepository.province();
      emit(state.copyWith(
        status: ProvinceStatus.success,
        model: responseDetailProduct,
      ));
    } on AppException catch (exception) {
      emit(state.copyWith(
        status: ProvinceStatus.failure,
        exception: exception,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: ProvinceStatus.failure,
        exception: UnknownException(message: e.toString()),
      ));
    }
  }
}
