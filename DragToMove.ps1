<# 
.DESCRIPTION 
   PowerShell GUI sample script which allows for the dragging and movement of objects.
 
.Notes 
     NAME:      DragToMove.ps1
     VERSION:   0.0000001
     AUTHOR:    C. Anthony Caragol 
     LASTEDIT:  11/16/2015 
      
.Link 
   Website: http://www.SkypeAdmin.com
   Twitter: http://www.twitter.com/canthonycaragol
   LinkedIn: http://www.linkedin.com/in/canthonycaragol
 
.EXAMPLE 
   .\DragToMove.ps1
#>

[System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
$form = New-Object Windows.Forms.Form
$form.text = "Drag To Move Sample"

$MyLabel = New-Object System.Windows.Forms.Label
$MyLabel.Location = New-Object System.Drawing.Size(10,10) 
$MyLabel.Size = New-Object System.Drawing.Size(60,20) 
$MyLabel.BorderStyle=2
$MyLabel.Text = "Drag Me"

$MyLabel.Add_MouseDown({
$dY = ([System.Windows.Forms.Cursor]::Position.Y ) #read the Y coordinates
$dX = ([System.Windows.Forms.Cursor]::Position.X ) #read the X coordinates
$Global:TCB_Move=$True
$Global:TCB_Offset_X= $dx - $Form.Location.X -$MyLabel.Location.X - 10 #The 10 is a form location offset.
$Global:TCB_Offset_Y= $dy- $Form.Location.Y -$MyLabel.Location.Y - 30 #The 30 is a form locationoffset.
})

$MyLabel.Add_MouseUp({
$Global:TCB_Move=$False
})

$MyLabel.Add_MouseMove({
if ($Global:TCB_Move) {
	$dY = ([System.Windows.Forms.Cursor]::Position.Y ) #read the Y coordinates
	$dX = ([System.Windows.Forms.Cursor]::Position.X ) #read the X coordinates
	$newx=$dx - $Form.Location.X - $Global:TCB_Offset_X - 10
	$newy=$dy - $Form.Location.Y - $Global:TCB_Offset_Y - 30
	$MyLabel.Location = New-Object System.Drawing.Size($newx ,$newy)
	}
})

$Form.Controls.Add($MyLabel) 
$form.ShowDialog()

