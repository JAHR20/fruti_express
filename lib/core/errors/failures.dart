import 'package:freezed_annotation/freezed_annotation.dart';
import 'failure_code.dart';

part 'failures.freezed.dart';

@freezed
sealed class Failure with _$Failure {
  const factory Failure.validation(
    FailureCode code, {
    Map<String, dynamic>? params,
  }) = ValidationFailure;

  const factory Failure.unauthorized(
    FailureCode code, {
    Map<String, dynamic>? params,
  }) = UnauthorizedFailure;

  const factory Failure.badRequest(
    FailureCode code, {
    Map<String, dynamic>? params,
  }) = BadRequestFailure;

  const factory Failure.alreadyExists(
    FailureCode code, {
    Map<String, dynamic>? params,
  }) = AlreadyExistsFailure;

  const factory Failure.server(
    FailureCode code, {
    Map<String, dynamic>? params,
  }) = ServerFailure;
  
  const factory Failure.notFound(FailureCode code) = _NotFound;

  const factory Failure.insufficientStock(
    FailureCode code, {
    Map<String, dynamic>? params,
  }) = InsufficientStockFailure;
}