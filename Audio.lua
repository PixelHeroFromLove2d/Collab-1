--Audio
a = {}
function a.load()
    source = love.audio.newSource( "Backgroundsong.wav", "stream" )
end

function a.update(dt)
	if not source:isPlaying( ) then
	    love.audio.play( source )
    end
end

return a