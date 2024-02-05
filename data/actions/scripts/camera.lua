function onUse(cid, item, frompos, item2, topos)

	if getPlayerStorageValue(cid, 99284) == 2 then
		doPlayerSendCancel(cid, "Tienes que cerrar el chat privado para poder Gravar.")
	return true
	end

	if getPlayerStorageValue(cid, 99284) == 1 then
		doPlayerSendCancel(cid, "Tu ya estas al aire! Tu Canal de Tv es: "..getPlayerStorageValue(cid, 99285).."")
		doPlayerSendChannel(cid, getPlayerChannelId(cid), getPlayerStorageValue(cid, 99285))
	return true
	end

if not isPremium(cid) then
doPlayerSendCancel(cid, "Solo premmium account pueden gravar videos.")
return true
end

	doPlayerPopupFYI(cid, "Escoje un nombre para tu canal")

end