-- BlackRed Custom Theme for Fluent
-- Design: Preto profundo com acentos vermelho vivo
-- Adicione este arquivo em: src/Themes/BlackRed.lua
-- Depois registre no src/Themes/init.lua adicionando "BlackRed" na lista Names

return {
	Name = "BlackRed",

	-- Cor de destaque principal: vermelho vivo
	Accent = Color3.fromRGB(220, 38, 38),

	-- Fundo acrílico: preto profundo
	AcrylicMain = Color3.fromRGB(12, 12, 12),
	AcrylicBorder = Color3.fromRGB(180, 30, 30),
	AcrylicGradient = ColorSequence.new(Color3.fromRGB(8, 8, 8), Color3.fromRGB(20, 5, 5)),
	AcrylicNoise = 0.85,

	-- Barra de título: linha vermelho escuro
	TitleBarLine = Color3.fromRGB(160, 20, 20),

	-- Tabs: cinza escuro com toque vermelho
	Tab = Color3.fromRGB(200, 45, 45),

	-- Elementos da UI
	Element = Color3.fromRGB(180, 40, 40),
	ElementBorder = Color3.fromRGB(15, 15, 15),
	InElementBorder = Color3.fromRGB(60, 10, 10),
	ElementTransparency = 0.85,

	-- Toggle
	ToggleSlider = Color3.fromRGB(160, 30, 30),
	ToggleToggled = Color3.fromRGB(0, 0, 0),

	-- Slider
	SliderRail = Color3.fromRGB(150, 25, 25),

	-- Dropdown
	DropdownFrame = Color3.fromRGB(200, 50, 50),
	DropdownHolder = Color3.fromRGB(18, 5, 5),
	DropdownBorder = Color3.fromRGB(12, 12, 12),
	DropdownOption = Color3.fromRGB(180, 40, 40),

	-- Keybind
	Keybind = Color3.fromRGB(180, 40, 40),

	-- Input
	Input = Color3.fromRGB(200, 50, 50),
	InputFocused = Color3.fromRGB(8, 2, 2),
	InputIndicator = Color3.fromRGB(160, 30, 30),

	-- Dialog
	Dialog = Color3.fromRGB(20, 5, 5),
	DialogHolder = Color3.fromRGB(14, 4, 4),
	DialogHolderLine = Color3.fromRGB(10, 3, 3),
	DialogButton = Color3.fromRGB(25, 7, 7),
	DialogButtonBorder = Color3.fromRGB(100, 20, 20),
	DialogBorder = Color3.fromRGB(80, 15, 15),
	DialogInput = Color3.fromRGB(30, 8, 8),
	DialogInputLine = Color3.fromRGB(200, 50, 50),

	-- Texto
	Text = Color3.fromRGB(255, 255, 255),
	SubText = Color3.fromRGB(200, 160, 160),
	Hover = Color3.fromRGB(180, 35, 35),
	HoverChange = 0.07,
}
