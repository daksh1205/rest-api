import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rest_api/models/user.dart';
import 'package:rest_api/models/user_dob.dart';
import 'package:rest_api/models/user_location.dart';
import 'package:rest_api/models/user_name.dart';

class UserApi {
  static Future<List<User>> fetchUsers() async {
    print('fetchUsers called');
    const url = 'https://randomuser.me/api/?results=100';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;
    final users = results.map((e) {
      final name = UserName(
        title: e['name']['title'],
        first: e['name']['first'],
        last: e['name']['last'],
      );
      final date = e['dob']['date'];
      final dob = UserDob(
        date: DateTime.parse(date),
        age: e['dob']['age'],
      );

      final coordinates = UserCoordinate(
        latitude: e['location']['coordinates']['latitude'],
        longitude: e['location']['coordinates']['longitude'],
      );
      final street = UserStreet(
        name: e['location']['street']['name'],
        number: e['location']['street']['number'],
      );
      final timezone = UserTimezone(
        offset: e['location']['timezone']['offset'],
        description: e['location']['timezone']['description'],
      );

      final location = UserLocation(
        city: e['location']['city'],
        country: e['location']['country'],
        postcode: e['location']['postcode'].toString(),
        state: e['location']['state'],
        coordinates: coordinates,
        street: street,
        timezone: timezone,
      );
      return User(
        gender: e['gender'],
        email: e['email'],
        phone: e['phone'],
        cell: e['cell'],
        nat: e['nat'],
        name: name,
        dob: dob,
        location: location,
      );
    }).toList();
    return users;
  }
}
