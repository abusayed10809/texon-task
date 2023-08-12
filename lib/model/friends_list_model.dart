class FriendsListModel {
  List<FriendModel>? results;
  Info? info;

  FriendsListModel({this.results, this.info});

  FriendsListModel.fromJson(Map<String, dynamic> json) {
    try {
      if (json['results'] != null) {
        results = <FriendModel>[];
        json['results'].forEach((v) {
          results!.add(FriendModel.fromJson(v));
        });
      }
      info = json['info'] != null ? Info.fromJson(json['info']) : null;
    } catch (error) {
      print("friends model list error: $error");
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    if (info != null) {
      data['info'] = info!.toJson();
    }
    return data;
  }
}

class FriendModel {
  String? gender;
  Name? name;
  Location? location;
  String? email;
  Login? login;
  Dob? dob;
  Dob? registered;
  String? phone;
  String? cell;
  Id? id;
  Picture? picture;
  String? nat;

  FriendModel({
    this.gender,
    this.name,
    this.location,
    this.email,
    this.login,
    this.dob,
    this.registered,
    this.phone,
    this.cell,
    this.id,
    this.picture,
    this.nat,
  });

  FriendModel.fromJson(Map<String, dynamic> json) {
    try {
      gender = json['gender'];
      name = json['name'] != null ? Name.fromJson(json['name']) : null;
      location = json['location'] != null ? Location.fromJson(json['location']) : null;
      email = json['email'];
      login = json['login'] != null ? Login.fromJson(json['login']) : null;
      dob = json['dob'] != null ? Dob.fromJson(json['dob']) : null;
      registered = json['registered'] != null ? Dob.fromJson(json['registered']) : null;
      phone = json['phone'];
      cell = json['cell'];
      id = json['id'] != null ? Id.fromJson(json['id']) : null;
      picture = json['picture'] != null ? Picture.fromJson(json['picture']) : null;
      nat = json['nat'];
    } catch (error) {
      print('friend model error: $error');
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['gender'] = gender;
    if (name != null) {
      data['name'] = name!.toJson();
    }
    if (location != null) {
      data['location'] = location!.toJson();
    }
    data['email'] = email;
    if (login != null) {
      data['login'] = login!.toJson();
    }
    if (dob != null) {
      data['dob'] = dob!.toJson();
    }
    if (registered != null) {
      data['registered'] = registered!.toJson();
    }
    data['phone'] = phone;
    data['cell'] = cell;
    if (id != null) {
      data['id'] = id!.toJson();
    }
    if (picture != null) {
      data['picture'] = picture!.toJson();
    }
    data['nat'] = nat;
    return data;
  }
}

class Name {
  String? title;
  String? first;
  String? last;

  Name({this.title, this.first, this.last});

  Name.fromJson(Map<String, dynamic> json) {
    try{
      title = json['title'];
      first = json['first'];
      last = json['last'];
    } catch(error){
      print('name model error: $error');
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['first'] = first;
    data['last'] = last;
    return data;
  }
}

class Location {
  Street? street;
  String? city;
  String? state;
  String? country;
  String? postcode;
  Coordinates? coordinates;
  Timezone? timezone;

  Location({this.street, this.city, this.state, this.country, this.postcode, this.coordinates, this.timezone});

  Location.fromJson(Map<String, dynamic> json) {
    try{
      street = json['street'] != null ? Street.fromJson(json['street']) : null;
      city = json['city'];
      state = json['state'];
      country = json['country'];
      if (json['postcode'] != null) {
        postcode = (json['postcode'].toString());
      }
      coordinates = json['coordinates'] != null ? Coordinates.fromJson(json['coordinates']) : null;
      timezone = json['timezone'] != null ? Timezone.fromJson(json['timezone']) : null;
    } catch(error){
      print('location model error: $error');
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (street != null) {
      data['street'] = street!.toJson();
    }
    data['city'] = city;
    data['state'] = state;
    data['country'] = country;
    data['postcode'] = postcode;
    if (coordinates != null) {
      data['coordinates'] = coordinates!.toJson();
    }
    if (timezone != null) {
      data['timezone'] = timezone!.toJson();
    }
    return data;
  }
}

class Street {
  int? number;
  String? name;

  Street({this.number, this.name});

  Street.fromJson(Map<String, dynamic> json) {
    try {
      number = json['number'];
      name = json['name'];
    } catch (error) {
      print('street model error: $error');
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['number'] = number;
    data['name'] = name;
    return data;
  }
}

class Coordinates {
  String? latitude;
  String? longitude;

  Coordinates({this.latitude, this.longitude});

  Coordinates.fromJson(Map<String, dynamic> json) {
    try{
      latitude = json['latitude'];
      longitude = json['longitude'];
    } catch(error){
      print('coordinate model error: $error');
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}

class Timezone {
  String? offset;
  String? description;

  Timezone({this.offset, this.description});

  Timezone.fromJson(Map<String, dynamic> json) {
    try{
      offset = json['offset'];
      description = json['description'];
    } catch(error){
      print('timezone model error: $error');
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['offset'] = offset;
    data['description'] = description;
    return data;
  }
}

class Login {
  String? uuid;
  String? username;
  String? password;
  String? salt;
  String? md5;
  String? sha1;
  String? sha256;

  Login({this.uuid, this.username, this.password, this.salt, this.md5, this.sha1, this.sha256});

  Login.fromJson(Map<String, dynamic> json) {
    try{
      uuid = json['uuid'];
      username = json['username'];
      password = json['password'];
      salt = json['salt'];
      md5 = json['md5'];
      sha1 = json['sha1'];
      sha256 = json['sha256'];
    } catch(error){
      print('login model error: $error');
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uuid'] = uuid;
    data['username'] = username;
    data['password'] = password;
    data['salt'] = salt;
    data['md5'] = md5;
    data['sha1'] = sha1;
    data['sha256'] = sha256;
    return data;
  }
}

class Dob {
  String? date;
  int? age;

  Dob({this.date, this.age});

  Dob.fromJson(Map<String, dynamic> json) {
    try {
      date = json['date'];
      age = json['age'];
    } catch (error) {
      print('dob model error: $error');
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['age'] = age;
    return data;
  }
}

class Id {
  String? name;
  String? value;

  Id({this.name, this.value});

  Id.fromJson(Map<String, dynamic> json) {
    try{
      name = json['name'];
      value = json['value'];
    } catch(error){
      print('id model error: $error');
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['value'] = value;
    return data;
  }
}

class Picture {
  String? large;
  String? medium;
  String? thumbnail;

  Picture({this.large, this.medium, this.thumbnail});

  Picture.fromJson(Map<String, dynamic> json) {
    try{
      large = json['large'];
      medium = json['medium'];
      thumbnail = json['thumbnail'];
    } catch(error){
      print('picture model error: $error');
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['large'] = large;
    data['medium'] = medium;
    data['thumbnail'] = thumbnail;
    return data;
  }
}

class Info {
  String? seed;
  int? results;
  int? page;
  String? version;

  Info({this.seed, this.results, this.page, this.version});

  Info.fromJson(Map<String, dynamic> json) {
    try {
      seed = json['seed'];
      results = json['results'];
      page = json['page'];
      version = json['version'];
    } catch (error) {
      print('info model error: $error');
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['seed'] = seed;
    data['results'] = results;
    data['page'] = page;
    data['version'] = version;
    return data;
  }
}
