class googleResul {
  List<Null>? _htmlAttributions;
  String? _nextPageToken;
  late final List<Results> _results;
  String? _status;

  googleResul(
      {List<Null>? htmlAttributions,
      String? nextPageToken,
      List<Results>? results,
      String? status}) {
    if (htmlAttributions != null) {
      this._htmlAttributions = htmlAttributions;
    }
    if (nextPageToken != null) {
      this._nextPageToken = nextPageToken;
    }
    if (results != null) {
      this._results = results;
    }
    if (status != null) {
      this._status = status;
    }
  }

  List<Null>? get htmlAttributions => _htmlAttributions;
  set htmlAttributions(List<Null>? htmlAttributions) =>
      _htmlAttributions = htmlAttributions;
  String? get nextPageToken => _nextPageToken;
  set nextPageToken(String? nextPageToken) => _nextPageToken = nextPageToken;
  List<Results> get results => _results;
  set results(List<Results> results) => _results = results;
  String? get status => _status;
  set status(String? status) => _status = status;

  googleResul.fromJson(Map<String, dynamic> json) {
    if (json['html_attributions'] != null) {
      _htmlAttributions = <Null>[];
    }
    _nextPageToken = json['next_page_token'];
    if (json['results'] != null) {
      _results = <Results>[];
      json['results'].forEach((v) {
        _results.add(new Results.fromJson(v));
      });
    }
    _status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._htmlAttributions != null) {
      data['html_attributions'] = <Null>[];
    }
    data['next_page_token'] = this._nextPageToken;
    if (this._results != null) {
      data['results'] = this._results.map((v) => v.toJson()).toList();
    }
    data['status'] = this._status;
    return data;
  }
}

class Results {
  String? _businessStatus;
  Geometry? _geometry;
  String? _icon;
  String? _iconBackgroundColor;
  String? _iconMaskBaseUri;
  String? _name;
  OpeningHours? _openingHours;
  List<Photos>? _photos;
  String? _placeId;
  PlusCode? _plusCode;
  int? _priceLevel;
  double? _rating;
  String? _reference;
  String? _scope;
  List<String>? _types;
  int? _userRatingsTotal;
  String? _vicinity;

  Results(
      {String? businessStatus,
      Geometry? geometry,
      String? icon,
      String? iconBackgroundColor,
      String? iconMaskBaseUri,
      String? name,
      OpeningHours? openingHours,
      List<Photos>? photos,
      String? placeId,
      PlusCode? plusCode,
      int? priceLevel,
      double? rating,
      String? reference,
      String? scope,
      List<String>? types,
      int? userRatingsTotal,
      String? vicinity}) {
    if (businessStatus != null) {
      this._businessStatus = businessStatus;
    }
    if (geometry != null) {
      this._geometry = geometry;
    }
    if (icon != null) {
      this._icon = icon;
    }
    if (iconBackgroundColor != null) {
      this._iconBackgroundColor = iconBackgroundColor;
    }
    if (iconMaskBaseUri != null) {
      this._iconMaskBaseUri = iconMaskBaseUri;
    }
    if (name != null) {
      this._name = name;
    }
    if (openingHours != null) {
      this._openingHours = openingHours;
    }
    if (photos != null) {
      this._photos = photos;
    }
    if (placeId != null) {
      this._placeId = placeId;
    }
    if (plusCode != null) {
      this._plusCode = plusCode;
    }
    if (priceLevel != null) {
      this._priceLevel = priceLevel;
    }
    if (rating != null) {
      this._rating = rating;
    }
    if (reference != null) {
      this._reference = reference;
    }
    if (scope != null) {
      this._scope = scope;
    }
    if (types != null) {
      this._types = types;
    }
    if (userRatingsTotal != null) {
      this._userRatingsTotal = userRatingsTotal;
    }
    if (vicinity != null) {
      this._vicinity = vicinity;
    }
  }

