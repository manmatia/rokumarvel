sub init()
    m.botonMarvel1 = m.top.findNode("botonMarvel1")
    m.botonMarvel2 = m.top.findNode("botonMarvel2")
    m.botonMarvel3 = m.top.findNode("botonMarvel3")
    
    ' Establecer el enfoque en el primer póster y ajustar la opacidad
    m.botonMarvel1.setFocus(true)
    m.botonMarvel1.opacity = 1.0
    m.botonMarvel2.opacity = 0.3
    m.botonMarvel3.opacity = 0.3

    m.botonMarvel1.observeField("buttonSelected", "onPosterButtonSelected")
    m.botonMarvel2.observeField("buttonSelected", "onPosterButtonSelected")
    m.botonMarvel3.observeField("buttonSelected", "onPosterButtonSelected")
  
    setVideo()
    
end sub

function setVideo() 
    videoContent = createObject("RoSGNode", "ContentNode")
    videoContent.URL = "https://www.google.com.ar/search?q=intro+de+marvel+video&sca_esv=577833058&tbm=vid&sxsrf=AM9HkKkH7rIvtEXPnjjGqYSF4zcnNMgFrA:1698679432050&source=lnms&sa=X&ved=2ahUKEwi8tImBip6CAxXzq5UCHanNAdoQ_AUoAXoECAIQAw&biw=1440&bih=779&dpr=2#fpstate=ive&vld=cid:b1d02f9b,vid:2SkMUjilx_M,st:0"
    videoContent.title = "Marvel"
    videoContent.streamformat = "mp4"
    
        m.video = m.top.findNode("videoPlayer")
        m.video.content = videoContent
        m.video.control = "play"
        m.video.focusable=true
        print m.video.content
  
end function

sub onPosterButtonSelected(event as Object)
    if event.isButtonPressed("OK")
        ' Aquí puedes abrir una nueva ventana y realizar acciones específicas para cada póster
        if event.getTarget() = m.botonMarvel1
            ' Acciones específicas para botonMarvel1
            print "OK pressed on botonMarvel1"
            capitanComponent= m.top.createChild("Capitan")
            m.top.setFocus(capitanComponent)
            ' Agrega aquí la lógica para la ventana correspondiente a botonMarvel1
        else if event.getTarget() = m.botonMarvel2
            ' Acciones específicas para botonMarvel2
            print "OK pressed on botonMarvel2"
            ' Agrega aquí la lógica para la ventana correspondiente a botonMarvel2
        else if event.getTarget() = m.botonMarvel3
            ' Acciones específicas para botonMarvel3
            print "OK pressed on botonMarvel3"
            ' Agrega aquí la lógica para la ventana correspondiente a botonMarvel3
        end if
    end if
end sub

function onKeyEvent(key as String, press as Boolean) as Boolean
    handled = false
    
    if press then
        ' Verificar las teclas presionadas
        if key = "right"
            ' Cambiar el enfoque y la opacidad al siguiente póster
            if m.botonMarvel1.isInFocusChain()
                m.botonMarvel1.setFocus(false)
                m.botonMarvel2.setFocus(true)
                m.botonMarvel1.opacity = 0.3
                m.botonMarvel2.opacity = 1.0
                handled = true
            else if m.botonMarvel2.isInFocusChain()
                m.botonMarvel2.setFocus(false)
                m.botonMarvel3.setFocus(true)
                m.botonMarvel2.opacity = 0.3
                m.botonMarvel3.opacity = 1.0
                handled = true
            end if
        else if key = "left"
            ' Cambiar el enfoque y la opacidad al póster anterior
            if m.botonMarvel3.isInFocusChain()
                m.botonMarvel3.setFocus(false)
                m.botonMarvel2.setFocus(true)
                m.botonMarvel3.opacity = 0.3
                m.botonMarvel2.opacity = 1.0
                handled = true
            else if m.botonMarvel2.isInFocusChain()
                m.botonMarvel2.setFocus(false)
                m.botonMarvel1.setFocus(true)
                m.botonMarvel2.opacity = 0.3
                m.botonMarvel1.opacity = 1.0
                handled = true
            end if

        else if key = "ok"
            ' Acciones específicas para el botón "OK"
            if m.botonMarvel1.isInFocusChain()
                print "OK pressed on botonMarvel1"
                capitanComponent = m.top.createChild("Capitan")
                m.top.setFocus(capitanComponent)
                ' Agrega aquí la lógica para la ventana correspondiente a botonMarvel1
                handled = true
            else if m.botonMarvel2.isInFocusChain()
                print "OK pressed on botonMarvel2"
                ' Agrega aquí la lógica para la ventana correspondiente a botonMarvel2
                handled = true
            else if m.botonMarvel3.isInFocusChain()
                print "OK pressed on botonMarvel3"
                ' Agrega aquí la lógica para la ventana correspondiente a botonMarvel3
                handled = true
            end if
        end if
    end if
    
    return handled
end function