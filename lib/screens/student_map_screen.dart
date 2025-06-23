import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
// import 'package:mqtt_client/mqtt_client.dart'; // Descomente ao configurar

class StudentMapScreen extends StatefulWidget {
  final String busRouteId;
  const StudentMapScreen({Key? key, required this.busRouteId}) : super(key: key);

  @override
  State<StudentMapScreen> createState() => _StudentMapScreenState();
}

class _StudentMapScreenState extends State<StudentMapScreen> {
  // Coordenadas iniciais (Campus do Gragoatá, UFF - Niterói)
  final LatLng _initialCenter = const LatLng(-22.9035, -43.1319);
  LatLng _busLocation = const LatLng(-22.9035, -43.1319);
  final MapController _mapController = MapController();

  @override
  void initState() {
    super.initState();
    // A LÓGICA DE SUBSCRIÇÃO AO TÓPICO MQTT DEVE IR AQUI
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rota: ${widget.busRouteId}'),
      ),
      body: FlutterMap(
        mapController: _mapController,
        options: MapOptions(
          initialCenter: _initialCenter,
          initialZoom: 15.0,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: _busLocation,
                width: 80,
                height: 80,
                child: const Column(
                  children: [
                    Icon(Icons.directions_bus, size: 40.0, color: Colors.blue),
                    Text('Ônibus',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold))
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
