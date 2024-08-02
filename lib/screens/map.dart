import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapState();
}

class _MapState extends State<MapPage> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(36.102232, 129.3897838);
  final _list = ['One', 'Two', 'Three', 'Four'];
  String _selectedCity = '';
  void initState() {
    super.initState();
    setState(() {
      _selectedCity = _list[0];
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.topLeft,
          child: SizedBox(
            width: 100,
            child: DropdownButton(
              //지역정하는 버튼
              value: _selectedCity,
              isExpanded: true,
              items: _list
                  .map((e) => DropdownMenuItem(
                        value: e, // 선택 시 onChanged 를 통해 반환할 value
                        child: Text(e),
                      ))
                  .toList(),
              onChanged: (value) {
                // items 의 DropdownMenuItem 의 value 반환
                setState(() {
                  _selectedCity = value!;
                });
              },
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 11.0,
            ),
          ),
          DraggableScrollableSheet(
              initialChildSize: 0.3,
              minChildSize: 0.1,
              maxChildSize: 0.95,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Container(
                  color: Colors.white,
                  child: SingleChildScrollView(
                      controller: scrollController,
                      child: Column(
                        children: [
                          Card(
                              child: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Text('Item 1'))),
                        ],
                      )),
                );
              })
        ],
      ),
    );
  }
}
