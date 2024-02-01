import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seru_testing_app/helper/exception.dart';
import 'package:seru_testing_app/model/area_model.dart';
import 'package:seru_testing_app/model/city_model.dart';
import 'package:seru_testing_app/model/district_model.dart';
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

class CityCubit extends Cubit<CityState> {
  CityCubit({required this.regionRepository})
      : super(const CityState());

  final RegionRepositoryAbstract regionRepository;

  Future<void> getCity(String provinceID) async {
    emit(state.copyWith(status: CityStatus.loading));
    try {
      final responseDetailProduct = await regionRepository.city(provinceID);
      emit(state.copyWith(
        status: CityStatus.success,
        model: responseDetailProduct,
      ));
    } on AppException catch (exception) {
      emit(state.copyWith(
        status: CityStatus.failure,
        exception: exception,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: CityStatus.failure,
        exception: UnknownException(message: e.toString()),
      ));
    }
  }
}

class DistrictCubit extends Cubit<DistrictState> {
  DistrictCubit({required this.regionRepository})
      : super(const DistrictState());

  final RegionRepositoryAbstract regionRepository;

  Future<void> getDistrict(String cityID) async {
    emit(state.copyWith(status: DistrictStatus.loading));
    try {
      final responseDetailProduct = await regionRepository.district(cityID);
      emit(state.copyWith(
        status: DistrictStatus.success,
        model: responseDetailProduct,
      ));
    } on AppException catch (exception) {
      emit(state.copyWith(
        status: DistrictStatus.failure,
        exception: exception,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: DistrictStatus.failure,
        exception: UnknownException(message: e.toString()),
      ));
    }
  }
}

class AreaCubit extends Cubit<AreaState> {
  AreaCubit({required this.regionRepository})
      : super(const AreaState());

  final RegionRepositoryAbstract regionRepository;

  Future<void> getArea(String districtID) async {
    emit(state.copyWith(status: AreaStatus.loading));
    try {
      final responseDetailProduct = await regionRepository.area(districtID);
      emit(state.copyWith(
        status: AreaStatus.success,
        model: responseDetailProduct,
      ));
    } on AppException catch (exception) {
      emit(state.copyWith(
        status: AreaStatus.failure,
        exception: exception,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: AreaStatus.failure,
        exception: UnknownException(message: e.toString()),
      ));
    }
  }
}
