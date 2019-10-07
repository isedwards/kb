Creating a dictionary by zipping two lists of equal length:

```vbnet
Dim dict As New Dictionary(Of String, String)
Dim keys As New List(Of String)(New String() {"a", "b", "c"})
Dim values As New List(Of String)(New String() {"1", "2", "3"})

For Each keyValue In keys.Zip(Of String, Object)(values, Function(s1, s2) Tuple.Create(s1, s2))
    dict.Add(keyValue.Item1, keyValue.Item2)
Next
        
```
