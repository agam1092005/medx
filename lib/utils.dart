// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_keychain/flutter_keychain.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:medx/AdditionalFiles/constants.dart';

final FirebaseAuth auth = FirebaseAuth.instance;

Future<String> Glogin() async {
  final GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: ['email'],
  );

  final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleAuth =
      await googleUser!.authentication;

  final AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  auth.idTokenChanges();

  await auth.signInWithCredential(credential);

  var idToken;

  idToken =
  await auth.currentUser?.getIdToken(true);

  var UserIdToken = idToken.toString();

  return UserIdToken;
}

const baseUrl = "https://api.medx.org.in";

// const baseUrl = "http://10.0.2.2:8080";

Future VerifyUser(idToken) async {
  final url = Uri.parse('$baseUrl/auth/google');

  final headers = {
    'authorization': 'Bearer $idToken',
    'Content-Type': 'application/json',
  };

  final response = await http.post(
    url,
    headers: headers,
  );

  final responseBody = jsonDecode(response.body);
  return [response.statusCode, responseBody];
}

Future SendUserDetails(
  bloodType,
  dob,
  gender,
  height,
  weight,
  emergencyName,
  emergencyPhone,
  emergencyRelation,
) async {
  final url = Uri.parse('$baseUrl/user/additional-details');

  var jwt = await FlutterKeychain.get(key: "jwt");
  final headers = {
    'authorization': 'Bearer $jwt',
    'Content-Type': 'application/json',
  };

  final body = jsonEncode({
    "bloodType": bloodType,
    "dob": dob,
    "gender": gender,
    "height": height,
    "weight": weight,
    "emergencyName": emergencyName,
    "emergencyPhone": emergencyPhone,
    "emergencyRelationship": emergencyRelation
  });

  final response = await http.put(url, headers: headers, body: body);

  final responseBody = jsonDecode(response.body);
  return [response.statusCode, responseBody];
}

Future CreateAppointment(
  doctorId,
  date,
) async {
  final url = Uri.parse('$baseUrl/appointment/new');

  var jwt = await FlutterKeychain.get(key: "jwt");
  final headers = {
    'authorization': 'Bearer $jwt',
    'Content-Type': 'application/json',
  };

  final body = jsonEncode({"doctorId": doctorId, "date": date});

  final response = await http.post(url, headers: headers, body: body);

  final responseBody = jsonDecode(response.body);
  return [response.statusCode, responseBody];
}

Future SearchSymptoms(symptom) async {
  final url = Uri.parse('$baseUrl/search/symptom');

  var jwt = await FlutterKeychain.get(key: "jwt");
  final headers = {
    'authorization': 'Bearer $jwt',
    'Content-Type': 'application/json',
  };

  final body = jsonEncode({
    "symptom": symptom,
  });

  final response = await http.post(url, headers: headers, body: body);

  final responseBody = jsonDecode(response.body);
  return [response.statusCode, responseBody];
}

Future CreateMedicalRecord(base64) async {
  final url = Uri.parse('$baseUrl/history/new');

  var jwt = await FlutterKeychain.get(key: "jwt");
  final headers = {
    'authorization': 'Bearer $jwt',
    'Content-Type': 'application/json',
  };

  final body = jsonEncode({
    "picture": base64,
  });

  final response = await http.post(url, headers: headers, body: body);

  final responseBody = jsonDecode(response.body);
  return [response.statusCode, responseBody];
}

Future GetSlots(
  docID,
) async {
  final url = Uri.parse('$baseUrl/appointment/slots/$docID');

  var jwt = await FlutterKeychain.get(key: "jwt");
  final headers = {
    'authorization': 'Bearer $jwt',
    'Content-Type': 'application/json',
  };

  final response = await http.get(
    url,
    headers: headers,
  );

  final responseBody = jsonDecode(response.body);
  return [response.statusCode, responseBody];
}

Future GetMyAppointments() async {
  final url = Uri.parse('$baseUrl/appointment/my');

  var jwt = await FlutterKeychain.get(key: "jwt");
  final headers = {
    'authorization': 'Bearer $jwt',
    'Content-Type': 'application/json',
  };

  final response = await http.get(
    url,
    headers: headers,
  );

  final responseBody = jsonDecode(response.body);
  return [response.statusCode, responseBody];
}

Future GetHistory() async {
  final url = Uri.parse('$baseUrl/history/all');

  var jwt = await FlutterKeychain.get(key: "jwt");
  final headers = {
    'authorization': 'Bearer $jwt',
    'Content-Type': 'application/json',
  };

  final response = await http.get(
    url,
    headers: headers,
  );

  final responseBody = jsonDecode(response.body);
  return [response.statusCode, responseBody];
}

Future GetUserData() async {
  final url = Uri.parse('$baseUrl/user/me');

  var jwt = await FlutterKeychain.get(key: "jwt");
  final headers = {
    'authorization': 'Bearer $jwt',
    'Content-Type': 'application/json',
  };

  final response = await http.get(
    url,
    headers: headers,
  );

  final responseBody = jsonDecode(response.body);
  return [response.statusCode, responseBody];
}

Future GetDoctors() async {
  final url = Uri.parse('$baseUrl/doctor/all');

  var jwt = await FlutterKeychain.get(key: "jwt");
  final headers = {
    'authorization': 'Bearer $jwt',
    'Content-Type': 'application/json',
  };

  final response = await http.get(
    url,
    headers: headers,
  );

  final responseBody = jsonDecode(response.body);
  return [response.statusCode, responseBody];
}

getUserData() async {
  var res = await GetUserData();
  if (res[0] == 200 || res[0] == 201) {
    UserData = res[1];
  }
}

getDetailedAppointments(id) async {
  final url = Uri.parse('$baseUrl/appointment/$id');

  var jwt = await FlutterKeychain.get(key: "jwt");
  final headers = {
    'authorization': 'Bearer $jwt',
    'Content-Type': 'application/json',
  };

  final response = await http.get(
    url,
    headers: headers,
  );

  final responseBody = jsonDecode(response.body);
  return [response.statusCode, responseBody];
}

getAppointments() async {
  var res = await GetMyAppointments();
  if (res[0] == 200 || res[0] == 201) {
    myAppointments = res[1];
  }
}

getDoctors() async {
  var res = await GetDoctors();
  if (res[0] == 200 || res[0] == 201) {
    doctors = res[1]['result'];
  }
}

getHistory() async {
  var res = await GetHistory();
  if (res[0] == 200 || res[0] == 201) {
    history = res[1]['history'];
  }
}
