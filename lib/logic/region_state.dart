part of 'region_cubit.dart';

enum ProvinceStatus {
  initial,
  loading,
  success,
  failure,
}

extension ProvinceStatusX on ProvinceStatus {
  bool get isInitial => this == ProvinceStatus.initial;
  bool get isLoading => this == ProvinceStatus.loading;
  bool get isSuccess => this == ProvinceStatus.success;
  bool get isFailure => this == ProvinceStatus.failure;
}

class ProvinceState extends Equatable {
  const ProvinceState({
    this.status = ProvinceStatus.initial,
    this.exception,
    this.model,
  });

  final ProvinceStatus status;
  final AppException? exception;
  final ProvinceModel? model;

  ProvinceState copyWith({
    ProvinceStatus? status,
    AppException? exception,
    ProvinceModel? model,
  }) {
    return ProvinceState(
      status: status ?? this.status,
      exception: exception ?? this.exception,
      model: model ?? this.model,
    );
  }

  @override
  List<Object?> get props => [
        status,
        exception,
        model,
      ];
}

// City
enum CityStatus {
  initial,
  loading,
  success,
  failure,
}

extension CityStatusX on CityStatus {
  bool get isInitial => this == CityStatus.initial;
  bool get isLoading => this == CityStatus.loading;
  bool get isSuccess => this == CityStatus.success;
  bool get isFailure => this == CityStatus.failure;
}

class CityState extends Equatable {
  const CityState({
    this.status = CityStatus.initial,
    this.exception,
    this.model,
  });

  final CityStatus status;
  final AppException? exception;
  final CityModel? model;

  CityState copyWith({
    CityStatus? status,
    AppException? exception,
    CityModel? model,
  }) {
    return CityState(
      status: status ?? this.status,
      exception: exception ?? this.exception,
      model: model ?? this.model,
    );
  }

  @override
  List<Object?> get props => [
        status,
        exception,
        model,
      ];
}

// District
enum DistrictStatus {
  initial,
  loading,
  success,
  failure,
}

extension DistrictStatusX on DistrictStatus {
  bool get isInitial => this == DistrictStatus.initial;
  bool get isLoading => this == DistrictStatus.loading;
  bool get isSuccess => this == DistrictStatus.success;
  bool get isFailure => this == DistrictStatus.failure;
}

class DistrictState extends Equatable {
  const DistrictState({
    this.status = DistrictStatus.initial,
    this.exception,
    this.model,
  });

  final DistrictStatus status;
  final AppException? exception;
  final DistrictModel? model;

  DistrictState copyWith({
    DistrictStatus? status,
    AppException? exception,
    DistrictModel? model,
  }) {
    return DistrictState(
      status: status ?? this.status,
      exception: exception ?? this.exception,
      model: model ?? this.model,
    );
  }

  @override
  List<Object?> get props => [
        status,
        exception,
        model,
      ];
}

// Area
enum AreaStatus {
  initial,
  loading,
  success,
  failure,
}

extension AreaStatusX on AreaStatus {
  bool get isInitial => this == AreaStatus.initial;
  bool get isLoading => this == AreaStatus.loading;
  bool get isSuccess => this == AreaStatus.success;
  bool get isFailure => this == AreaStatus.failure;
}

class AreaState extends Equatable {
  const AreaState({
    this.status = AreaStatus.initial,
    this.exception,
    this.model,
  });

  final AreaStatus status;
  final AppException? exception;
  final AreaModel? model;

  AreaState copyWith({
    AreaStatus? status,
    AppException? exception,
    AreaModel? model,
  }) {
    return AreaState(
      status: status ?? this.status,
      exception: exception ?? this.exception,
      model: model ?? this.model,
    );
  }

  @override
  List<Object?> get props => [
        status,
        exception,
        model,
      ];
}
