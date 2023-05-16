import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../pages/car_desc_page.dart';

class MapView extends GoogleMapExampleAppPage {
  const MapView({Key? key})
      : super(const Icon(Icons.image), 'Marker icons', key: key);

  @override
  Widget build(BuildContext context) {
    return const MarkerIconsBody();
  }
}

class MarkerIconsBody extends StatefulWidget {
  const MarkerIconsBody({super.key});

  @override
  State<StatefulWidget> createState() => MarkerIconsBodyState();
}

const LatLng _kMapPin = LatLng(17.7460232, -64.7986931);

const LatLng _kMapCenter = LatLng(17.7245968, -64.8347992);

const CameraPosition _kPin = CameraPosition(
    target: LatLng(17.7460232, -64.7986931), zoom: 30.151926040649414);

class MarkerIconsBodyState extends State<MarkerIconsBody> {
  GoogleMapController? controller;
  BitmapDescriptor? _markerIcon;
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    _createMarkerImageFromAsset(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: const CameraPosition(
              target: _kMapCenter,
              zoom: 12.0,
            ),
            markers: <Marker>{_createMarker()},
            onMapCreated: _onMapCreated,
          ),
        )
      ],
    );
  }

  Marker _createMarker() {
    if (_markerIcon != null) {
      return Marker(
        markerId: const MarkerId('marker_1'),
        position: _kMapPin,
        icon: _markerIcon!,
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CarDescPage(),
          ),
        ),
      );
    } else {
      return Marker(
        markerId: const MarkerId('marker_1'),
        position: _kMapPin,
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CarDescPage(),
          ),
        ),
      );
    }
  }

  Future<void> _createMarkerImageFromAsset(BuildContext context) async {
    if (_markerIcon == null) {
      final ImageConfiguration imageConfiguration =
          createLocalImageConfiguration(context, size: const Size.square(48));
      await BitmapDescriptor.fromAssetImage(
              imageConfiguration, 'assets/images/red_pin.png')
          .then(_updateBitmap);
    }
  }

  void _updateBitmap(BitmapDescriptor bitmap) {
    setState(() {
      _markerIcon = bitmap;
    });
  }

  void _onMapCreated(GoogleMapController controllerParam) {
    setState(() {
      controller = controllerParam;
    });
  }

  Future<void> _goToThePin() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kPin));
  }
}

abstract class GoogleMapExampleAppPage extends StatelessWidget {
  const GoogleMapExampleAppPage(this.leading, this.title, {Key? key})
      : super(key: key);

  final Widget leading;
  final String title;
}
