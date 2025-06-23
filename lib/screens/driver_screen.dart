import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
// import 'package:mqtt_client/mqtt_client.dart'; // Descomente ao configurar o MQTT

class DriverScreen extends StatefulWidget {
  const DriverScreen({Key? key}) : super(key: key);

  @override
  State<DriverScreen> createState() => _DriverScreenState();
}

class _DriverScreenState extends State<DriverScreen> {
  bool _isSharingLocation = false;
  StreamSubscription<Position>? _positionStream;

  // --- PLACEHOLDER PARA O CLIENTE MQTT ---
  // MqttClient? client;

  void _toggleLocationSharing() async {
    if (_isSharingLocation) {
      _positionStream?.cancel();
      // client?.disconnect();
      setState(() {
        _isSharingLocation = false;
      });
    } else {
      bool serviceEnabled;
      LocationPermission permission;

      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        // Exiba um erro para o usuário
        return;
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return;
      }

      // --- CONEXÃO COM O BROKER MQTT DEVE SER FEITA AQUI ---

      const LocationSettings locationSettings = LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10,
      );

      _positionStream = Geolocator.getPositionStream(locationSettings: locationSettings)
          .listen((Position position) {
        print(
            'Enviando Coordenadas: Lat: ${position.latitude}, Lng: ${position.longitude}');
        // --- LÓGICA DE ENVIO VIA MQTT AQUI ---
      });

      setState(() {
        _isSharingLocation = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Área do Motorista'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                _isSharingLocation ? Icons.location_on : Icons.location_off,
                size: 100,
                color: _isSharingLocation ? Colors.green.shade600 : Colors.grey.shade600,
              ),
              const SizedBox(height: 20),
              Text(
                _isSharingLocation
                    ? 'Compartilhando Localização'
                    : 'Compartilhamento Pausado',
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),
              ElevatedButton.icon(
                onPressed: _toggleLocationSharing,
                icon: Icon(_isSharingLocation ? Icons.stop : Icons.play_arrow),
                label: Text(
                  _isSharingLocation
                      ? 'Parar Compartilhamento'
                      : 'Iniciar Compartilhamento',
                  style: const TextStyle(fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isSharingLocation ? Colors.red : Colors.green,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
