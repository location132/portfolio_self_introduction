// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'naver_map_data.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetNaverMapDataCollection on Isar {
  IsarCollection<NaverMapData> get naverMapDatas => this.collection();
}

const NaverMapDataSchema = CollectionSchema(
  name: r'NaverMapData',
  id: 3247392603841070843,
  properties: {
    r'naverMapData': PropertySchema(
      id: 0,
      name: r'naverMapData',
      type: IsarType.objectList,
      target: r'NaverMapDataContent',
    )
  },
  estimateSize: _naverMapDataEstimateSize,
  serialize: _naverMapDataSerialize,
  deserialize: _naverMapDataDeserialize,
  deserializeProp: _naverMapDataDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'NaverMapDataContent': NaverMapDataContentSchema},
  getId: _naverMapDataGetId,
  getLinks: _naverMapDataGetLinks,
  attach: _naverMapDataAttach,
  version: '3.1.0+1',
);

int _naverMapDataEstimateSize(
  NaverMapData object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final list = object.naverMapData;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[NaverMapDataContent]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += NaverMapDataContentSchema.estimateSize(
              value, offsets, allOffsets);
        }
      }
    }
  }
  return bytesCount;
}

void _naverMapDataSerialize(
  NaverMapData object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<NaverMapDataContent>(
    offsets[0],
    allOffsets,
    NaverMapDataContentSchema.serialize,
    object.naverMapData,
  );
}

NaverMapData _naverMapDataDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NaverMapData(
    naverMapData: reader.readObjectList<NaverMapDataContent>(
      offsets[0],
      NaverMapDataContentSchema.deserialize,
      allOffsets,
      NaverMapDataContent(),
    ),
  );
  object.id = id;
  return object;
}

P _naverMapDataDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<NaverMapDataContent>(
        offset,
        NaverMapDataContentSchema.deserialize,
        allOffsets,
        NaverMapDataContent(),
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _naverMapDataGetId(NaverMapData object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _naverMapDataGetLinks(NaverMapData object) {
  return [];
}

void _naverMapDataAttach(
    IsarCollection<dynamic> col, Id id, NaverMapData object) {
  object.id = id;
}

extension NaverMapDataQueryWhereSort
    on QueryBuilder<NaverMapData, NaverMapData, QWhere> {
  QueryBuilder<NaverMapData, NaverMapData, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension NaverMapDataQueryWhere
    on QueryBuilder<NaverMapData, NaverMapData, QWhereClause> {
  QueryBuilder<NaverMapData, NaverMapData, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<NaverMapData, NaverMapData, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<NaverMapData, NaverMapData, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<NaverMapData, NaverMapData, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<NaverMapData, NaverMapData, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension NaverMapDataQueryFilter
    on QueryBuilder<NaverMapData, NaverMapData, QFilterCondition> {
  QueryBuilder<NaverMapData, NaverMapData, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<NaverMapData, NaverMapData, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<NaverMapData, NaverMapData, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<NaverMapData, NaverMapData, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NaverMapData, NaverMapData, QAfterFilterCondition>
      naverMapDataIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'naverMapData',
      ));
    });
  }

  QueryBuilder<NaverMapData, NaverMapData, QAfterFilterCondition>
      naverMapDataIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'naverMapData',
      ));
    });
  }

  QueryBuilder<NaverMapData, NaverMapData, QAfterFilterCondition>
      naverMapDataLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'naverMapData',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<NaverMapData, NaverMapData, QAfterFilterCondition>
      naverMapDataIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'naverMapData',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<NaverMapData, NaverMapData, QAfterFilterCondition>
      naverMapDataIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'naverMapData',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<NaverMapData, NaverMapData, QAfterFilterCondition>
      naverMapDataLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'naverMapData',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<NaverMapData, NaverMapData, QAfterFilterCondition>
      naverMapDataLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'naverMapData',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<NaverMapData, NaverMapData, QAfterFilterCondition>
      naverMapDataLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'naverMapData',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension NaverMapDataQueryObject
    on QueryBuilder<NaverMapData, NaverMapData, QFilterCondition> {
  QueryBuilder<NaverMapData, NaverMapData, QAfterFilterCondition>
      naverMapDataElement(FilterQuery<NaverMapDataContent> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'naverMapData');
    });
  }
}

