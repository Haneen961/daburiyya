//FlutterPDFViewer

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class FlutterPDFViewer extends StatefulWidget {
  @override
  _FlutterPDFViewerState createState() => _FlutterPDFViewerState();
}

class _FlutterPDFViewerState extends State<FlutterPDFViewer> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('مجلس دبورية المحلي'),
      ),
      body: SfPdfViewer.asset(
        'assets/pdfs/book.pdf',
        key: _pdfViewerKey,
      ),
    );
  }
}
