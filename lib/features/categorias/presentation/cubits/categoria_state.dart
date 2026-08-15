import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/categorias/domain/entities/categoria.dart';

part 'categoria_state.freezed.dart';

@freezed
abstract class CategoriaState with _$CategoriaState {
  const factory CategoriaState({
    @Default(<Categoria>[]) List<Categoria> categorias,
    @Default(false) bool isLoading,
    String? errorMessage,
    @Default(false) bool guardandoOperacion,
    String? operacionError,
    @Default(false) bool operacionExitosa,
    String? categoriaProcesandoId,
  }) = _CategoriaState;
}