extension NaverMapDataQueryLinks
    on QueryBuilder<NaverMapData, NaverMapData, QFilterCondition> {}

extension NaverMapDataQuerySortBy
    on QueryBuilder<NaverMapData, NaverMapData, QSortBy> {}

extension NaverMapDataQuerySortThenBy
    on QueryBuilder<NaverMapData, NaverMapData, QSortThenBy> {
  QueryBuilder<NaverMapData, NaverMapData, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<NaverMapData, NaverMapData, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension NaverMapDataQueryWhereDistinct
    on QueryBuilder<NaverMapData, NaverMapData, QDistinct> {}

extension NaverMapDataQueryProperty
    on QueryBuilder<NaverMapData, NaverMapData, QQueryProperty> {
  QueryBuilder<NaverMapData, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<NaverMapData, List<NaverMapDataContent>?, QQueryOperations>
      naverMapDataProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'naverMapData');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const NaverMapDataContentSchema = Schema(
  name: r'NaverMapDataContent',
  id: -6968920836151873017,
  properties: {
    r'averageReviewScore': PropertySchema(
      id: 0,
      name: r'averageReviewScore',
      type: IsarType.double,
    ),
    r'closeTime': PropertySchema(
      id: 1,
      name: r'closeTime',
      type: IsarType.string,
    ),
    r'closedDays': PropertySchema(
      id: 2,
      name: r'closedDays',
      type: IsarType.string,
    ),
    r'detailAddress': PropertySchema(
      id: 3,
      name: r'detailAddress',
      type: IsarType.string,
    ),
    r'eventMessage': PropertySchema(
      id: 4,
      name: r'eventMessage',
      type: IsarType.string,
    ),
    r'locationX': PropertySchema(
      id: 5,
      name: r'locationX',
      type: IsarType.double,
    ),
    r'locationY': PropertySchema(
      id: 6,
      name: r'locationY',
      type: IsarType.double,
    ),
    r'mainCategory': PropertySchema(
      id: 7,
      name: r'mainCategory',
      type: IsarType.string,
    ),
    r'majorCategory': PropertySchema(
      id: 8,
      name: r'majorCategory',
      type: IsarType.string,
    ),
    r'marketDescription': PropertySchema(
      id: 9,
      name: r'marketDescription',
      type: IsarType.string,
    ),
    r'marketId': PropertySchema(
      id: 10,
      name: r'marketId',
      type: IsarType.long,
    ),
    r'marketImage': PropertySchema(
      id: 11,
      name: r'marketImage',
      type: IsarType.string,
    ),
    r'marketName': PropertySchema(
      id: 12,
      name: r'marketName',
      type: IsarType.string,
    ),
    r'maxDiscountRate': PropertySchema(
      id: 13,
      name: r'maxDiscountRate',
      type: IsarType.long,
    ),
    r'openTime': PropertySchema(
      id: 14,
      name: r'openTime',
      type: IsarType.string,
    ),
    r'reviewCount': PropertySchema(
      id: 15,
      name: r'reviewCount',
      type: IsarType.long,
    )
  },
  estimateSize: _naverMapDataContentEstimateSize,
  serialize: _naverMapDataContentSerialize,
  deserialize: _naverMapDataContentDeserialize,
  deserializeProp: _naverMapDataContentDeserializeProp,
);

int _naverMapDataContentEstimateSize(
  NaverMapDataContent object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.closeTime;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.closedDays;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.detailAddress;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.eventMessage;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.mainCategory;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.majorCategory;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.marketDescription;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.marketImage;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.marketName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.openTime;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _naverMapDataContentSerialize(
  NaverMapDataContent object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.averageReviewScore);
  writer.writeString(offsets[1], object.closeTime);
  writer.writeString(offsets[2], object.closedDays);
  writer.writeString(offsets[3], object.detailAddress);
  writer.writeString(offsets[4], object.eventMessage);
  writer.writeDouble(offsets[5], object.locationX);
  writer.writeDouble(offsets[6], object.locationY);
  writer.writeString(offsets[7], object.mainCategory);
  writer.writeString(offsets[8], object.majorCategory);
  writer.writeString(offsets[9], object.marketDescription);
  writer.writeLong(offsets[10], object.marketId);
  writer.writeString(offsets[11], object.marketImage);
  writer.writeString(offsets[12], object.marketName);
  writer.writeLong(offsets[13], object.maxDiscountRate);
  writer.writeString(offsets[14], object.openTime);
  writer.writeLong(offsets[15], object.reviewCount);
}

NaverMapDataContent _naverMapDataContentDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NaverMapDataContent(
    averageReviewScore: reader.readDoubleOrNull(offsets[0]),
    closeTime: reader.readStringOrNull(offsets[1]),
    closedDays: reader.readStringOrNull(offsets[2]),
    detailAddress: reader.readStringOrNull(offsets[3]),
    eventMessage: reader.readStringOrNull(offsets[4]),
    locationX: reader.readDoubleOrNull(offsets[5]),
    locationY: reader.readDoubleOrNull(offsets[6]),
    mainCategory: reader.readStringOrNull(offsets[7]),
    majorCategory: reader.readStringOrNull(offsets[8]),
    marketDescription: reader.readStringOrNull(offsets[9]),
    marketId: reader.readLongOrNull(offsets[10]),
    marketImage: reader.readStringOrNull(offsets[11]),
    marketName: reader.readStringOrNull(offsets[12]),
    maxDiscountRate: reader.readLongOrNull(offsets[13]),
    openTime: reader.readStringOrNull(offsets[14]),
    reviewCount: reader.readLongOrNull(offsets[15]),
  );
  return object;
}

