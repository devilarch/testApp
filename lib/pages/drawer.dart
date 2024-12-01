import 'package:demo_app/pages/attendance.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vinome'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xff4C3BBB),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/avatar.png'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Cameron Williamson',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    'cameronwilliamson@gmail.com',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),
            _buildDrawerItem(Icons.timer, 'Timer', context),
            _buildDrawerItem(Icons.calendar_today, 'Attendance', context),
            _buildDrawerItem(Icons.insert_chart_outlined, 'Activity', context),
            _buildDrawerItem(Icons.description, 'Timesheet', context),
            _buildDrawerItem(Icons.bar_chart, 'Report', context),
            _buildDrawerItem(Icons.apartment, 'Jobsite', context),
            _buildDrawerItem(Icons.group, 'Team', context),
            _buildDrawerItem(Icons.time_to_leave, 'Time off', context),
            _buildDrawerItem(Icons.schedule, 'Schedules', context),
            _buildDrawerItem(Icons.group_add, 'Request to join Organization', context),
            Divider(),
            _buildDrawerItem(Icons.lock, 'Change Password', context),
            _buildDrawerItem(Icons.logout, 'Logout', context),
            Divider(),
            _buildDrawerItem(Icons.help_outline, 'FAQ & Help', context),
            _buildDrawerItem(Icons.privacy_tip, 'Privacy Policy', context),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
              child: Text(
                'Version: 2.10(1)',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Home Screen'),
      ),
    );
  }

  ListTile _buildDrawerItem(IconData icon, String title, BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.black54),
      title: Text(title, style: TextStyle(color: Colors.black87)),
      onTap: () {
        // Add navigation logic for each item here
        if (title == 'Attendance') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AttendanceScreen()),
          );
        } 

        
        
        else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('$title screen is not implemented yet!')),
          );
        }
      },
    );
  }
}


