local c = {
   [{1,5}] = {
     [13] = {items = {{itemid = 2191, count = 1}}, storage = 40953},
     [19] = {items = {{itemid = 2188, count = 1}}, storage = 40954},
     [22] = {items = {{itemid = 8921, count = 1}}, storage = 40955},
     [26] = {items = {{itemid = 2189, count = 1}}, storage = 40956},
     [33] = {items = {{itemid = 2187, count = 1}, {itemid = 2152, count = 25}}, storage = 40957},
     [37] = {items = {{itemid = 8920, count = 1}, {itemid = 2152, count = 50}}, storage = 40958},
     [42] = {items = {{itemid = 8922, count = 1}, {itemid = 2160, count = 2}}, storage = 40959}
   },
   [{2,6}] = {
     [13] = {items = {{itemid = 2186, count = 1}}, storage = 40953},
     [19] = {items = {{itemid = 2185, count = 1}}, storage = 40954},
     [22] = {items = {{itemid = 8911, count = 1}}, storage = 40955},
     [26] = {items = {{itemid = 2181, count = 1}}, storage = 40956},
     [33] = {items = {{itemid = 2183, count = 1}, {itemid = 2152, count = 25}}, storage = 40957},
     [37] = {items = {{itemid = 8912, count = 1}, {itemid = 2152, count = 50}}, storage = 40958},
     [42] = {items = {{itemid = 8910, count = 1}, {itemid = 2160, count = 2}}, storage = 40959}
   },
   [{3,7}] = {
     [12] = {items = {{itemid = 2389, count = 5}}, storage = 40953},
     [16] = {items = {{itemid = 2389, count = 10}}, storage = 40954},
     [20] = {items = {{itemid = 3965, count = 10}}, storage = 40955},
     [25] = {items = {{itemid = 7378, count = 10}}, storage = 40956},
     [30] = {items = {{itemid = 2456, count = 1}, {itemid = 2544, count = 100}}, storage = 40957},
     [35] = {items = {{itemid = 7364, count = 100}, {itemid = 2152, count = 75}}, storage = 40958},
     [40] = {items = {{itemid = 7365, count = 100}, {itemid = 2160, count = 2}}, storage = 40959}
   },
   [{4,8}] = {
     [15] = {items = {{itemid = 2409, count = 1}}, storage = 40953},
     [30] = {items = {{itemid = 2392, count = 1}, {itemid = 2152, count = 75}}, storage = 40957},
     [40] = {items = {{itemid = 2407, count = 1}, {itemid = 2160, count = 2}}, storage = 40959}
   }
}
function onAdvance(cid, skill, oldlevel, newlevel)
         if skill ~= SKILL__LEVEL then
             return true
         end
         for voc, x in pairs(c) do
             if isInArray(voc, getPlayerVocation(cid)) then
                     for level, z in pairs(x) do
                         if newlevel >= level and getPlayerStorageValue(cid, z.storage) ~= 1 then
                    local text = ""
                    for v = 1, #z.items do
                        count, info = z.items[v].count, getItemInfo(z.items[v].itemid)
                        local ret = ", "
                        if v == 1 then
                            ret = ""
                        elseif v == #z.items then
                            ret = " and "
                        end
                        text = text .. ret
                        text = text .. (count > 1 and count or info.article).." "..(count > 1 and info.plural or info.name)
                        doPlayerAddItem(cid, z.items[v].itemid, z.items[v].count)
                    end
                                 doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Congratz for"..level.." you won "..text..".")
                                 doSendMagicEffect(getPlayerPosition(cid), CONST_ME_FIREWORK_YELLOW)
                                 setPlayerStorageValue(cid, z.storage, 1)
                         end
                     end
             end
         end
         return true
end