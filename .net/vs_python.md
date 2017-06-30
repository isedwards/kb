## Collections

#### Accessing items in a Context Menu

Following is an example of accessing a top-level and second-level item in a context menu in VB.NET and how it could look in Python by comparison:

.NET:

    menu.Items.Item(1).Enabled = True
    DirectCast(menu.Items.Item(2), ToolStripMenuItem).DropDownItems.Item(1).Enabled = True
    
Python:

    menu[1].enabled(True)
    menu[1][2].enabled(True)
