'** Creates given node object
'@param class class of the object to be created
'@param fields object fields
Function CreateNodeObject(nodeType As String, fields = {} As Object) As Object
    node = CreateObject("roSGNode", nodeType)
    node.SetFields(fields)
    Return node
End Function


'** Creates a Timer node object, with the given callback
'@param fields timer object fields
'@param callBack timer callback function
Function CreateTimerObject(fields As Object, callBack As String) As Object
    obj = CreateNodeObject("Timer", fields)
    obj.ObserveField("fire", callBack)
    Return obj
End Function
