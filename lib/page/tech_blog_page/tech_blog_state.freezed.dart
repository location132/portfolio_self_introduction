// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tech_blog_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$TechBlogState {
  bool get isMenuClicked => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  List<BlogPost> get blogPosts => throw _privateConstructorUsedError;
  List<BlogPost> get filteredPosts => throw _privateConstructorUsedError;
  String get searchQuery => throw _privateConstructorUsedError;
  String get selectedCategory => throw _privateConstructorUsedError;

  /// Create a copy of TechBlogState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TechBlogStateCopyWith<TechBlogState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TechBlogStateCopyWith<$Res> {
  factory $TechBlogStateCopyWith(
    TechBlogState value,
    $Res Function(TechBlogState) then,
  ) = _$TechBlogStateCopyWithImpl<$Res, TechBlogState>;
  @useResult
  $Res call({
    bool isMenuClicked,
    bool isLoading,
    List<BlogPost> blogPosts,
    List<BlogPost> filteredPosts,
    String searchQuery,
    String selectedCategory,
  });
}

/// @nodoc
class _$TechBlogStateCopyWithImpl<$Res, $Val extends TechBlogState>
    implements $TechBlogStateCopyWith<$Res> {
  _$TechBlogStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TechBlogState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isMenuClicked = null,
    Object? isLoading = null,
    Object? blogPosts = null,
    Object? filteredPosts = null,
    Object? searchQuery = null,
    Object? selectedCategory = null,
  }) {
    return _then(
      _value.copyWith(
            isMenuClicked:
                null == isMenuClicked
                    ? _value.isMenuClicked
                    : isMenuClicked // ignore: cast_nullable_to_non_nullable
                        as bool,
            isLoading:
                null == isLoading
                    ? _value.isLoading
                    : isLoading // ignore: cast_nullable_to_non_nullable
                        as bool,
            blogPosts:
                null == blogPosts
                    ? _value.blogPosts
                    : blogPosts // ignore: cast_nullable_to_non_nullable
                        as List<BlogPost>,
            filteredPosts:
                null == filteredPosts
                    ? _value.filteredPosts
                    : filteredPosts // ignore: cast_nullable_to_non_nullable
                        as List<BlogPost>,
            searchQuery:
                null == searchQuery
                    ? _value.searchQuery
                    : searchQuery // ignore: cast_nullable_to_non_nullable
                        as String,
            selectedCategory:
                null == selectedCategory
                    ? _value.selectedCategory
                    : selectedCategory // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TechBlogStateImplCopyWith<$Res>
    implements $TechBlogStateCopyWith<$Res> {
  factory _$$TechBlogStateImplCopyWith(
    _$TechBlogStateImpl value,
    $Res Function(_$TechBlogStateImpl) then,
  ) = __$$TechBlogStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool isMenuClicked,
    bool isLoading,
    List<BlogPost> blogPosts,
    List<BlogPost> filteredPosts,
    String searchQuery,
    String selectedCategory,
  });
}

/// @nodoc
class __$$TechBlogStateImplCopyWithImpl<$Res>
    extends _$TechBlogStateCopyWithImpl<$Res, _$TechBlogStateImpl>
    implements _$$TechBlogStateImplCopyWith<$Res> {
  __$$TechBlogStateImplCopyWithImpl(
    _$TechBlogStateImpl _value,
    $Res Function(_$TechBlogStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TechBlogState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isMenuClicked = null,
    Object? isLoading = null,
    Object? blogPosts = null,
    Object? filteredPosts = null,
    Object? searchQuery = null,
    Object? selectedCategory = null,
  }) {
    return _then(
      _$TechBlogStateImpl(
        isMenuClicked:
            null == isMenuClicked
                ? _value.isMenuClicked
                : isMenuClicked // ignore: cast_nullable_to_non_nullable
                    as bool,
        isLoading:
            null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                    as bool,
        blogPosts:
            null == blogPosts
                ? _value._blogPosts
                : blogPosts // ignore: cast_nullable_to_non_nullable
                    as List<BlogPost>,
        filteredPosts:
            null == filteredPosts
                ? _value._filteredPosts
                : filteredPosts // ignore: cast_nullable_to_non_nullable
                    as List<BlogPost>,
        searchQuery:
            null == searchQuery
                ? _value.searchQuery
                : searchQuery // ignore: cast_nullable_to_non_nullable
                    as String,
        selectedCategory:
            null == selectedCategory
                ? _value.selectedCategory
                : selectedCategory // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$TechBlogStateImpl implements _TechBlogState {
  const _$TechBlogStateImpl({
    this.isMenuClicked = false,
    this.isLoading = false,
    final List<BlogPost> blogPosts = const [],
    final List<BlogPost> filteredPosts = const [],
    this.searchQuery = '',
    this.selectedCategory = 'all',
  }) : _blogPosts = blogPosts,
       _filteredPosts = filteredPosts;

  @override
  @JsonKey()
  final bool isMenuClicked;
  @override
  @JsonKey()
  final bool isLoading;
  final List<BlogPost> _blogPosts;
  @override
  @JsonKey()
  List<BlogPost> get blogPosts {
    if (_blogPosts is EqualUnmodifiableListView) return _blogPosts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_blogPosts);
  }

  final List<BlogPost> _filteredPosts;
  @override
  @JsonKey()
  List<BlogPost> get filteredPosts {
    if (_filteredPosts is EqualUnmodifiableListView) return _filteredPosts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filteredPosts);
  }

  @override
  @JsonKey()
  final String searchQuery;
  @override
  @JsonKey()
  final String selectedCategory;

  @override
  String toString() {
    return 'TechBlogState(isMenuClicked: $isMenuClicked, isLoading: $isLoading, blogPosts: $blogPosts, filteredPosts: $filteredPosts, searchQuery: $searchQuery, selectedCategory: $selectedCategory)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TechBlogStateImpl &&
            (identical(other.isMenuClicked, isMenuClicked) ||
                other.isMenuClicked == isMenuClicked) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(
              other._blogPosts,
              _blogPosts,
            ) &&
            const DeepCollectionEquality().equals(
              other._filteredPosts,
              _filteredPosts,
            ) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.selectedCategory, selectedCategory) ||
                other.selectedCategory == selectedCategory));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    isMenuClicked,
    isLoading,
    const DeepCollectionEquality().hash(_blogPosts),
    const DeepCollectionEquality().hash(_filteredPosts),
    searchQuery,
    selectedCategory,
  );

  /// Create a copy of TechBlogState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TechBlogStateImplCopyWith<_$TechBlogStateImpl> get copyWith =>
      __$$TechBlogStateImplCopyWithImpl<_$TechBlogStateImpl>(this, _$identity);
}

