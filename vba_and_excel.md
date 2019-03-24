
# Excel VBA Case

[Excel VBA Reference]('https://docs.microsoft.com/en-us/office/vba/api/overview/excel)

[Populate a list with unique values](https://docs.microsoft.com/en-us/office/vba/excel/concepts/controls-dialogboxes-forms/add-a-unique-list-of-values-to-a-combo-box)

[PowerShell Proxy](http://woshub.com/using-powershell-behind-a-proxy/)

(https://stackoverflow.com/questions/12431231/convert-text-to-columns-in-excel-using-vba)

https://www.ozgrid.com/forum/forum/help-forums/excel-general/41231-paste-with-text-import-wizard-in-vba

http://access.mvps.org/access/api/api0049.htm
https://stackoverflow.com/questions/36456930/how-to-debug-print-into-a-column-or-text-field-in-access
```vb
Sub Populate_Combobox_Worksheet()
    'The Excel workbook and worksheets that contain the data, as well as the range placed on that data
    Dim wbBook As Workbook
    Dim wsSheet As Worksheet
    Dim rnData As Range

    'Variant to contain the data to be placed in the combo box.
    Dim vaData As Variant

    'Initialize the Excel objects
    Set wbBook = ThisWorkbook
    Set wsSheet = wbBook.Worksheets("Sheet1")

    'Set the range equal to the data, and then (temporarily) copy the unique values of that data to the L column.
    With wsSheet
        Set rnData = .Range(.Range("A1"), .Range("A100").End(xlUp))
        rnData.AdvancedFilter Action:=xlFilterCopy, _
                          CopyToRange:=.Range("L1"), _
                          Unique:=True
        'store the unique values in vaData
        vaData = .Range(.Range("L2"), .Range("L100").End(xlUp)).value
        'clean up the contents of the temporary data storage
        .Range(.Range("L1"), .Range("L100").End(xlUp)).ClearContents
    End With

    'display the unique values in vaData in the combo box already in existence on the worksheet.
    With wsSheet.OLEObjects("ComboBox1").Object
        .Clear
        .List = vaData
        .ListIndex = -1
    End With

End Sub
```

```vb
Sub Populate_Combobox_Worksheet_Collection()
'https://docs.microsoft.com/en-us/office/vba/excel/concepts/controls-dialogboxes-forms/add-a-unique-list-of-values-to-a-combo-box
    'The Excel workbook and worksheets that contain the data, as well as the range placed on that data
    Dim wbBook As Workbook
    Dim wsSheet As Worksheet
    Dim rnData As Range

    Dim vaData As Variant               'the list, stored in a variant

    Dim ncData As New VBA.Collection    'the list, stored in a collection

    Dim lnCount As Long                 'the count used in the On Error Resume Next loop.

    Dim vaItem As Variant               'a variant representing the type of items in ncData

    'Instantiate the Excel objects.
    Set wbBook = ThisWorkbook
    Set wsSheet = wbBook.Worksheets("Sheet2")

    'Using Sheet2,retrieve the range of the list in Column A.
    With wsSheet
        Set rnData = .Range(.Range("A2"), .Range("A100").End(xlUp))
    End With

    'Place the list values into vaData.
    vaData = rnData.value

    'Place the list values from vaData into the VBA.Collection.
    On Error Resume Next
        For lnCount = 1 To UBound(vaData)
        ncData.Add vaData(lnCount, 1), CStr(vaData(lnCount, 1))
    Next lnCount
    On Error GoTo 0

    'Clear the combo box (in case you ran the macro before),
    'and then add each unique variant item from ncData to the combo box.
    With wsSheet.OLEObjects("ComboBox1").Object
        .Clear
        For Each vaItem In ncData
            .AddItem ncData(vaItem)
        Next vaItem
    End With

End Sub
```


Clipboard Functions
```vb
Option Explicit


' Credits to Leigh Webber on his publishing at https://social.msdn.microsoft.com/Forums/office/en-US/ee9e0d28-0f1e-467f-8d1d-1a86b2db2878/a-clipboard-object-for-vba-including-microsoft-word?forum=worddev

' Executint sub Test1

Sub test1()
    'This tests stuffs some formatted text (RTF) onto the clipboard. Run the test, then
    'go into word and hit Ctrl+V to paste it in.
    Dim myClipboard As New vbaClipboard
    Dim sRTF As String
    sRTF = "{\rtf1\ansi\ansicpg1252\deff0\deftab720{\fonttbl" & _
           "{\f0\fswiss MS Sans Serif;}{\f1\froman\fcharset2 Symbol;}" & _
           "{\f2\froman\fprq2 Times New Roman;}}" & _
           "{\colortbl\red0\green0\blue0;\red255\green0\blue0;}" & _
           "\deflang1033\horzdoc{\*\fchars }{\*\lchars }" & _
           "\pard\plain\f2\fs24 This is some \plain\f2\fs24\cf1" & _
           "formatted\plain\f2\fs24  text.\par }"

    myClipboard.SetClipboardText sRTF, "Rich Text Format"
End Sub


Sub test2()
    'This routine tests the vbaClipboard object.
    'Before running this, copy some text from Word. This will place Rich Text Format data
    'on the clipboard. The test will preserve the RTF data, then use the clipboard
    'to manipulate some plain text ("CF_TEXT"). Finally, the test will put the
    'RTF data back on the clipboard. When the test is finished, you should be able
    'to go back into Word and hit Ctrl+V and paste your original copied text (with formatting).

    'Instantiate a vbaClipboard object
    Dim myClipboard As New vbaClipboard

    'The ClipboardFormat class encapsulates a clipboard format number and a name
    Dim clipboardFormat As clipboardFormat

    'Handle errors below
    On Error GoTo ErrorHandler

    'Show the currently available formats
    'The ClipboardFormatsAvailable property returns a collection of ClipboardFormat objects
    'representing all formats currently available on the clipboard.

    Debug.Print "===================================================================="

    For Each clipboardFormat In myClipboard.ClipboardFormatsAvailable
        Debug.Print clipboardFormat.Number, clipboardFormat.Name
    Next clipboardFormat

    'Preserve the RTF currently on the clipboard (you did copy some, right?)
    Dim oldRTF As String
    'Get the format number value for Rich Text Format
    Dim richTextFormatNumber As Long
    On Error Resume Next
    richTextFormatNumber = myClipboard.ClipboardFormatsAvailable("Rich Text Format").Number
    If Err.Number <> 0 Then
        On Error GoTo ErrorHandler
        Err.Raise vbObjectError + 1, , "The clipboard does not have any Rich Text Format data."
    End If
    On Error GoTo ErrorHandler

    'Get the RTF data from the clipboard
    oldRTF = myClipboard.GetClipboardText(richTextFormatNumber)
    'Debug.Print oldRTF

    'Use the clipboard for something else
    Dim s As String
    s = "Hello, world!"
    myClipboard.SetClipboardText s, "CF_TEXT"

    'Get it back again
    Debug.Print myClipboard.GetClipboardText(1)

    'Show the currently available formats
    Debug.Print "===================================================================="
    For Each clipboardFormat In myClipboard.ClipboardFormatsAvailable
        Debug.Print clipboardFormat.Number, clipboardFormat.Name
    Next clipboardFormat

    'Now put back the RTF
    myClipboard.SetClipboardText oldRTF, "Rich Text Format"

    'Show the currently available formats
    Debug.Print "===================================================================="
    For Each clipboardFormat In myClipboard.ClipboardFormatsAvailable
        Debug.Print clipboardFormat.Number, clipboardFormat.Name
    Next clipboardFormat
    'You can now paste back into Word, and you'll get whatever text you selected
    Exit Sub
ErrorHandler:
    MsgBox Err.description
End Sub


```

```vb
Private Sub Worksheet_SelectionChange(ByVal Target As Range)
    Dim rInt As Range
    Dim rCell As Range

    Set rInt = Intersect(Target, Range("C3:P312"))
    If Not rInt Is Nothing Then
        For Each rCell In rInt
            rCell.Value = "x"
        Next
    End If
    Set rInt = Nothing
    Set rCell = Nothing
End Sub
```

```vb
Private Sub Worksheet_BeforeDoubleClick( _
            ByVal Target As Range, Cancel As Boolean)
    Dim rInt As Range
    Dim rCell As Range

    Set rInt = Intersect(Target, Range("C3:P312"))
    If Not rInt Is Nothing Then
        For Each rCell In rInt
            rCell.Value = "x"
        Next
    End If
    Set rInt = Nothing
    Set rCell = Nothing
    Cancel = True
End Sub
```

```vb
Public Sub GetRange()

    'Excel objects.
    Dim wb As Workbook
    Dim ws As Worksheet
    Dim wsName As String
        'Initialize the Excel objects.
    Set wb = ThisWorkbook
    Set ws = ActiveSheet
    ws.Activate
    wsName = ws.Name

    Dim rRange As Range
    Dim strRName As String

    Dim var As Variant
    'Do While
    Dim vlen As Integer
    vlen = ws.Columns.Count
    With ws
        'rRange = .Range(.Cells(1, 1), .Cells(1, .Columns.Count))
        vlen = WorksheetFunction.CountA( _
            .Range( _
                .Cells(1, 1), _
                .Cells(1, _
                    .Columns.Count) _
                ) _
            )
    End With


    Dim strIn As String
    Dim strOut As String

    Debug.Print vlen
    For iter = 1 To vlen Step 1
        Set CurCell = ws.Cells(1, iter)
        Debug.Print CurCell.Value

        Debug.Print Format(Mid(CurCell.Value, 1, 1), "&>") + _
            Format(Mid(CurCell.Value, 2, 7), "<&&&&&&&&&&")
    Next iter
End Sub
```
