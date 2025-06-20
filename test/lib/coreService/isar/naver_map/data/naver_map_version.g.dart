// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'naver_map_version.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetNaverMapVersionCollection on Isar {
  IsarCollection<NaverMapVersion> get naverMapVersions => this.collection();
}

const NaverMapVersionSchema = CollectionSchema(
  name: r'NaverMapVersion',
  id: 3068655340244382354,
  properties: {
    r'ifsaiServerMapVersion': PropertySchema(
      id: 0,
      name: r'ifsaiServerMapVersion',
      type: IsarType.string,
    ),
    r'ifsaiVersion': PropertySchema(
      id: 1,
      name: r'ifsaiVersion',
      type: IsarType.string,
    )
  },
  estimateSize: _naverMapVersionEstimateSize,
  serialize: _naverMapVersionSerialize,
  deserialize: _naverMapVersionDeserialize,
  deserializeProp: _naverMapVersionDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _naverMapVersionGetId,
  getLinks: _naverMapVersionGetLinks,
  attach: _naverMapVersionAttach,
  version: '3.1.0+1',
);

int _naverMapVersionEstimateSize(
  NaverMapVersion object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.ifsaiServerMapVersion;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.ifsaiVersion;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _naverMapVersionSerialize(
  NaverMapVersion object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.ifsaiServerMapVersion);
  writer.writeString(offsets[1], object.ifsaiVersion);
}

NaverMapVersion _naverMapVersionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NaverMapVersion(
    ifsaiServerMapVersion: reader.readStringOrNull(offsets[0]),
    ifsaiVersion: reader.readStringOrNull(offsets[1]),
  );
  object.id = id;
  return object;
}

P _naverMapVersionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _naverMapVersionGetId(NaverMapVersion object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _naverMapVersionGetLinks(NaverMapVersion object) {
  return [];
}

void _naverMapVersionAttach(
    IsarCollection<dynamic> col, Id id, NaverMapVersion object) {
  object.id = id;
}

extension NaverMapVersionQueryWhereSort
    on QueryBuilder<NaverMapVersion, NaverMapVersion, QWhere> {
  QueryBuilder<NaverMapVersion, NaverMapVersion, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension NaverMapVersionQueryWhere
    on QueryBuilder<NaverMapVersion, NaverMapVersion, QWhereClause> {
  QueryBuilder<NaverMapVersion, NaverMapVersion, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<NaverMapVersion, NaverMapVersion, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<NaverMapVersion, NaverMapVersion, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<NaverMapVersion, NaverMapVersion, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<NaverMapVersion, NaverMapVersion, QAfterWhereClause> idBetween(
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

extension NaverMapVersionQueryFilter
    on QueryBuilder<NaverMapVersion, NaverMapVersion, QFilterCondition> {
  QueryBuilder<NaverMapVersion, NaverMapVersion, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<NaverMapVersion, NaverMapVersion, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<NaverMapVersion, NaverMapVersion, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<NaverMapVersion, NaverMapVersion, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<NaverMapVersion, NaverMapVersion, QAfterFilterCondition>
      ifsaiServerMapVersionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ifsaiServerMapVersion',
      ));
    });
  }

  QueryBuilder<NaverMapVersion, NaverMapVersion, QAfterFilterCondition>
      ifsaiServerMapVersionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ifsaiServerMapVersion',
      ));
    });
  }

  QueryBuilder<NaverMapVersion, NaverMapVersion, QAfterFilterCondition>
      ifsaiServerMapVersionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ifsaiServerMapVersion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapVersion, NaverMapVersion, QAfterFilterCondition>
      ifsaiServerMapVersionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ifsaiServerMapVersion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapVersion, NaverMapVersion, QAfterFilterCondition>
      ifsaiServerMapVersionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ifsaiServerMapVersion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapVersion, NaverMapVersion, QAfterFilterCondition>
      ifsaiServerMapVersionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ifsaiServerMapVersion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapVersion, NaverMapVersion, QAfterFilterCondition>
      ifsaiServerMapVersionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ifsaiServerMapVersion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapVersion, NaverMapVersion, QAfterFilterCondition>
      ifsaiServerMapVersionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ifsaiServerMapVersion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapVersion, NaverMapVersion, QAfterFilterCondition>
      ifsaiServerMapVersionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ifsaiServerMapVersion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapVersion, NaverMapVersion, QAfterFilterCondition>
      ifsaiServerMapVersionMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ifsaiServerMapVersion',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapVersion, NaverMapVersion, QAfterFilterCondition>
      ifsaiServerMapVersionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ifsaiServerMapVersion',
        value: '',
      ));
    });
  }

  QueryBuilder<NaverMapVersion, NaverMapVersion, QAfterFilterCondition>
      ifsaiServerMapVersionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ifsaiServerMapVersion',
        value: '',
      ));
    });
  }

  QueryBuilder<NaverMapVersion, NaverMapVersion, QAfterFilterCondition>
      ifsaiVersionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ifsaiVersion',
      ));
    });
  }

  QueryBuilder<NaverMapVersion, NaverMapVersion, QAfterFilterCondition>
      ifsaiVersionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ifsaiVersion',
      ));
    });
  }

  QueryBuilder<NaverMapVersion, NaverMapVersion, QAfterFilterCondition>
      ifsaiVersionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ifsaiVersion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapVersion, NaverMapVersion, QAfterFilterCondition>
      ifsaiVersionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ifsaiVersion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapVersion, NaverMapVersion, QAfterFilterCondition>
      ifsaiVersionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ifsaiVersion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapVersion, NaverMapVersion, QAfterFilterCondition>
      ifsaiVersionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ifsaiVersion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapVersion, NaverMapVersion, QAfterFilterCondition>
      ifsaiVersionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ifsaiVersion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapVersion, NaverMapVersion, QAfterFilterCondition>
      ifsaiVersionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ifsaiVersion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapVersion, NaverMapVersion, QAfterFilterCondition>
      ifsaiVersionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ifsaiVersion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapVersion, NaverMapVersion, QAfterFilterCondition>
      ifsaiVersionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ifsaiVersion',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapVersion, NaverMapVersion, QAfterFilterCondition>
      ifsaiVersionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ifsaiVersion',
        value: '',
      ));
    });
  }

  QueryBuilder<NaverMapVersion, NaverMapVersion, QAfterFilterCondition>
      ifsaiVersionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ifsaiVersion',
        value: '',
      ));
    });
  }
}

