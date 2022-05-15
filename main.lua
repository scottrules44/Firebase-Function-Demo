local firebaseFunctions = require "plugin.firebaseFunctions"
local json = require "json"
local widget = require("widget")
firebaseFunctions.init()


local bg = display.newRect( display.contentCenterX, display.contentCenterY, display.actualContentWidth, display.actualContentHeight )
bg:setFillColor( 1,.54 ,0 )

local title = display.newText( {text = "Firebase Functions", fontSize = 20} )
title.width, title.height = 300, 168
title.x, title.y = display.contentCenterX, 168*.5
title:setFillColor(1,1,1)

local triggerFunction = widget.newButton( {
  x = display.contentCenterX,
  y = display.contentCenterY,
  id = "triggerFunction",
  labelColor = { default={ 1, 1, 1 }, over={ 0, 0, 0, 0.5 } },
  label = "Trigger Function",
  onEvent = function ( e )
    if (e.phase == "ended") then
        firebaseFunctions.call("addOne", {value=1}, function(e)
            print(json.encode(e))
        end)

    end
  end
} )
