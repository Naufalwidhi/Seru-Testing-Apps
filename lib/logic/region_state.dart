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