abstract class _TechBlogState implements TechBlogState {
  const factory _TechBlogState({
    final bool isMenuClicked,
    final bool isLoading,
    final List<BlogPost> blogPosts,
    final List<BlogPost> filteredPosts,
    final String searchQuery,
    final String selectedCategory,
  }) = _$TechBlogStateImpl;

  @override
  bool get isMenuClicked;
  @override
  bool get isLoading;
  @override
  List<BlogPost> get blogPosts;
  @override
  List<BlogPost> get filteredPosts;
  @override
  String get searchQuery;
  @override
  String get selectedCategory;

  /// Create a copy of TechBlogState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TechBlogStateImplCopyWith<_$TechBlogStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BlogPost {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  bool get isPublished => throw _privateConstructorUsedError;

  /// Create a copy of BlogPost
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BlogPostCopyWith<BlogPost> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlogPostCopyWith<$Res> {
  factory $BlogPostCopyWith(BlogPost value, $Res Function(BlogPost) then) =
      _$BlogPostCopyWithImpl<$Res, BlogPost>;
  @useResult
  $Res call({
    String id,
    String title,
    String description,
    String date,
    String content,
    List<String> tags,
    bool isPublished,
  });
}

/// @nodoc
class _$BlogPostCopyWithImpl<$Res, $Val extends BlogPost>
    implements $BlogPostCopyWith<$Res> {
  _$BlogPostCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BlogPost
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? date = null,
    Object? content = null,
    Object? tags = null,
    Object? isPublished = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            title:
                null == title
                    ? _value.title
                    : title // ignore: cast_nullable_to_non_nullable
                        as String,
            description:
                null == description
                    ? _value.description
                    : description // ignore: cast_nullable_to_non_nullable
                        as String,
            date:
                null == date
                    ? _value.date
                    : date // ignore: cast_nullable_to_non_nullable
                        as String,
            content:
                null == content
                    ? _value.content
                    : content // ignore: cast_nullable_to_non_nullable
                        as String,
            tags:
                null == tags
                    ? _value.tags
                    : tags // ignore: cast_nullable_to_non_nullable
                        as List<String>,
            isPublished:
                null == isPublished
                    ? _value.isPublished
                    : isPublished // ignore: cast_nullable_to_non_nullable
                        as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BlogPostImplCopyWith<$Res>
    implements $BlogPostCopyWith<$Res> {
  factory _$$BlogPostImplCopyWith(
    _$BlogPostImpl value,
    $Res Function(_$BlogPostImpl) then,
  ) = __$$BlogPostImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String title,
    String description,
    String date,
    String content,
    List<String> tags,
    bool isPublished,
  });
}

