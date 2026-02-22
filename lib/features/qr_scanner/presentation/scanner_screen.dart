import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../../utils/context_extensions.dart';
import '../domain/scan_record.dart';
import '../domain/scan_type.dart';
import 'scanner_controller.dart';

class ScannerScreen extends ConsumerStatefulWidget {
  const ScannerScreen({super.key});

  @override
  ConsumerState<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends ConsumerState<ScannerScreen> {
  final MobileScannerController _cameraController = MobileScannerController();
  bool _resultShown = false;

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  void _onDetect(BarcodeCapture capture) {
    final String? rawValue = capture.barcodes.firstOrNull?.rawValue;
    if (rawValue == null || _resultShown) return;
    _resultShown = true;
    _cameraController.stop();
    ref.read(scannerControllerProvider.notifier).onQrScanned(rawValue);
  }

  void _reset() {
    _resultShown = false;
    ref.read(scannerControllerProvider.notifier).reset();
    _cameraController.start();
  }

  @override
  Widget build(BuildContext context) {
    final ScannerState scannerState = ref.watch(scannerControllerProvider);

    ref.listen(scannerControllerProvider, (
      ScannerState? prev,
      ScannerState next,
    ) {
      if (next.error != null && prev?.error != next.error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.error!),
            backgroundColor: Colors.red,
          ),
        );
        Future<void>.delayed(
          const Duration(seconds: 2),
          _reset,
        );
      }
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Scan QR Code')),
      body: Stack(
        children: <Widget>[
          MobileScanner(
            controller: _cameraController,
            onDetect: _onDetect,
          ),
          // Overlay frame
          Center(
            child: Container(
              width: 260,
              height: 260,
              decoration: BoxDecoration(
                border: Border.all(
                  color: context.colorScheme.primary,
                  width: 3,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          if (scannerState.isProcessing)
            const Center(child: CircularProgressIndicator()),
          if (scannerState.lastRecord != null)
            _ResultOverlay(
              record: scannerState.lastRecord!,
              onDismiss: _reset,
            ),
        ],
      ),
    );
  }
}

class _ResultOverlay extends StatelessWidget {
  const _ResultOverlay({required this.record, required this.onDismiss});

  final ScanRecord record;
  final VoidCallback onDismiss;

  @override
  Widget build(BuildContext context) {
    final bool isEntry = record.type == ScanType.entry;
    return Container(
      color: Colors.black54,
      child: Center(
        child: Card(
          margin: const EdgeInsets.all(32),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(
                  isEntry
                      ? Icons.login_rounded
                      : Icons.logout_rounded,
                  size: 60,
                  color: isEntry ? Colors.green : Colors.orange,
                ),
                const SizedBox(height: 12),
                Text(
                  isEntry ? 'Entry Recorded' : 'Exit Recorded',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  record.buildingName,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 4),
                Text(
                  _formatTime(record.timestamp),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 20),
                FilledButton(
                  onPressed: onDismiss,
                  child: const Text('Scan Again'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _formatTime(DateTime dt) {
    final String h = dt.hour.toString().padLeft(2, '0');
    final String m = dt.minute.toString().padLeft(2, '0');
    final String d =
        '${dt.day.toString().padLeft(2, '0')}/${dt.month.toString().padLeft(2, '0')}/${dt.year}';
    return '$d  $h:$m';
  }
}