  String? get businessStatus => _businessStatus;
  set businessStatus(String? businessStatus) =>
      _businessStatus = businessStatus;
  Geometry? get geometry => _geometry;
  set geometry(Geometry? geometry) => _geometry = geometry;
  String? get icon => _icon;
  set icon(String? icon) => _icon = icon;
  String? get iconBackgroundColor => _iconBackgroundColor;
  set iconBackgroundColor(String? iconBackgroundColor) =>
      _iconBackgroundColor = iconBackgroundColor;
  String? get iconMaskBaseUri => _iconMaskBaseUri;
  set iconMaskBaseUri(String? iconMaskBaseUri) =>
      _iconMaskBaseUri = iconMaskBaseUri;
  String? get name => _name;
  set name(String? name) => _name = name;
  OpeningHours? get openingHours => _openingHours;
  set openingHours(OpeningHours? openingHours) => _openingHours = openingHours;
  List<Photos>? get photos => _photos;
  set photos(List<Photos>? photos) => _photos = photos;
  String? get placeId => _placeId;
  set placeId(String? placeId) => _placeId = placeId;
  PlusCode? get plusCode => _plusCode;
  set plusCode(PlusCode? plusCode) => _plusCode = plusCode;
  int? get priceLevel => _priceLevel;
  set priceLevel(int? priceLevel) => _priceLevel = priceLevel;
  double? get rating => _rating;
  set rating(double? rating) => _rating = rating;
  String? get reference => _reference;
  set reference(String? reference) => _reference = reference;
  String? get scope => _scope;
  set scope(String? scope) => _scope = scope;
  List<String>? get types => _types;
  set types(List<String>? types) => _types = types;
  int? get userRatingsTotal => _userRatingsTotal;
  set userRatingsTotal(int? userRatingsTotal) =>
      _userRatingsTotal = userRatingsTotal;
  String? get vicinity => _vicinity;
  set vicinity(String? vicinity) => _vicinity = vicinity;

  Results.fromJson(Map<String, dynamic> json) {
    _businessStatus = json['business_status'];
    _geometry = json['geometry'] != null
        ? new Geometry.fromJson(json['geometry'])
        : null;
    _icon = json['icon'];
    _iconBackgroundColor = json['icon_background_color'];
    _iconMaskBaseUri = json['icon_mask_base_uri'];
    _name = json['name'];
    _openingHours = json['opening_hours'] != null
        ? new OpeningHours.fromJson(json['opening_hours'])
        : null;
    if (json['photos'] != null) {
      _photos = <Photos>[];
      json['photos'].forEach((v) {
        _photos!.add(new Photos.fromJson(v));
      });
    }
    _placeId = json['place_id'];
    _plusCode = json['plus_code'] != null
        ? new PlusCode.fromJson(json['plus_code'])
        : null;
    _priceLevel = json['price_level'];
    _rating = json['rating'];
    _reference = json['reference'];
    _scope = json['scope'];
    _types = json['types'].cast<String>();
    _userRatingsTotal = json['user_ratings_total'];
    _vicinity = json['vicinity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['business_status'] = this._businessStatus;
    if (this._geometry != null) {
      data['geometry'] = this._geometry!.toJson();
    }
    data['icon'] = this._icon;
    data['icon_background_color'] = this._iconBackgroundColor;
    data['icon_mask_base_uri'] = this._iconMaskBaseUri;
    data['name'] = this._name;
    if (this._openingHours != null) {
      data['opening_hours'] = this._openingHours!.toJson();
    }
    if (this._photos != null) {
      data['photos'] = this._photos!.map((v) => v.toJson()).toList();
    }
    data['place_id'] = this._placeId;
    if (this._plusCode != null) {
      data['plus_code'] = this._plusCode!.toJson();
    }
    data['price_level'] = this._priceLevel;
    data['rating'] = this._rating;
    data['reference'] = this._reference;
    data['scope'] = this._scope;
    data['types'] = this._types;
    data['user_ratings_total'] = this._userRatingsTotal;
    data['vicinity'] = this._vicinity;
    return data;
  }
}

class Geometry {
  Location? _location;
  Viewport? _viewport;

  Geometry({Location? location, Viewport? viewport}) {
    if (location != null) {
      this._location = location;
    }
    if (viewport != null) {
      this._viewport = viewport;
    }
  }

  Location? get location => _location;
  set location(Location? location) => _location = location;
  Viewport? get viewport => _viewport;
  set viewport(Viewport? viewport) => _viewport = viewport;

