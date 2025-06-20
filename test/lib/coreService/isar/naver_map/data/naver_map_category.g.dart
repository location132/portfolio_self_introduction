// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'naver_map_category.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetNaverMapCategoryCollection on Isar {
  IsarCollection<NaverMapCategory> get naverMapCategorys => this.collection();
}

const NaverMapCategorySchema = CollectionSchema(
  name: r'NaverMapCategory',
  id: -3305954993756283078,
  properties: {
    r'categories': PropertySchema(
      id: 0,
      name: r'categories',
      type: IsarType.objectList,
      target: r'NaverMapCategoryContent',
    )
  },
  estimateSize: _naverMapCategoryEstimateSize,
  serialize: _naverMapCategorySerialize,
  deserialize: _naverMapCategoryDeserialize,
  deserializeProp: _naverMapCategoryDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'NaverMapCategoryContent': NaverMapCategoryContentSchema},
  getId: _naverMapCategoryGetId,
  getLinks: _naverMapCategoryGetLinks,
  attach: _naverMapCategoryAttach,
  version: '3.1.0+1',
);

int _naverMapCategoryEstimateSize(
  NaverMapCategory object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final list = object.categories;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[NaverMapCategoryContent]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += NaverMapCategoryContentSchema.estimateSize(
              value, offsets, allOffsets);
        }
      }
    }
  }
  return bytesCount;
}

void _naverMapCategorySerialize(
  NaverMapCategory object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<NaverMapCategoryContent>(
    offsets[0],
    allOffsets,
    NaverMapCategoryContentSchema.serialize,
    object.categories,
  );
}

NaverMapCategory _naverMapCategoryDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NaverMapCategory(
    categories: reader.readObjectList<NaverMapCategoryContent>(
      offsets[0],
      NaverMapCategoryContentSchema.deserialize,
      allOffsets,
      NaverMapCategoryContent(),
    ),
  );
  object.id = id;
  return object;
}

P _naverMapCategoryDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<NaverMapCategoryContent>(
        offset,
        NaverMapCategoryContentSchema.deserialize,
        allOffsets,
        NaverMapCategoryContent(),
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _naverMapCategoryGetId(NaverMapCategory object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _naverMapCategoryGetLinks(NaverMapCategory object) {
  return [];
}

void _naverMapCategoryAttach(
    IsarCollection<dynamic> col, Id id, NaverMapCategory object) {
  object.id = id;
}

extension NaverMapCategoryQueryWhereSort
    on QueryBuilder<NaverMapCategory, NaverMapCategory, QWhere> {
  QueryBuilder<NaverMapCategory, NaverMapCategory, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension NaverMapCategoryQueryWhere
    on QueryBuilder<NaverMapCategory, NaverMapCategory, QWhereClause> {
  QueryBuilder<NaverMapCategory, NaverMapCategory, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<NaverMapCategory, NaverMapCategory, QAfterWhereClause>
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

  QueryBuilder<NaverMapCategory, NaverMapCategory, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<NaverMapCategory, NaverMapCategory, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<NaverMapCategory, NaverMapCategory, QAfterWhereClause> idBetween(
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

extension NaverMapCategoryQueryFilter
    on QueryBuilder<NaverMapCategory, NaverMapCategory, QFilterCondition> {
  QueryBuilder<NaverMapCategory, NaverMapCategory, QAfterFilterCondition>
      categoriesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'categories',
      ));
    });
  }

  QueryBuilder<NaverMapCategory, NaverMapCategory, QAfterFilterCondition>
      categoriesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'categories',
      ));
    });
  }

  QueryBuilder<NaverMapCategory, NaverMapCategory, QAfterFilterCondition>
      categoriesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categories',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<NaverMapCategory, NaverMapCategory, QAfterFilterCondition>
      categoriesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categories',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<NaverMapCategory, NaverMapCategory, QAfterFilterCondition>
      categoriesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categories',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<NaverMapCategory, NaverMapCategory, QAfterFilterCondition>
      categoriesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categories',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<NaverMapCategory, NaverMapCategory, QAfterFilterCondition>
      categoriesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categories',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<NaverMapCategory, NaverMapCategory, QAfterFilterCondition>
      categoriesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categories',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<NaverMapCategory, NaverMapCategory, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<NaverMapCategory, NaverMapCategory, QAfterFilterCondition>
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

  QueryBuilder<NaverMapCategory, NaverMapCategory, QAfterFilterCondition>
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

  QueryBuilder<NaverMapCategory, NaverMapCategory, QAfterFilterCondition>
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
}

