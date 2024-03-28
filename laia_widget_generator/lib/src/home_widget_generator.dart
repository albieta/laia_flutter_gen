// ignore_for_file: implementation_imports, depend_on_referenced_packages

import 'dart:io';

import 'package:analyzer/dart/element/element.dart';
import 'package:laia_annotations/laia_annotations.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:laia_widget_generator/src/model_visitor.dart';
import 'package:source_gen/source_gen.dart';

class HomeWidgetGenerator extends GeneratorForAnnotation<HomeWidgetGenAnnotation> {
  @override
  generateForAnnotatedElement(
    Element element, 
    ConstantReader annotation, 
    BuildStep buildStep
  ) {
    final buffer = StringBuffer();
    final visitor = ModelVisitor();
    element.visitChildren(visitor);

    String filePath = '${Directory.current.path}/lib/home.txt';
    File file = File(filePath);

    List<String> lines = file.readAsLinesSync();

    buffer.writeln("Widget dashboardWidget(BuildContext context) {");
    buffer.writeln('''
          int crossAxisCount = _isMobile(MediaQuery.of(context)) ? 3 : 5;
  
  return CustomScrollView(
    slivers: [
      SliverPadding(
        padding: const EdgeInsets.all(20),
        sliver: SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return _dashboardWidgets[index];
            },
            childCount: _dashboardWidgets.length,
          ),
        ),
      ),
    ],
  );
}

bool _isMobile(MediaQueryData mediaQuery) {
  final Size screenSize = mediaQuery.size;
  return (defaultTargetPlatform == TargetPlatform.iOS ||
      defaultTargetPlatform == TargetPlatform.android) ||
      screenSize.width < screenSize.height;
}

List<Widget> _dashboardWidgets = [''');
    for (String line in lines) {
      String widgetName = line.trim();
      buffer.writeln('$widgetName(),');
    }
    buffer.writeln('''
];
        ''');

    return buffer.toString();
  }
}