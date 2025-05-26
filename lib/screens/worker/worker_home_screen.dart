import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_button.dart';
import 'job_details_screen.dart';
import 'applied_jobs_screen.dart';
import 'worker_profile_screen.dart';

class WorkerHomeScreen extends StatelessWidget {
  const WorkerHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.secondaryColor,
      appBar: AppBar(
        title: const Text('Available Jobs'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {
              // TODO: Navigate to notifications screen
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Notifications coming soon!')),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 10, // Dummy data
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Job Title ${index + 1}',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Company Name',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: AppTheme.primaryColor,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.bookmark_border),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Job saved!')),
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      _buildInfoChip(
                        context,
                        Icons.attach_money,
                        '\$20/hr',
                      ),
                      const SizedBox(width: 8),
                      _buildInfoChip(
                        context,
                        Icons.access_time,
                        '4 hours',
                      ),
                      const SizedBox(width: 8),
                      _buildInfoChip(
                        context,
                        Icons.calendar_today,
                        'Today',
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          text: 'View Details',
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              '/worker-job-details',
                              arguments: index + 1, // Pass job ID
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: CustomButton(
                          text: 'Apply Now',
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Apply for Job'),
                                content: const Text(
                                    'Are you sure you want to apply for this job?'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content:
                                                Text('Application submitted!')),
                                      );
                                    },
                                    child: const Text('Apply'),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'Applied',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              // Already on home screen
              break;
            case 1:
              Navigator.pushNamed(context, '/worker-applied-jobs');
              break;
            case 2:
              Navigator.pushNamed(context, '/worker-profile');
              break;
          }
        },
      ),
    );
  }

  Widget _buildInfoChip(BuildContext context, IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppTheme.primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: AppTheme.primaryColor),
          const SizedBox(width: 4),
          Text(
            label,
            style: const TextStyle(
              color: AppTheme.primaryColor,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
