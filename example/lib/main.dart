import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:file_picker/file_picker.dart';

void main() => runApp(HtmlEditorExampleApp());

class HtmlEditorExampleApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      locale: const Locale('ar'), // 设置语言为阿拉伯语
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl, // 设置从右到左方向
          child: child!,
        );
      },
      home: HtmlEditorExample(title: 'Flutter HTML123 Editor Example'),
    );
  }
}

class HtmlEditorExample extends StatefulWidget {
  HtmlEditorExample({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HtmlEditorExampleState createState() => _HtmlEditorExampleState();
}

class _HtmlEditorExampleState extends State<HtmlEditorExample> {
  String result = '';
  final HtmlEditorController controller = HtmlEditorController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: Directionality.of(context), // 强制 RTL
      child: GestureDetector(
        onTap: () {
          if (!kIsWeb) {
            controller.clearFocus();
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
            elevation: 0,
            actions: [
              IconButton(
                icon: Icon(Icons.refresh),
                onPressed: () {
                  if (kIsWeb) {
                    controller.reloadWeb();
                  } else {
                    controller.editorController!.reload();
                  }
                },
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              controller.toggleCodeView();
            },
            child: Text(r'<\>',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          ),
          body: Container(
            color: Color(0xFFF7F7F7),
            margin: EdgeInsets.fromLTRB(15, 15, 15, 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(height: 150,),
                HtmlEditor(
                  controller: controller,
                  htmlEditorOptions: HtmlEditorOptions(
                    hint:'1. متاح على تطبيق الق من إيرادات القراءة والمكافآت.',
                    shouldEnsureVisible: true,
                  ),
                  htmlToolbarOptions: HtmlToolbarOptions(
                    toolbarPosition: ToolbarPosition.belowEditor,
                    toolbarType: ToolbarType.nativeGrid,
                    defaultToolbarButtons: [
                      FontButtons(
                        bold: true,
                        italic: true,
                        underline: false,
                        clearAll: false,
                        strikethrough: false,
                        superscript: false,
                        subscript: false,
                      ),
                      OtherButtons(
                        fullscreen: false,
                        codeview: false,
                        undo: true,
                        redo: true,
                        help: false,
                        copy: false,
                        paste: false,
                      ),
                    ],
                    onButtonPressed: (type, status, updateStatus) {
                      print(
                          "button '${describeEnum(type)}' pressed, the current selected status is $status");
                      return true;
                    },
                    onDropdownChanged: (type, changed, updateSelectedItem) {
                      print(
                          "dropdown '${describeEnum(type)}' changed to $changed");
                      return true;
                    },
                    mediaLinkInsertInterceptor: (url, type) {
                      print(url);
                      return true;
                    },
                  ),
                  otherOptions: OtherOptions(height: 580),
                  callbacks: Callbacks(
                    onBeforeCommand: (html) {
                      print('html before change is $html');
                    },
                    onChangeContent: (changed) {
                      print('content changed to $changed');
                    },
                    onChangeCodeview: (changed) {
                      print('code changed to $changed');
                    },
                    onChangeSelection: (settings) {
                      print('parent element is ${settings.parentElement}');
                      print('font name is ${settings.fontName}');
                    },
                    onDialogShown: () {
                      print('dialog shown');
                    },
                    onEnter: () {
                      print('enter/return pressed');
                    },
                    onFocus: () {
                      print('editor focused');
                    },
                    onBlur: () {
                      print('editor unfocused');
                    },
                    onBlurCodeview: () {
                      print('codeview either focused or unfocused');
                    },
                    onInit: () {
                      print('init');
                    },
                    onImageUploadError: (file, base64Str, error) {
                      print(describeEnum(error));
                      print(base64Str ?? '');
                      if (file != null) {
                        print(file.name);
                        print(file.size);
                        print(file.type);
                      }
                    },
                    onKeyDown: (keyCode) {
                      print('$keyCode key downed');
                      print(
                          'current character count: ${controller.characterCount}');
                    },
                    onKeyUp: (keyCode) {
                      print('$keyCode key released');
                    },
                    onMouseDown: () {
                      print('mouse downed');
                    },
                    onMouseUp: () {
                      print('mouse released');
                    },
                    onNavigationRequestMobile: (url) {
                      print(url);
                      return NavigationActionPolicy.ALLOW;
                    },
                    onPaste: () {
                      print('pasted into editor');
                    },
                    onScroll: () {
                      print('editor scrolled');
                    },
                  ),
                ),
              ],
            ),
            // child: SingleChildScrollView(
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: <Widget>[
            //       // Container(height: 300,),
            //       HtmlEditor(
            //         controller: controller,
            //         htmlEditorOptions: HtmlEditorOptions(
            //           hint:'1. متاح على تطبيق الق من إيرادات القراءة والمكافآت.',
            //           shouldEnsureVisible: true,
            //         ),
            //         htmlToolbarOptions: HtmlToolbarOptions(
            //           toolbarPosition: ToolbarPosition.belowEditor,
            //           toolbarType: ToolbarType.nativeGrid,
            //           defaultToolbarButtons: [
            //             FontButtons(
            //               bold: true,
            //               italic: true,
            //               underline: false,
            //               clearAll: false,
            //               strikethrough: false,
            //               superscript: false,
            //               subscript: false,
            //             ),
            //             OtherButtons(
            //               fullscreen: false,
            //               codeview: false,
            //               undo: true,
            //               redo: true,
            //               help: false,
            //               copy: false,
            //               paste: false,
            //             ),
            //           ],
            //           onButtonPressed: (type, status, updateStatus) {
            //             print(
            //                 "button '${describeEnum(type)}' pressed, the current selected status is $status");
            //             return true;
            //           },
            //           onDropdownChanged: (type, changed, updateSelectedItem) {
            //             print(
            //                 "dropdown '${describeEnum(type)}' changed to $changed");
            //             return true;
            //           },
            //           mediaLinkInsertInterceptor: (url, type) {
            //             print(url);
            //             return true;
            //           },
            //         ),
            //         otherOptions: OtherOptions(height: 580),
            //         callbacks: Callbacks(
            //           onBeforeCommand: (html) {
            //             print('html before change is $html');
            //           },
            //           onChangeContent: (changed) {
            //             print('content changed to $changed');
            //           },
            //           onChangeCodeview: (changed) {
            //             print('code changed to $changed');
            //           },
            //           onChangeSelection: (settings) {
            //             print('parent element is ${settings.parentElement}');
            //             print('font name is ${settings.fontName}');
            //           },
            //           onDialogShown: () {
            //             print('dialog shown');
            //           },
            //           onEnter: () {
            //             print('enter/return pressed');
            //           },
            //           onFocus: () {
            //             print('editor focused');
            //           },
            //           onBlur: () {
            //             print('editor unfocused');
            //           },
            //           onBlurCodeview: () {
            //             print('codeview either focused or unfocused');
            //           },
            //           onInit: () {
            //             print('init');
            //           },
            //           onImageUploadError: (file, base64Str, error) {
            //             print(describeEnum(error));
            //             print(base64Str ?? '');
            //             if (file != null) {
            //               print(file.name);
            //               print(file.size);
            //               print(file.type);
            //             }
            //           },
            //           onKeyDown: (keyCode) {
            //             print('$keyCode key downed');
            //             print(
            //                 'current character count: ${controller.characterCount}');
            //           },
            //           onKeyUp: (keyCode) {
            //             print('$keyCode key released');
            //           },
            //           onMouseDown: () {
            //             print('mouse downed');
            //           },
            //           onMouseUp: () {
            //             print('mouse released');
            //           },
            //           onNavigationRequestMobile: (url) {
            //             print(url);
            //             return NavigationActionPolicy.ALLOW;
            //           },
            //           onPaste: () {
            //             print('pasted into editor');
            //           },
            //           onScroll: () {
            //             print('editor scrolled');
            //           },
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ),
        ),
      ),
    );
  }
}
