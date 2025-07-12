// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HomePageState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is HomePageState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'HomePageState()';
  }
}

/// @nodoc
class $HomePageStateCopyWith<$Res> {
  $HomePageStateCopyWith(HomePageState _, $Res Function(HomePageState) __);
}

/// @nodoc

class HomePageStateInitial implements HomePageState {
  const HomePageStateInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is HomePageStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'HomePageState.initial()';
  }
}

/// @nodoc

class HomePageStateLoading implements HomePageState {
  const HomePageStateLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is HomePageStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'HomePageState.loading()';
  }
}

/// @nodoc

class HomePageStateSuccess implements HomePageState {
  const HomePageStateSuccess({required this.response});

  final String response;

  /// Create a copy of HomePageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HomePageStateSuccessCopyWith<HomePageStateSuccess> get copyWith =>
      _$HomePageStateSuccessCopyWithImpl<HomePageStateSuccess>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HomePageStateSuccess &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @override
  int get hashCode => Object.hash(runtimeType, response);

  @override
  String toString() {
    return 'HomePageState.success(response: $response)';
  }
}

/// @nodoc
abstract mixin class $HomePageStateSuccessCopyWith<$Res>
    implements $HomePageStateCopyWith<$Res> {
  factory $HomePageStateSuccessCopyWith(HomePageStateSuccess value,
          $Res Function(HomePageStateSuccess) _then) =
      _$HomePageStateSuccessCopyWithImpl;
  @useResult
  $Res call({String response});
}

/// @nodoc
class _$HomePageStateSuccessCopyWithImpl<$Res>
    implements $HomePageStateSuccessCopyWith<$Res> {
  _$HomePageStateSuccessCopyWithImpl(this._self, this._then);

  final HomePageStateSuccess _self;
  final $Res Function(HomePageStateSuccess) _then;

  /// Create a copy of HomePageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? response = null,
  }) {
    return _then(HomePageStateSuccess(
      response: null == response
          ? _self.response
          : response // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class HomePageStateError implements HomePageState {
  const HomePageStateError({required this.message});

  final String message;

  /// Create a copy of HomePageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HomePageStateErrorCopyWith<HomePageStateError> get copyWith =>
      _$HomePageStateErrorCopyWithImpl<HomePageStateError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HomePageStateError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'HomePageState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $HomePageStateErrorCopyWith<$Res>
    implements $HomePageStateCopyWith<$Res> {
  factory $HomePageStateErrorCopyWith(
          HomePageStateError value, $Res Function(HomePageStateError) _then) =
      _$HomePageStateErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$HomePageStateErrorCopyWithImpl<$Res>
    implements $HomePageStateErrorCopyWith<$Res> {
  _$HomePageStateErrorCopyWithImpl(this._self, this._then);

  final HomePageStateError _self;
  final $Res Function(HomePageStateError) _then;

  /// Create a copy of HomePageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(HomePageStateError(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
