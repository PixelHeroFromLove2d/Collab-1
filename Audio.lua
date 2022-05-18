--Audio
a = {}

function a.load()

    source1 = love.audio.newSource( "Backgroundsong1.wav", "stream" )
    source2 = love.audio.newSource( "Backgroundsong2.wav", "stream" )
    source3 = love.audio.newSource( "Backgroundsong3.wav", "stream" )
    i = love.math.random( 1, 3 )

    if i == 1 then
        source = source1
    elseif i == 2 then
        source = source2
    end

end

function a.update(dt)

    
	if not source:isPlaying( ) then
        i = love.math.random( 1, 3 )
        if i == 1 then
            source = source1
        elseif i == 2 then
            source = source2
        elseif i == 3 then
            source = source3
        end
        love.audio.play( source )
    end
end

return a
