import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/categorias/domain/entities/categoria.dart';

part 'categoria_state.freezed.dart';

@freezed
class CategoriaState with _$CategoriaState {
  const factory CategoriaState.initial() = CategoriaInitial;
  const factory CategoriaState.loading() = CategoriaLoading;
  const factory CategoriaState.loaded(List<Categoria> categorias) = CategoriaLoaded;
  const factory CategoriaState.error(String message) = CategoriaError;
}