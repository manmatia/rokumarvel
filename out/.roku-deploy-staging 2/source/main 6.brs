sub Main()
    print "in showChannelSGScreen"
    screen = CreateObject("roSGScreen")
    m.port = CreateObject("roMessagePort")
    screen.setMessagePort(m.port)
    scene = screen.CreateScene("mainScreen")
    ' color de fondo 
    scene.backgroundColor= "0x000000" 
    scene.backgroundUri = "pkg:/images/iron.png"
    screen.show() 
  
    while(true)
      msg = wait(0, m.port)
      msgType = type(msg)
  
      if msgType = "roSGScreenEvent"
      if msg.isScreenClosed() then return
      end if
    end while
end sub