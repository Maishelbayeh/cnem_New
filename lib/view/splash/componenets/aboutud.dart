import 'package:flutter/material.dart';

// Example TeamMember class, you can modify this based on your actual data structure.
class TeamMembers {
  final String name;
  final String position;
  final String bio;
  final String imageUrl;

  TeamMembers({
    required this.name,
    required this.position,
    required this.bio,
    required this.imageUrl,
  });
}

class CustomTeamMemberDialog extends StatelessWidget {
  final TeamMembers teamMember;

  CustomTeamMemberDialog({required this.teamMember});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Directionality(
          textDirection: TextDirection.rtl, // Set text direction to RTL
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with team member's image and name
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                      teamMember.imageUrl,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          teamMember.name,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.purple.shade700,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          teamMember.position,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Biography section
              Text(
                "السيرة الذاتية:",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple.shade700,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                teamMember.bio,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade700,
                ),
                textAlign: TextAlign.right, // Right-align the biography
              ),
              const SizedBox(height: 16),

              // Social media or contact info section
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      // Add the logic for social media link or action
                    },
                    icon: Icon(Icons.link),
                    color: Colors.purple.shade700,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "عرض الملف الشخصي",
                    style: TextStyle(
                      color: Colors.purple.shade700,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Close button
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple.shade700,
                  ),
                  child: Text('إغلاق'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
