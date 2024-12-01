import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

final List<Map<String, dynamic>> members = [
  {'name': 'John Doe', 'id': 'WSL0001', 'lat': 28.6139, 'lng': 77.2090},
  {'name': 'Jane Smith', 'id': 'WSL0002', 'lat': 19.0760, 'lng': 72.8777},
  {'name': 'Mike Taylor', 'id': 'WSL0003', 'lat': 13.0827, 'lng': 80.2707},
  {'name': 'Sarah Johnson', 'id': 'WSL0004', 'lat': 22.5726, 'lng': 88.3639},
  {'name': 'Ravi Kumar', 'id': 'WSL0005', 'lat': 12.9716, 'lng': 77.5946},
  {'name': 'Asha Patel', 'id': 'WSL0006', 'lat': 26.9124, 'lng': 75.7873},
  {'name': 'Anil Verma', 'id': 'WSL0007', 'lat': 17.3850, 'lng': 78.4867},
  {'name': 'Priya Sharma', 'id': 'WSL0008', 'lat': 23.2599, 'lng': 77.4126},
  {'name': 'Vikram Singh', 'id': 'WSL0009', 'lat': 30.7333, 'lng': 76.7794},
  {'name': 'Sneha Desai', 'id': 'WSL0010', 'lat': 21.1702, 'lng': 72.8311},
];

class AttendanceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ATTENDANCE',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xff4C3BBB),
      ),
      body: Column(
        children: [
          // Header Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.group, color: Colors.purple),
                    SizedBox(width: 8),
                    Text(
                      'All Members',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Change',
                    style: TextStyle(color: Colors.purple, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          // Date Selector
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.arrow_back_ios, color: Colors.grey, size: 16),
                Text(
                  'Tue, Aug 31 2022',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
              ],
            ),
          ),
          Divider(height: 16, thickness: 1),
          // Attendance List
          Expanded(
            child: ListView.builder(
              itemCount: members.length,
              itemBuilder: (context, index) {
                final member = members[index];
                return _buildAttendanceItem(
                  context,
                  member: member,
                  index: index,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AttendanceMapScreen(members: members),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Show Map view',
                    style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.arrow_forward_ios, color: Colors.purple, size: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAttendanceItem(
    BuildContext context, {
    required Map<String, dynamic> member,
    required int index,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: Colors.purple.shade100,
            child: Icon(Icons.person, color: Colors.purple),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  member['name'],
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.arrow_upward, color: Colors.green, size: 16),
                    SizedBox(width: 4),
                    Text('09:30 am', style: TextStyle(color: Colors.black54)),
                    SizedBox(width: 16),
                    Icon(Icons.arrow_downward, color: Colors.red, size: 16),
                    SizedBox(width: 4),
                    Text('06:40 pm', style: TextStyle(color: Colors.black54)),
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: [
              Text(
                index % 2 == 0 ? 'WORKING' : 'NOT LOGGED-IN YET',
                style: TextStyle(
                  color: index % 2 == 0 ? Colors.green : Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.calendar_today, color: Colors.grey, size: 16),
                  SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AttendanceMapScreen(
                            members: [member], 
                          ),
                        ),
                      );
                    },
                    child: Icon(Icons.location_on, color: Colors.purple, size: 16),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AttendanceMapScreen extends StatelessWidget {
  final List<Map<String, dynamic>> members;

  AttendanceMapScreen({required this.members});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance Map'),
        backgroundColor: Color(0xff4C3BBB),
      ),
      body: FlutterMap(
        options: MapOptions(
          center: members.length == 1
              ? LatLng(members[0]['lat'], members[0]['lng'])
              : LatLng(22.5937, 78.9629),
          zoom: members.length == 1 ? 10.0 : 5.0,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerLayer(
            markers: members
                .map(
                  (member) => Marker(
                    point: LatLng(member['lat'], member['lng']),
                    width: 40,
                    height: 40,
                    builder: (context) => Tooltip(
                      message: member['name'],
                      child: Icon(Icons.location_on, color: Colors.purple, size: 40),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