/// @nodoc
class __$$BlogPostImplCopyWithImpl<$Res>
    extends _$BlogPostCopyWithImpl<$Res, _$BlogPostImpl>
    implements _$$BlogPostImplCopyWith<$Res> {
  __$$BlogPostImplCopyWithImpl(
    _$BlogPostImpl _value,
    $Res Function(_$BlogPostImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BlogPost
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? date = null,
    Object? content = null,
    Object? tags = null,
    Object? isPublished = null,
  }) {
    return _then(
      _$BlogPostImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        title:
            null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                    as String,
        description:
            null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                    as String,
        date:
            null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                    as String,
        content:
            null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                    as String,
        tags:
            null == tags
                ? _value._tags
                : tags // ignore: cast_nullable_to_non_nullable
                    as List<String>,
        isPublished:
            null == isPublished
                ? _value.isPublished
                : isPublished // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc

class _$BlogPostImpl implements _BlogPost {
  const _$BlogPostImpl({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.content,
    final List<String> tags = const [],
    this.isPublished = false,
  }) : _tags = tags;

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final String date;
  @override
  final String content;
  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  @JsonKey()
  final bool isPublished;

  @override
  String toString() {
    return 'BlogPost(id: $id, title: $title, description: $description, date: $date, content: $content, tags: $tags, isPublished: $isPublished)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BlogPostImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.content, content) || other.content == content) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.isPublished, isPublished) ||
                other.isPublished == isPublished));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    description,
    date,
    content,
    const DeepCollectionEquality().hash(_tags),
    isPublished,
  );

  /// Create a copy of BlogPost
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BlogPostImplCopyWith<_$BlogPostImpl> get copyWith =>
      __$$BlogPostImplCopyWithImpl<_$BlogPostImpl>(this, _$identity);
}

abstract class _BlogPost implements BlogPost {
  const factory _BlogPost({
    required final String id,
    required final String title,
    required final String description,
    required final String date,
    required final String content,
    final List<String> tags,
    final bool isPublished,
  }) = _$BlogPostImpl;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  String get date;
  @override
  String get content;
  @override
  List<String> get tags;
  @override
  bool get isPublished;

  /// Create a copy of BlogPost
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BlogPostImplCopyWith<_$BlogPostImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
