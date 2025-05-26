import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_button.dart';
// ignore: unused_import
import 'job_details_screen.dart';

class AppliedJobsScreen extends StatelessWidget {
  const AppliedJobsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppTheme.secondaryColor,
        appBar: AppBar(
          title: const Text('Applied Jobs'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Pending'),
              Tab(text: 'Accepted'),
              Tab(text: 'Rejected'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildJobList(context, 'pending'),
            _buildJobList(context, 'accepted'),
            _buildJobList(context, 'rejected'),
          ],
        ),
      ),
    );
  }

  Widget _buildJobList(BuildContext context, String status) {
    // Dummy data - replace with actual data from your backend
    final jobs = [
      {
        'title': 'Job Title 1',
        'company': 'Company 1',
        'date': '2024-03-20',
        'status': status,
        'salary': '\$20/hr',
        'location': 'New York, NY',
      },
      {
        'title': 'Job Title 2',
        'company': 'Company 2',
        'date': '2024-03-19',
        'status': status,
        'salary': '\$25/hr',
        'location': 'Los Angeles, CA',
      },
    ];

    if (jobs.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.work_outline,
              size: 64,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              'No $status applications yet',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: jobs.length,
      itemBuilder: (context, index) {
        final job = jobs[index];
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
                            job['title']!,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            job['company']!,
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
                    _buildStatusChip(context, job['status']!),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    _buildInfoChip(
                      context,
                      Icons.attach_money,
                      job['salary']!,
                    ),
                    const SizedBox(width: 8),
                    _buildInfoChip(
                      context,
                      Icons.location_on,
                      job['location']!,
                    ),
                    const SizedBox(width: 8),
                    _buildInfoChip(
                      context,
                      Icons.calendar_today,
                      job['date']!,
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
                            arguments: index + 1,
                          );
                        },
                        isOutlined: true,
                      ),
                    ),
                    if (status == 'pending') ...[
                      const SizedBox(width: 8),
                      Expanded(
                        child: CustomButton(
                          text: 'Withdraw',
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Withdraw Application'),
                                content: const Text(
                                    'Are you sure you want to withdraw your application?'),
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
                                                Text('Application withdrawn')),
                                      );
                                    },
                                    child: const Text('Withdraw'),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildStatusChip(BuildContext context, String status) {
    Color color;
    IconData icon;

    switch (status) {
      case 'pending':
        color = Colors.orange;
        icon = Icons.pending;
        break;
      case 'accepted':
        color = Colors.green;
        icon = Icons.check_circle;
        break;
      case 'rejected':
        color = Colors.red;
        icon = Icons.cancel;
        break;
      default:
        color = Colors.grey;
        icon = Icons.help;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        // ignore: deprecated_member_use
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: color),
          const SizedBox(width: 4),
          Text(
            status.toUpperCase(),
            style: TextStyle(
              color: color,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoChip(BuildContext context, IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        // ignore: deprecated_member_use
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
