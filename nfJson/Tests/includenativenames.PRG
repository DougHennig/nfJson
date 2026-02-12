* This test shows how you can include properties that match native names.

if not file('nfJsonCreate.prg')
	set path to ..\
endif not file('nfJsonCreate.prg')

loItem = createobject('Sample')
loItem.ID      = 1
loItem.Height  = 10
loItem.Width   = 20
loItem.Comment = 'Testing'

lcJSON = nfJSONCreate(loItem, .T.)
messagebox(lcJSON, 0, 'JSON (Missing Native Names')

lcJSON = nfJSONCreate(loItem, .T., , , 'UC')
messagebox(lcJSON, 0, 'JSON Using UC for Members Flag (Name Included)')

dimension laProperties[4, 2]
laProperties[1, 1] = 'Height'
laProperties[1, 2] = .F.
laProperties[2, 1] = 'Width'
laProperties[2, 2] = .F.
laProperties[3, 1] = 'Comment'
laProperties[3, 2] = .F.
laProperties[4, 1] = 'Name'
laProperties[4, 2] = .T.

lcJSON = nfJSONCreate(loItem, .T., , , 'UC', , @laProperties)
messagebox(lcJSON, 0, 'JSON Specifying Properties (Name Excluded)')

define class Sample as Custom
	ID      = 0
	Height  = 0
	Width   = 0
	Comment = ''
enddefine