extension NaverMapCategoryQueryObject
    on QueryBuilder<NaverMapCategory, NaverMapCategory, QFilterCondition> {
  QueryBuilder<NaverMapCategory, NaverMapCategory, QAfterFilterCondition>
      categoriesElement(FilterQuery<NaverMapCategoryContent> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'categories');
    });
  }
}

extension NaverMapCategoryQueryLinks
    on QueryBuilder<NaverMapCategory, NaverMapCategory, QFilterCondition> {}

extension NaverMapCategoryQuerySortBy
    on QueryBuilder<NaverMapCategory, NaverMapCategory, QSortBy> {}

extension NaverMapCategoryQuerySortThenBy
    on QueryBuilder<NaverMapCategory, NaverMapCategory, QSortThenBy> {
  QueryBuilder<NaverMapCategory, NaverMapCategory, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<NaverMapCategory, NaverMapCategory, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension NaverMapCategoryQueryWhereDistinct
    on QueryBuilder<NaverMapCategory, NaverMapCategory, QDistinct> {}

extension NaverMapCategoryQueryProperty
    on QueryBuilder<NaverMapCategory, NaverMapCategory, QQueryProperty> {
  QueryBuilder<NaverMapCategory, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<NaverMapCategory, List<NaverMapCategoryContent>?,
      QQueryOperations> categoriesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'categories');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const NaverMapCategoryContentSchema = Schema(
  name: r'NaverMapCategoryContent',
  id: 5916351071141453218,
  properties: {
    r'category': PropertySchema(
      id: 0,
      name: r'category',
      type: IsarType.string,
    )
  },
  estimateSize: _naverMapCategoryContentEstimateSize,
  serialize: _naverMapCategoryContentSerialize,
  deserialize: _naverMapCategoryContentDeserialize,
  deserializeProp: _naverMapCategoryContentDeserializeProp,
);

int _naverMapCategoryContentEstimateSize(
  NaverMapCategoryContent object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.category;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _naverMapCategoryContentSerialize(
  NaverMapCategoryContent object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.category);
}

NaverMapCategoryContent _naverMapCategoryContentDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NaverMapCategoryContent(
    category: reader.readStringOrNull(offsets[0]),
  );
  return object;
}

P _naverMapCategoryContentDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension NaverMapCategoryContentQueryFilter on QueryBuilder<
    NaverMapCategoryContent, NaverMapCategoryContent, QFilterCondition> {
  QueryBuilder<NaverMapCategoryContent, NaverMapCategoryContent,
      QAfterFilterCondition> categoryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'category',
      ));
    });
  }

  QueryBuilder<NaverMapCategoryContent, NaverMapCategoryContent,
      QAfterFilterCondition> categoryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'category',
      ));
    });
  }

  QueryBuilder<NaverMapCategoryContent, NaverMapCategoryContent,
      QAfterFilterCondition> categoryEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapCategoryContent, NaverMapCategoryContent,
      QAfterFilterCondition> categoryGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapCategoryContent, NaverMapCategoryContent,
      QAfterFilterCondition> categoryLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapCategoryContent, NaverMapCategoryContent,
      QAfterFilterCondition> categoryBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'category',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapCategoryContent, NaverMapCategoryContent,
      QAfterFilterCondition> categoryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapCategoryContent, NaverMapCategoryContent,
      QAfterFilterCondition> categoryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapCategoryContent, NaverMapCategoryContent,
          QAfterFilterCondition>
      categoryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapCategoryContent, NaverMapCategoryContent,
          QAfterFilterCondition>
      categoryMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'category',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NaverMapCategoryContent, NaverMapCategoryContent,
      QAfterFilterCondition> categoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<NaverMapCategoryContent, NaverMapCategoryContent,
      QAfterFilterCondition> categoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'category',
        value: '',
      ));
    });
  }
}

extension NaverMapCategoryContentQueryObject on QueryBuilder<
    NaverMapCategoryContent, NaverMapCategoryContent, QFilterCondition> {}