  Geometry.fromJson(Map<String, dynamic> json) {
    _location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    _viewport = json['viewport'] != null
        ? new Viewport.fromJson(json['viewport'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._location != null) {
      data['location'] = this._location!.toJson();
    }
    if (this._viewport != null) {
      data['viewport'] = this._viewport!.toJson();
    }
    return data;
  }
}

class Location {
  double? _lat;
  double? _lng;

  Location({double? lat, double? lng}) {
    if (lat != null) {
      this._lat = lat;
    }
    if (lng != null) {
      this._lng = lng;
    }
  }

  double? get lat => _lat;
  set lat(double? lat) => _lat = lat;
  double? get lng => _lng;
  set lng(double? lng) => _lng = lng;

  Location.fromJson(Map<String, dynamic> json) {
    _lat = json['lat'];
    _lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this._lat;
    data['lng'] = this._lng;
    return data;
  }
}

class Viewport {
  Location? _northeast;
  Location? _southwest;

  Viewport({Location? northeast, Location? southwest}) {
    if (northeast != null) {
      this._northeast = northeast;
    }
    if (southwest != null) {
      this._southwest = southwest;
    }
  }

  Location? get northeast => _northeast;
  set northeast(Location? northeast) => _northeast = northeast;
  Location? get southwest => _southwest;
  set southwest(Location? southwest) => _southwest = southwest;

  Viewport.fromJson(Map<String, dynamic> json) {
    _northeast = json['northeast'] != null
        ? new Location.fromJson(json['northeast'])
        : null;
    _southwest = json['southwest'] != null
        ? new Location.fromJson(json['southwest'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._northeast != null) {
      data['northeast'] = this._northeast!.toJson();
    }
    if (this._southwest != null) {
      data['southwest'] = this._southwest!.toJson();
    }
    return data;
  }
}

class OpeningHours {
  bool? _openNow;

  OpeningHours({bool? openNow}) {
    if (openNow != null) {
      this._openNow = openNow;
    }
  }

  bool? get openNow => _openNow;
  set openNow(bool? openNow) => _openNow = openNow;

  OpeningHours.fromJson(Map<String, dynamic> json) {
    _openNow = json['open_now'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['open_now'] = this._openNow;
    return data;
  }
}

class Photos {
  int? _height;
  List<String>? _htmlAttributions;
  String? _photoReference;
  int? _width;

  Photos(
      {int? height,
      List<String>? htmlAttributions,
      String? photoReference,
      int? width}) {
    if (height != null) {
      this._height = height;
    }
    if (htmlAttributions != null) {
      this._htmlAttributions = htmlAttributions;
    }
    if (photoReference != null) {
      this._photoReference = photoReference;
    }
    if (width != null) {
      this._width = width;
    }
  }

  int? get height => _height;
  set height(int? height) => _height = height;
  List<String>? get htmlAttributions => _htmlAttributions;
  set htmlAttributions(List<String>? htmlAttributions) =>
      _htmlAttributions = htmlAttributions;
  String? get photoReference => _photoReference;
  set photoReference(String? photoReference) =>
      _photoReference = photoReference;
  int? get width => _width;
  set width(int? width) => _width = width;

  Photos.fromJson(Map<String, dynamic> json) {
    _height = json['height'];
    _htmlAttributions = json['html_attributions'].cast<String>();
    _photoReference = json['photo_reference'];
    _width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['height'] = this._height;
    data['html_attributions'] = this._htmlAttributions;
    data['photo_reference'] = this._photoReference;
    data['width'] = this._width;
    return data;
  }
}

class PlusCode {
  String? _compoundCode;
  String? _globalCode;

  PlusCode({String? compoundCode, String? globalCode}) {
    if (compoundCode != null) {
      this._compoundCode = compoundCode;
    }
    if (globalCode != null) {
      this._globalCode = globalCode;
    }
  }

  String? get compoundCode => _compoundCode;
  set compoundCode(String? compoundCode) => _compoundCode = compoundCode;
  String? get globalCode => _globalCode;
  set globalCode(String? globalCode) => _globalCode = globalCode;

  PlusCode.fromJson(Map<String, dynamic> json) {
    _compoundCode = json['compound_code'];
    _globalCode = json['global_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['compound_code'] = this._compoundCode;
    data['global_code'] = this._globalCode;
    return data;
  }
}
