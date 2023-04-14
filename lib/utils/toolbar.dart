import 'package:flutter/material.dart';

/// Abstract class that all the toolbar classes extend
abstract class Toolbar {
  const Toolbar();
}

final double imageSize = 16;

/// Style group
class StyleButtons extends Toolbar {
  final bool style;

  const StyleButtons({
    this.style = true,
  });
}

/// Font setting group
class FontSettingButtons extends Toolbar {
  final bool fontName;
  final bool fontSize;
  final bool fontSizeUnit;

  const FontSettingButtons({
    this.fontName = true,
    this.fontSize = true,
    this.fontSizeUnit = true,
  });
}

/// Font group
class FontButtons extends Toolbar {
  final bool bold;
  final bool italic;
  final bool underline;
  final bool clearAll;
  final bool strikethrough;
  final bool superscript;
  final bool subscript;

  const FontButtons({
    this.bold = true,
    this.italic = true,
    this.underline = true,
    this.clearAll = true,
    this.strikethrough = true,
    this.superscript = true,
    this.subscript = true,
  });

  List<ImageIcon> getIcons1() {
    var icons = <ImageIcon>[];
    if (bold) {
      icons.add(ImageIcon(
          Icon(Icons.format_bold),
          Image.asset(
            'packages/html_editor_enhanced/images/bold@3x.png',
            width: imageSize,
            height: imageSize,
          )));
    }
    if (italic) {
      icons.add(ImageIcon(
          Icon(Icons.format_italic),
          Image.asset(
            'packages/html_editor_enhanced/images/tilt@3x.png',
            width: imageSize,
            height: imageSize,
          )));
    }
    if (underline) {
      icons.add(ImageIcon(
          Icon(Icons.format_underline), Icon(Icons.format_underline)));
    }
    if (clearAll) {
      icons.add(ImageIcon(Icon(Icons.format_clear), Icon(Icons.format_clear)));
    }
    return icons;
  }

  List<Icon> getIcons2() {
    var icons = <Icon>[];
    if (strikethrough) icons.add(Icon(Icons.format_strikethrough));
    if (superscript) icons.add(Icon(Icons.superscript));
    if (subscript) icons.add(Icon(Icons.subscript));
    return icons;
  }
}

/// Color bar group
class ColorButtons extends Toolbar {
  final bool foregroundColor;
  final bool highlightColor;

  const ColorButtons({
    this.foregroundColor = true,
    this.highlightColor = true,
  });

  List<Icon> getIcons() {
    var icons = <Icon>[];
    if (foregroundColor) icons.add(Icon(Icons.format_color_text));
    if (highlightColor) icons.add(Icon(Icons.format_color_fill));
    return icons;
  }
}

/// List group
class ListButtons extends Toolbar {
  final bool ul;
  final bool ol;
  final bool listStyles;

  const ListButtons({
    this.ul = true,
    this.ol = true,
    this.listStyles = true,
  });

  List<Icon> getIcons() {
    var icons = <Icon>[];
    if (ul) icons.add(Icon(Icons.format_list_bulleted));
    if (ol) icons.add(Icon(Icons.format_list_numbered));
    return icons;
  }
}

/// Paragraph group
class ParagraphButtons extends Toolbar {
  final bool alignLeft;
  final bool alignCenter;
  final bool alignRight;
  final bool alignJustify;
  final bool increaseIndent;
  final bool decreaseIndent;
  final bool textDirection;
  final bool lineHeight;
  final bool caseConverter;

  const ParagraphButtons({
    this.alignLeft = true,
    this.alignCenter = true,
    this.alignRight = true,
    this.alignJustify = true,
    this.increaseIndent = true,
    this.decreaseIndent = true,
    this.textDirection = true,
    this.lineHeight = true,
    this.caseConverter = true,
  });

  List<Icon> getIcons1() {
    var icons = <Icon>[];
    if (alignLeft) icons.add(Icon(Icons.format_align_left));
    if (alignCenter) icons.add(Icon(Icons.format_align_center));
    if (alignRight) icons.add(Icon(Icons.format_align_right));
    if (alignJustify) icons.add(Icon(Icons.format_align_justify));
    return icons;
  }

  List<Icon> getIcons2() {
    var icons = <Icon>[];
    if (increaseIndent) icons.add(Icon(Icons.format_indent_increase));
    if (decreaseIndent) icons.add(Icon(Icons.format_indent_decrease));
    return icons;
  }
}

/// Insert group
class InsertButtons extends Toolbar {
  final bool link;
  final bool picture;
  final bool audio;
  final bool video;
  final bool otherFile;
  final bool table;
  final bool hr;

  const InsertButtons({
    this.link = true,
    this.picture = true,
    this.audio = true,
    this.video = true,
    this.otherFile = false,
    this.table = true,
    this.hr = true,
  });

  List<Icon> getIcons() {
    var icons = <Icon>[];
    if (link) icons.add(Icon(Icons.link));
    if (picture) icons.add(Icon(Icons.image_outlined));
    if (audio) icons.add(Icon(Icons.audiotrack_outlined));
    if (video) icons.add(Icon(Icons.videocam_outlined));
    if (otherFile) icons.add(Icon(Icons.attach_file));
    if (table) icons.add(Icon(Icons.table_chart_outlined));
    if (hr) icons.add(Icon(Icons.horizontal_rule));
    return icons;
  }
}

/// Miscellaneous group
class OtherButtons extends Toolbar {
  final bool fullscreen;
  final bool codeview;
  final bool undo;
  final bool redo;
  final bool help;
  final bool copy;
  final bool paste;
  final bool close;

  const OtherButtons({
    this.fullscreen = true,
    this.codeview = true,
    this.undo = true,
    this.redo = true,
    this.help = true,
    this.copy = true,
    this.paste = true,
    this.close = true,
  });

  List<ImageIcon> getIcons1() {
    var icons = <ImageIcon>[];
    if (fullscreen) {
      icons.add(ImageIcon(Icon(Icons.fullscreen), Icon(Icons.fullscreen)));
    }
    if (codeview) icons.add(ImageIcon(Icon(Icons.code), Icon(Icons.code)));
    if (undo) {
      icons.add(ImageIcon(
          Icon(Icons.undo),
          Image.asset(
            'packages/html_editor_enhanced/images/withdraw@3x.png',
            width: imageSize,
            height: imageSize,
          )));
    }
    if (redo) {
      icons.add(ImageIcon(
          Icon(Icons.redo),
          Image.asset(
            'packages/html_editor_enhanced/images/withdraw4@3x.png',
            width: imageSize,
            height: imageSize,
          )));
    }
    if (help) {
      icons.add(ImageIcon(Icon(Icons.help_outline), Icon(Icons.help_outline)));
    }
    return icons;
  }

  List<ImageIcon> getIcons2() {
    var icons = <ImageIcon>[];
    if (copy) icons.add(ImageIcon(Icon(Icons.copy), Icon(Icons.copy)));
    if (paste) {
      icons.add(ImageIcon(
          Icon(Icons.paste),
          Image.asset(
            'packages/html_editor_enhanced/images/paste@3x.png',
            width: imageSize,
            height: imageSize,
          )));
    }
    if (close) {
      icons.add(ImageIcon(
          Icon(Icons.close),
          Image.asset(
            'packages/html_editor_enhanced/images/cha@3x.png',
            width: imageSize,
            height: imageSize,
          )));
    }
    return icons;
  }
}

class ImageIcon {
  late Icon mIcon;
  late Widget mWidget;

  ImageIcon(Icon icon, Widget widget) {
    this.mIcon = icon;
    this.mWidget = widget;
  }
}
