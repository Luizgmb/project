local freeBlessMaxLevel = 60

function onLogin(cid)
    local player = Player(cid)
    if player:getLevel() <= freeBlessMaxLevel then
        for i = 1, 6 do
            player:addBlessing(i)
        end
    end
    return true
end