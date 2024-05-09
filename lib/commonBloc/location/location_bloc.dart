import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';

import '../../commonfun/api_request.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc() : super(LocationInitial()) {
    on<SaveLocation>((event, emit) async{
        bool serviceEnabled;
        LocationPermission permission;
        serviceEnabled = await Geolocator.isLocationServiceEnabled();
        if (!serviceEnabled) {
          return Future.error('Location services are disabled.');
        }
        permission = await Geolocator.checkPermission();
        if (permission == LocationPermission.denied) {
          permission = await Geolocator.requestPermission();
          if (permission == LocationPermission.denied) {
            return Future.error('Location permissions are denied');
          }
        }
        if (permission == LocationPermission.deniedForever) {
          return Future.error(
              'Location permissions are permanently denied, we cannot request permissions.');
        }
        Position position= await Geolocator.getCurrentPosition(desiredAccuracy:LocationAccuracy.high);
        List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);

       await Api().postReq({"latitude": position.latitude.toString(),
        "longitude":position.longitude.toString(), "address":"${placemarks[0].name} ${placemarks[0].locality} ${placemarks[0].street}, ${placemarks[0].subLocality} ${placemarks[0].country} ${placemarks[0].postalCode}",},"save-location",


       );
    });
  }
}
