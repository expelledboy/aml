Anthony's Markup Language
=========================

If you have ever tried to write an XML parser you would know that XML is not
machine-readable, and as we all know its not human-readable either.

Taking the assumption that if its hard to parse programmatically then it will
difficult to read manually.

To that end I seek to create a Markup Language for which writing an encoder and
decoder is trivial, and can almost be done inline.

## Considerations

- Minimal fluff and overhead `<data><value><string>my point</string></value></data>`
- Extendible syntax ( leave room for improvements )
- Syntax should not interfere with data `<value>&lt;/value&gt;</value>`
- Easily built and parsed
- Readable in plain text
- Simple syntax ( ie should be trivial to create syntax highlighting rules )


## Basic Idea

```
....name. Anthony
^   ^    ^
|   |    \-- data
|   \------- tag
\----------- depth
```

Possible extensions

```
....create ~date(YY-MM-DD). 13-05-21
           ^
           \-- data types
```

## Comparing Alternatives

JSON:

```
{"widget": {
    "debug": "on",
    "window": {
        "title": "Sample Konfabulator Widget",
        "name": "main_window",
        "width": 500,
        "height": 500
    },
    "image": { 
        "src": "Images/Sun.png",
        "name": "sun1",
        "hOffset": 250,
        "vOffset": 250,
        "alignment": "center"
    },
    "text": {
        "data": "Click Here",
        "size": 36,
        "style": "bold",
        "name": "text1",
        "hOffset": 250,
        "vOffset": 100,
        "alignment": "center",
        "onMouseUp": "sun1.opacity = (sun1.opacity / 100) * 90;"
    }
}}

```

XML

```
<widget>
    <debug>on</debug>
    <window title="Sample Konfabulator Widget">
        <name>main_window</name>
        <width>500</width>
        <height>500</height>
    </window>
    <image src="Images/Sun.png" name="sun1">
        <hOffset>250</hOffset>
        <vOffset>250</vOffset>
        <alignment>center</alignment>
    </image>
    <text data="Click Here" size="36" style="bold">
        <name>text1</name>
        <hOffset>250</hOffset>
        <vOffset>100</vOffset>
        <alignment>center</alignment>
        <onMouseUp>
            sun1.opacity = (sun1.opacity / 100) * 90;
        </onMouseUp>
    </text>
</widget>

```

AML

```
.widget.
..debug. on
..window.
...title. Sample Konfabulator Widget
...name. main_window
...width. 500
...height. 500
..image.
...src. Images/Sun.png
...name. sun1
...hOffset. 250
...vOffset. 250
...alignment. center
..text.
...data. Click Here
...size. 36
...style. bold
...name. text1
...hOffset. 250
...vOffset. 100
...alignment. center
...onMouseUp. sun1.opacity = (sun1.opacity / 100) * 90;

```
