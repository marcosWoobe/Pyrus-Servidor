
CONFIG = {


    [1] = {message = "Est� perdido? Este � o mapa do server : http://pyrusot.comunidades.net/index.php!", color = 19},
    [2] = {message = "Duvidas? Fa�a suas duvidas no Help Channel", color = 21},
    [3] = {message = "Quando voc� conseguir algo importante RELOGE para nao perder STAFF NAO SE RESPONSABILIZA", color = 21},
	[4] = {message = "AutoLoot :digite /aloot add:nome do item-> para adicionar � lista digite /aloot check-> para checar sua lista de itens digite /aloot delete:nome do item-> para deletar o item da lista Obs.:m�ximo 30 itens na lista", color = 21},
	[4] = {message = "para ser rank 5 basta falar o comando /clan nomedoclan,5 so da para ser 1 clan n�o da para mudar novamente", color = 21},

function onThink()
    getRandom = math.random(1, #CONFIG)
    return doBroadcastMessage(CONFIG[getRandom].message, CONFIG[getRandom].color)
end