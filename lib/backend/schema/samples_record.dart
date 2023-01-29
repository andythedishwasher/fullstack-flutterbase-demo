import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'samples_record.g.dart';

abstract class SamplesRecord
    implements Built<SamplesRecord, SamplesRecordBuilder> {
  static Serializer<SamplesRecord> get serializer => _$samplesRecordSerializer;

  String? get artist;

  String? get title;

  DateTime? get uploadedAt;

  bool? get claimed;

  DocumentReference? get claimedBy;

  DateTime? get claimedAt;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(SamplesRecordBuilder builder) => builder
    ..artist = ''
    ..title = ''
    ..claimed = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('samples');

  static Stream<SamplesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<SamplesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  SamplesRecord._();
  factory SamplesRecord([void Function(SamplesRecordBuilder) updates]) =
      _$SamplesRecord;

  static SamplesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createSamplesRecordData({
  String? artist,
  String? title,
  DateTime? uploadedAt,
  bool? claimed,
  DocumentReference? claimedBy,
  DateTime? claimedAt,
}) {
  final firestoreData = serializers.toFirestore(
    SamplesRecord.serializer,
    SamplesRecord(
      (s) => s
        ..artist = artist
        ..title = title
        ..uploadedAt = uploadedAt
        ..claimed = claimed
        ..claimedBy = claimedBy
        ..claimedAt = claimedAt,
    ),
  );

  return firestoreData;
}
