// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_freezed_data_classes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CreateGroupObject {
  String get groupName => throw _privateConstructorUsedError;

  /// Create a copy of CreateGroupObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateGroupObjectCopyWith<CreateGroupObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateGroupObjectCopyWith<$Res> {
  factory $CreateGroupObjectCopyWith(
          CreateGroupObject value, $Res Function(CreateGroupObject) then) =
      _$CreateGroupObjectCopyWithImpl<$Res, CreateGroupObject>;
  @useResult
  $Res call({String groupName});
}

/// @nodoc
class _$CreateGroupObjectCopyWithImpl<$Res, $Val extends CreateGroupObject>
    implements $CreateGroupObjectCopyWith<$Res> {
  _$CreateGroupObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateGroupObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groupName = null,
  }) {
    return _then(_value.copyWith(
      groupName: null == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateGroupObjectImplCopyWith<$Res>
    implements $CreateGroupObjectCopyWith<$Res> {
  factory _$$CreateGroupObjectImplCopyWith(_$CreateGroupObjectImpl value,
          $Res Function(_$CreateGroupObjectImpl) then) =
      __$$CreateGroupObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String groupName});
}

/// @nodoc
class __$$CreateGroupObjectImplCopyWithImpl<$Res>
    extends _$CreateGroupObjectCopyWithImpl<$Res, _$CreateGroupObjectImpl>
    implements _$$CreateGroupObjectImplCopyWith<$Res> {
  __$$CreateGroupObjectImplCopyWithImpl(_$CreateGroupObjectImpl _value,
      $Res Function(_$CreateGroupObjectImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateGroupObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groupName = null,
  }) {
    return _then(_$CreateGroupObjectImpl(
      null == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CreateGroupObjectImpl implements _CreateGroupObject {
  _$CreateGroupObjectImpl(this.groupName);

  @override
  final String groupName;

  @override
  String toString() {
    return 'CreateGroupObject(groupName: $groupName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateGroupObjectImpl &&
            (identical(other.groupName, groupName) ||
                other.groupName == groupName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, groupName);

  /// Create a copy of CreateGroupObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateGroupObjectImplCopyWith<_$CreateGroupObjectImpl> get copyWith =>
      __$$CreateGroupObjectImplCopyWithImpl<_$CreateGroupObjectImpl>(
          this, _$identity);
}

abstract class _CreateGroupObject implements CreateGroupObject {
  factory _CreateGroupObject(final String groupName) = _$CreateGroupObjectImpl;

  @override
  String get groupName;

  /// Create a copy of CreateGroupObject
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateGroupObjectImplCopyWith<_$CreateGroupObjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}