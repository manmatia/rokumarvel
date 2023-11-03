sub init()
    m.botonMarvel1 = m.top.findNode("botonMarvel1")
    m.botonMarvel2 = m.top.findNode("botonMarvel2")
    m.botonMarvel3 = m.top.findNode("botonMarvel3")
    
    ' Establecer el enfoque en el primer póster y ajustar la opacidad
    m.botonMarvel1.setFocus(true)
    m.botonMarvel1.opacity = 1.0
    m.botonMarvel2.opacity = 0.3
    m.botonMarvel3.opacity = 0.3

    m.botonMarvel1.observeField("buttonSelected", "onButtonSelected")
    
        setVideo()
end sub

function setVideo() 
    videoContent = createObject("RoSGNode", "ContentNode")
    ' videoContent.URL = "https://www.google.com.ar/search?q=intro+de+marvel+video&sca_esv=577833058&tbm=vid&sxsrf=AM9HkKkH7rIvtEXPnjjGqYSF4zcnNMgFrA:1698679432050&source=lnms&sa=X&ved=2ahUKEwi8tImBip6CAxXzq5UCHanNAdoQ_AUoAXoECAIQAw&biw=1440&bih=779&dpr=2#fpstate=ive&vld=cid:b1d02f9b,vid:2SkMUjilx_M,st:0"
   videoContent.URL="pkg:/images/MARVEL.mp4"
    videoContent.title = "Marvel"
    videoContent.streamformat = "mp4"
    
        m.video = m.top.findNode("videoPlayer")
        m.video.content = videoContent
        m.video.control = "play"
        m.video.focusable=true
        print m.video.content
  
end function



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
            ' botón "OK"
            if m.botonMarvel1.isInFocusChain()
                ' Abrir la escena "Capitan"
                capitanComponent = m.top.findNode("Capitan")
                ' Verifica si ya existe la escena "Capitan"
                if capitanComponent = invalid
                    capitanComponent = m.top.createChild("Capitan")
                end if
                m.top.setFocus(capitanComponent)
                handled = true
            else if m.botonMarvel2.isInFocusChain()
                print "OKbotonMarvel2"
                
                handled = true
            else if m.botonMarvel3.isInFocusChain()
                print "OK botonMarvel3"
                
                handled = true
            end if
        end if
    end if
    
    return handled
end function

sub onButtonSelected(event as Object)
    if event.isButtonPressed("OK")
        if event.getTarget() = m.botonMarvel1
            print "OK pressed on botonMarvel1"
            ' Crear e inicializar la escena "Capitan"
            capitanComponent = m.top.findNode("Capitan")
            if capitanComponent = invalid
                capitanComponent = m.top.createChild("Capitan")
            end if
            m.top.setFocus(capitanComponent)
        end if
    end if
end sub
