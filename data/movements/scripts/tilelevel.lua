local level = 150 -- Nível necessário para passar
function onStepIn(cid, item, position, fromPosition, toPosition)
          if isPlayer(cid) and getPlayerLevel(cid) < level then
                    doTeleportThing(cid, fromPosition, TRUE)
                    doPlayerSendCancel(cid, 'You need have level '150+' to pass.')
          end
          return TRUE
end