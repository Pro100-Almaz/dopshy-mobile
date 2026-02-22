import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/context_extensions.dart';
import '../data/scan_history_repository.dart';
import '../domain/scan_record.dart';
import '../domain/scan_type.dart';

class ScanHistoryScreen extends ConsumerWidget {
  const ScanHistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<ScanRecord> records = ref.watch(scanHistoryRepositoryProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Scan History')),
      body: records.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.history_outlined,
                    size: 64,
                    color: context.colorScheme.outline,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No scans yet',
                    style: context.textTheme.bodyLarge?.copyWith(
                      color: context.colorScheme.outline,
                    ),
                  ),
                ],
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: records.length,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (BuildContext context, int index) {
                return _ScanTile(record: records[index]);
              },
            ),
    );
  }
}

class _ScanTile extends StatelessWidget {
  const _ScanTile({required this.record});

  final ScanRecord record;

  @override
  Widget build(BuildContext context) {
    final bool isEntry = record.type == ScanType.entry;
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: isEntry
              ? Colors.green.withValues(alpha: 0.15)
              : Colors.orange.withValues(alpha: 0.15),
          child: Icon(
            isEntry ? Icons.login_rounded : Icons.logout_rounded,
            color: isEntry ? Colors.green : Colors.orange,
          ),
        ),
        title: Text(
          record.buildingName,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(_formatDateTime(record.timestamp)),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: isEntry
                ? Colors.green.withValues(alpha: 0.12)
                : Colors.orange.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            record.type.label,
            style: TextStyle(
              color: isEntry ? Colors.green.shade700 : Colors.orange.shade700,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }

  String _formatDateTime(DateTime dt) {
    final String h = dt.hour.toString().padLeft(2, '0');
    final String m = dt.minute.toString().padLeft(2, '0');
    final String d =
        '${dt.day.toString().padLeft(2, '0')}/${dt.month.toString().padLeft(2, '0')}/${dt.year}';
    return '$d  $h:$m';
  }
}