extension NaverMapVersionQueryObject
    on QueryBuilder<NaverMapVersion, NaverMapVersion, QFilterCondition> {}

extension NaverMapVersionQueryLinks
    on QueryBuilder<NaverMapVersion, NaverMapVersion, QFilterCondition> {}

extension NaverMapVersionQuerySortBy
    on QueryBuilder<NaverMapVersion, NaverMapVersion, QSortBy> {
  QueryBuilder<NaverMapVersion, NaverMapVersion, QAfterSortBy>
      sortByIfsaiServerMapVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ifsaiServerMapVersion', Sort.asc);
    });
  }

  QueryBuilder<NaverMapVersion, NaverMapVersion, QAfterSortBy>
      sortByIfsaiServerMapVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ifsaiServerMapVersion', Sort.desc);
    });
  }

  QueryBuilder<NaverMapVersion, NaverMapVersion, QAfterSortBy>
      sortByIfsaiVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ifsaiVersion', Sort.asc);
    });
  }

  QueryBuilder<NaverMapVersion, NaverMapVersion, QAfterSortBy>
      sortByIfsaiVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ifsaiVersion', Sort.desc);
    });
  }
}

extension NaverMapVersionQuerySortThenBy
    on QueryBuilder<NaverMapVersion, NaverMapVersion, QSortThenBy> {
  QueryBuilder<NaverMapVersion, NaverMapVersion, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<NaverMapVersion, NaverMapVersion, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<NaverMapVersion, NaverMapVersion, QAfterSortBy>
      thenByIfsaiServerMapVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ifsaiServerMapVersion', Sort.asc);
    });
  }

  QueryBuilder<NaverMapVersion, NaverMapVersion, QAfterSortBy>
      thenByIfsaiServerMapVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ifsaiServerMapVersion', Sort.desc);
    });
  }

  QueryBuilder<NaverMapVersion, NaverMapVersion, QAfterSortBy>
      thenByIfsaiVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ifsaiVersion', Sort.asc);
    });
  }

  QueryBuilder<NaverMapVersion, NaverMapVersion, QAfterSortBy>
      thenByIfsaiVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ifsaiVersion', Sort.desc);
    });
  }
}

extension NaverMapVersionQueryWhereDistinct
    on QueryBuilder<NaverMapVersion, NaverMapVersion, QDistinct> {
  QueryBuilder<NaverMapVersion, NaverMapVersion, QDistinct>
      distinctByIfsaiServerMapVersion({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ifsaiServerMapVersion',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NaverMapVersion, NaverMapVersion, QDistinct>
      distinctByIfsaiVersion({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ifsaiVersion', caseSensitive: caseSensitive);
    });
  }
}

extension NaverMapVersionQueryProperty
    on QueryBuilder<NaverMapVersion, NaverMapVersion, QQueryProperty> {
  QueryBuilder<NaverMapVersion, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<NaverMapVersion, String?, QQueryOperations>
      ifsaiServerMapVersionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ifsaiServerMapVersion');
    });
  }

  QueryBuilder<NaverMapVersion, String?, QQueryOperations>
      ifsaiVersionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ifsaiVersion');
    });
  }
}
