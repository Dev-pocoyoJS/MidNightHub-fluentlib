-- src/Themes/init.lua MODIFICADO
-- Adiciona "BlackRed" na lista de temas disponíveis
-- Substitua o arquivo original em: src/Themes/init.lua

local Themes = {
	Names = {
		"Dark",
		"Darker",
		"Light",
		"Aqua",
		"Amethyst",
		"Rose",
		"BlackRed",  -- ← Novo tema adicionado
	},
}

for _, Theme in next, script:GetChildren() do
	local Required = require(Theme)
	Themes[Required.Name] = Required
end

return Themes
