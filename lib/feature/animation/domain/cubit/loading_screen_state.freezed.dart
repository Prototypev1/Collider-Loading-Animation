// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'loading_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LoadingScreenState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoadingScreenState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LoadingScreenState()';
  }
}

/// @nodoc
class $LoadingScreenStateCopyWith<$Res> {
  $LoadingScreenStateCopyWith(
      LoadingScreenState _, $Res Function(LoadingScreenState) __);
}

/// @nodoc

class LoadingScreenStateInitial implements LoadingScreenState {
  const LoadingScreenStateInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoadingScreenStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LoadingScreenState.initial()';
  }
}

/// @nodoc

class LoadingScreenStateLoading implements LoadingScreenState {
  const LoadingScreenStateLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoadingScreenStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LoadingScreenState.loading()';
  }
}

/// @nodoc

class LoadingScreenStateSuccessfulCollision implements LoadingScreenState {
  const LoadingScreenStateSuccessfulCollision();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoadingScreenStateSuccessfulCollision);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LoadingScreenState.successfulCollision()';
  }
}

/// @nodoc

class LoadingScreenStateFlashSpread implements LoadingScreenState {
  const LoadingScreenStateFlashSpread();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoadingScreenStateFlashSpread);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LoadingScreenState.flashSpread()';
  }
}

/// @nodoc

class LoadingScreenStateSuccess implements LoadingScreenState {
  const LoadingScreenStateSuccess();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoadingScreenStateSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LoadingScreenState.success()';
  }
}

/// @nodoc

class LoadingScreenStateError implements LoadingScreenState {
  const LoadingScreenStateError({required this.message});

  final String message;

  /// Create a copy of LoadingScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoadingScreenStateErrorCopyWith<LoadingScreenStateError> get copyWith =>
      _$LoadingScreenStateErrorCopyWithImpl<LoadingScreenStateError>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoadingScreenStateError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'LoadingScreenState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $LoadingScreenStateErrorCopyWith<$Res>
    implements $LoadingScreenStateCopyWith<$Res> {
  factory $LoadingScreenStateErrorCopyWith(LoadingScreenStateError value,
          $Res Function(LoadingScreenStateError) _then) =
      _$LoadingScreenStateErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$LoadingScreenStateErrorCopyWithImpl<$Res>
    implements $LoadingScreenStateErrorCopyWith<$Res> {
  _$LoadingScreenStateErrorCopyWithImpl(this._self, this._then);

  final LoadingScreenStateError _self;
  final $Res Function(LoadingScreenStateError) _then;

  /// Create a copy of LoadingScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(LoadingScreenStateError(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