P _naverMapDataContentDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readDoubleOrNull(offset)) as P;
    case 6:
      return (reader.readDoubleOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readLongOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readLongOrNull(offset)) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    case 15:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension NaverMapDataContentQueryFilter on QueryBuilder<NaverMapDataContent,
    NaverMapDataContent, QFilterCondition> {
  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      averageReviewScoreIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'averageReviewScore',
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      averageReviewScoreIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'averageReviewScore',
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      averageReviewScoreEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'averageReviewScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      averageReviewScoreGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'averageReviewScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      averageReviewScoreLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'averageReviewScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      averageReviewScoreBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'averageReviewScore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      closeTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'closeTime',
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      closeTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'closeTime',
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      closeTimeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'closeTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      closeTimeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'closeTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      closeTimeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'closeTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      closeTimeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'closeTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      closeTimeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'closeTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      closeTimeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'closeTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      closeTimeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'closeTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      closeTimeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'closeTime',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      closeTimeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'closeTime',
        value: '',
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      closeTimeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'closeTime',
        value: '',
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      closedDaysIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'closedDays',
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      closedDaysIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'closedDays',
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      closedDaysEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'closedDays',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      closedDaysGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'closedDays',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      closedDaysLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'closedDays',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      closedDaysBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'closedDays',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      closedDaysStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'closedDays',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      closedDaysEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'closedDays',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      closedDaysContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'closedDays',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      closedDaysMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'closedDays',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      closedDaysIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'closedDays',
        value: '',
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      closedDaysIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'closedDays',
        value: '',
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      detailAddressIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'detailAddress',
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      detailAddressIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'detailAddress',
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      detailAddressEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'detailAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      detailAddressGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'detailAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      detailAddressLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'detailAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      detailAddressBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'detailAddress',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      detailAddressStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'detailAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      detailAddressEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'detailAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      detailAddressContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'detailAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      detailAddressMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'detailAddress',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      detailAddressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'detailAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      detailAddressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'detailAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      eventMessageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'eventMessage',
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      eventMessageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'eventMessage',
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      eventMessageEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'eventMessage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      eventMessageGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'eventMessage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      eventMessageLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'eventMessage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      eventMessageBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'eventMessage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      eventMessageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'eventMessage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      eventMessageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'eventMessage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      eventMessageContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'eventMessage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      eventMessageMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'eventMessage',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      eventMessageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'eventMessage',
        value: '',
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      eventMessageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'eventMessage',
        value: '',
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      locationXIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'locationX',
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      locationXIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'locationX',
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      locationXEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'locationX',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      locationXGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'locationX',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      locationXLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'locationX',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      locationXBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'locationX',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      locationYIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'locationY',
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      locationYIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'locationY',
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      locationYEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'locationY',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      locationYGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'locationY',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      locationYLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'locationY',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      locationYBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'locationY',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      mainCategoryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'mainCategory',
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      mainCategoryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'mainCategory',
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      mainCategoryEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mainCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      mainCategoryGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mainCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      mainCategoryLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mainCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      mainCategoryBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mainCategory',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      mainCategoryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'mainCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      mainCategoryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'mainCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      mainCategoryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'mainCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      mainCategoryMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'mainCategory',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      mainCategoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mainCategory',
        value: '',
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      mainCategoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'mainCategory',
        value: '',
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      majorCategoryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'majorCategory',
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      majorCategoryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'majorCategory',
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      majorCategoryEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'majorCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      majorCategoryGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'majorCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      majorCategoryLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'majorCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      majorCategoryBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'majorCategory',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      majorCategoryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'majorCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      majorCategoryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'majorCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      majorCategoryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'majorCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      majorCategoryMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'majorCategory',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      majorCategoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'majorCategory',
        value: '',
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      majorCategoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'majorCategory',
        value: '',
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      marketDescriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'marketDescription',
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      marketDescriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'marketDescription',
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      marketDescriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'marketDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      marketDescriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'marketDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      marketDescriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'marketDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      marketDescriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'marketDescription',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      marketDescriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'marketDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      marketDescriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'marketDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      marketDescriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'marketDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      marketDescriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'marketDescription',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      marketDescriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'marketDescription',
        value: '',
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      marketDescriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'marketDescription',
        value: '',
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      marketIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'marketId',
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      marketIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'marketId',
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      marketIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'marketId',
        value: value,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      marketIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'marketId',
        value: value,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      marketIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'marketId',
        value: value,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      marketIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'marketId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      marketImageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'marketImage',
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      marketImageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'marketImage',
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      marketImageEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'marketImage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      marketImageGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'marketImage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      marketImageLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'marketImage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      marketImageBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'marketImage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      marketImageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'marketImage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      marketImageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'marketImage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      marketImageContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'marketImage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      marketImageMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'marketImage',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      marketImageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'marketImage',
        value: '',
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      marketImageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'marketImage',
        value: '',
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      marketNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'marketName',
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      marketNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'marketName',
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      marketNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'marketName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      marketNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'marketName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      marketNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'marketName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      marketNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'marketName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      marketNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'marketName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      marketNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'marketName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      marketNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'marketName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      marketNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'marketName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      marketNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'marketName',
        value: '',
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      marketNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'marketName',
        value: '',
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      maxDiscountRateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'maxDiscountRate',
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      maxDiscountRateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'maxDiscountRate',
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      maxDiscountRateEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxDiscountRate',
        value: value,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      maxDiscountRateGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maxDiscountRate',
        value: value,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      maxDiscountRateLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maxDiscountRate',
        value: value,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      maxDiscountRateBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maxDiscountRate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      openTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'openTime',
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      openTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'openTime',
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      openTimeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'openTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      openTimeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'openTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      openTimeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'openTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      openTimeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'openTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      openTimeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'openTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      openTimeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'openTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      openTimeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'openTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      openTimeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'openTime',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      openTimeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'openTime',
        value: '',
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      openTimeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'openTime',
        value: '',
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      reviewCountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'reviewCount',
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      reviewCountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'reviewCount',
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      reviewCountEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reviewCount',
        value: value,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      reviewCountGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'reviewCount',
        value: value,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      reviewCountLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'reviewCount',
        value: value,
      ));
    });
  }

  QueryBuilder<NaverMapDataContent, NaverMapDataContent, QAfterFilterCondition>
      reviewCountBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'reviewCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension NaverMapDataContentQueryObject on QueryBuilder<NaverMapDataContent,
    NaverMapDataContent, QFilterCondition> {}
