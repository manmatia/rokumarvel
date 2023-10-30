sub init()
    m.itemList = m.top.findNode("itemList")
    m.movieViewer = m.top.findNode("movieViewer")
    m.dataMovieScreen = m.top.findNode("dataMovieScreen")
    m.infoIcon = m.top.findNode("infoIcon")
    
    m.itemList.setFocus(true)
    ' createTask()
end sub

' sub createTask()
'     ' movietsk seria como la peticion a la api
'     m.movieTask = CreateObject("roSGNode", "movieTask")
'     m.movieTask.observeField("output", "onOutputChanged")
'     m.movieTask.control = "RUN"
'   end sub

' sub onOutputChanged()        
'     for i = 0 to m.movieTask.output.getChildCount()
'         contentDataPosition = m.movieTask.output.getChild(i)
        
'         m.newItem = m.itemList.createChild("CustomizedItem")
'         m.newItem.content = contentDataPosition
'     end for 
'     changeInfoDataMovies()
' end sub

' function onKeyEvent(key as String, press as Boolean) as Boolean
'     handled = false
'       if (press) then
'         if (key = "right")
'             if m.itemList.isInFocusChain()
'                 m.itemList.replaceChild((m.itemList.getChild(0)), 12)
'                 changeInfoDataMovies()
'                 handled = true
'             end if
'         else if (key = "left")
'             m.infoIcon.opacity = 1
'             handled = true
'         end if
'     end if
'     return handled
'   end function

' sub  changeInfoDataMovies()    
'     m.movieViewer.videoUrl = m.itemList.getChild(0).urlVideo
'     m.dataMovieScreen.titleMovie =  m.itemList.getChild(0).titleMovieItemLabel
'     m.dataMovieScreen.subtitleMovie =   m.itemList.getChild(0).subtitleItemLabel
'     m.dataMovieScreen.descriptionMovie =    m.itemList.getChild(0).descriptionMovieLabel
' end sub