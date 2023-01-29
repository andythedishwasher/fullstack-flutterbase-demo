// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'samples_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SamplesRecord> _$samplesRecordSerializer =
    new _$SamplesRecordSerializer();

class _$SamplesRecordSerializer implements StructuredSerializer<SamplesRecord> {
  @override
  final Iterable<Type> types = const [SamplesRecord, _$SamplesRecord];
  @override
  final String wireName = 'SamplesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, SamplesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.artist;
    if (value != null) {
      result
        ..add('artist')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.uploadedAt;
    if (value != null) {
      result
        ..add('uploadedAt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.claimed;
    if (value != null) {
      result
        ..add('claimed')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.claimedBy;
    if (value != null) {
      result
        ..add('claimedBy')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.claimedAt;
    if (value != null) {
      result
        ..add('claimedAt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  SamplesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SamplesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'artist':
          result.artist = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'uploadedAt':
          result.uploadedAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'claimed':
          result.claimed = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'claimedBy':
          result.claimedBy = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'claimedAt':
          result.claimedAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$SamplesRecord extends SamplesRecord {
  @override
  final String? artist;
  @override
  final String? title;
  @override
  final DateTime? uploadedAt;
  @override
  final bool? claimed;
  @override
  final DocumentReference<Object?>? claimedBy;
  @override
  final DateTime? claimedAt;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$SamplesRecord([void Function(SamplesRecordBuilder)? updates]) =>
      (new SamplesRecordBuilder()..update(updates))._build();

  _$SamplesRecord._(
      {this.artist,
      this.title,
      this.uploadedAt,
      this.claimed,
      this.claimedBy,
      this.claimedAt,
      this.ffRef})
      : super._();

  @override
  SamplesRecord rebuild(void Function(SamplesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SamplesRecordBuilder toBuilder() => new SamplesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SamplesRecord &&
        artist == other.artist &&
        title == other.title &&
        uploadedAt == other.uploadedAt &&
        claimed == other.claimed &&
        claimedBy == other.claimedBy &&
        claimedAt == other.claimedAt &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, artist.hashCode), title.hashCode),
                        uploadedAt.hashCode),
                    claimed.hashCode),
                claimedBy.hashCode),
            claimedAt.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SamplesRecord')
          ..add('artist', artist)
          ..add('title', title)
          ..add('uploadedAt', uploadedAt)
          ..add('claimed', claimed)
          ..add('claimedBy', claimedBy)
          ..add('claimedAt', claimedAt)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class SamplesRecordBuilder
    implements Builder<SamplesRecord, SamplesRecordBuilder> {
  _$SamplesRecord? _$v;

  String? _artist;
  String? get artist => _$this._artist;
  set artist(String? artist) => _$this._artist = artist;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  DateTime? _uploadedAt;
  DateTime? get uploadedAt => _$this._uploadedAt;
  set uploadedAt(DateTime? uploadedAt) => _$this._uploadedAt = uploadedAt;

  bool? _claimed;
  bool? get claimed => _$this._claimed;
  set claimed(bool? claimed) => _$this._claimed = claimed;

  DocumentReference<Object?>? _claimedBy;
  DocumentReference<Object?>? get claimedBy => _$this._claimedBy;
  set claimedBy(DocumentReference<Object?>? claimedBy) =>
      _$this._claimedBy = claimedBy;

  DateTime? _claimedAt;
  DateTime? get claimedAt => _$this._claimedAt;
  set claimedAt(DateTime? claimedAt) => _$this._claimedAt = claimedAt;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  SamplesRecordBuilder() {
    SamplesRecord._initializeBuilder(this);
  }

  SamplesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _artist = $v.artist;
      _title = $v.title;
      _uploadedAt = $v.uploadedAt;
      _claimed = $v.claimed;
      _claimedBy = $v.claimedBy;
      _claimedAt = $v.claimedAt;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SamplesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SamplesRecord;
  }

  @override
  void update(void Function(SamplesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SamplesRecord build() => _build();

  _$SamplesRecord _build() {
    final _$result = _$v ??
        new _$SamplesRecord._(
            artist: artist,
            title: title,
            uploadedAt: uploadedAt,
            claimed: claimed,
            claimedBy: claimedBy,
            claimedAt: claimedAt,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
