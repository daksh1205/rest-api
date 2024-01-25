class UserLocation {
  final String city;
  final String state;
  final String country;
  final String postcode;
  final UserStreet street;
  final UserCoordinate coordinates;
  final UserTimezone timezone;

  UserLocation({
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
    required this.street,
    required this.coordinates,
    required this.timezone,
  });
}

class UserCoordinate {
  final String latitude;
  final String longitude;
  UserCoordinate({
    required this.latitude,
    required this.longitude,
  });
}

class UserTimezone {
  final String offset;
  final String description;
  UserTimezone({
    required this.offset,
    required this.description,
  });
}

class UserStreet {
  final int number;
  final String name;
  UserStreet({
    required this.name,
    required this.number,
  });


}
