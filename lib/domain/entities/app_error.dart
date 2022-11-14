import 'package:equatable/equatable.dart';

class AppError extends Equatable {
  final String errorMessage;

  const AppError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
