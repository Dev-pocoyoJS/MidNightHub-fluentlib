--[[
    ╔══════════════════════════════════════════════════════════╗
    ║         FLUENT — TEMA BlackRed — EXEMPLO COMPLETO        ║
    ║                                                          ║
    ║  COMO USAR:                                              ║
    ║  1. Copie BlackRed.lua  → src/Themes/BlackRed.lua        ║
    ║  2. Copie Window.lua    → src/Components/Window.lua      ║
    ║  3. Copie Themes_init.lua → src/Themes/init.lua          ║
    ║  4. Execute este script no Roblox Studio ou executor     ║
    ╚══════════════════════════════════════════════════════════╝
]]

-- Carrega a lib Fluent (ajuste o caminho se estiver local)
local Fluent = loadstring(game:HttpGet(
    "https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"
))()

-- ─── Criação da Janela ───────────────────────────────────────────────────────
local Window = Fluent:CreateWindow({
    Title = "BlackRed UI",
    SubTitle = "Tema Personalizado",
    TabWidth = 160,
    Size = UDim2.fromOffset(600, 460),
    Acrylic = false,   -- true para blur (pode ser detectado por alguns anticheat)
    Theme = "BlackRed", -- ← Nosso novo tema
    MinimizeKey = Enum.KeyCode.RightControl,
})

-- ─── Tabs ────────────────────────────────────────────────────────────────────
local Tabs = {
    Main     = Window:AddTab({ Title = "Principal",   Icon = "home" }),
    Combat   = Window:AddTab({ Title = "Combate",     Icon = "sword" }),
    Visual   = Window:AddTab({ Title = "Visual",      Icon = "eye" }),
    Settings = Window:AddTab({ Title = "Config",      Icon = "settings" }),
}

local Options = Fluent.Options

-- ─── NOTIFICAÇÃO INICIAL ─────────────────────────────────────────────────────
Fluent:Notify({
    Title = "BlackRed Carregado",
    Content = "Tema preto e vermelho ativo com logo no fundo.",
    SubContent = "Pressione RightCtrl para minimizar",
    Duration = 6,
})

-- ═══════════════════════════════════════════════════════════════════════════════
--  TAB: PRINCIPAL
-- ═══════════════════════════════════════════════════════════════════════════════
do
    Tabs.Main:AddParagraph({
        Title = "Bem-vindo",
        Content = "Este é o tema BlackRed do Fluent.\n"
                .. "Cores principais: Preto profundo + Vermelho vivo.\n"
                .. "Logo da sua organização aparece no canto inferior direito.",
    })

    -- Botão com Dialog
    Tabs.Main:AddButton({
        Title = "Ação Principal",
        Description = "Clique para abrir um diálogo de confirmação",
        Callback = function()
            Window:Dialog({
                Title = "Confirmar Ação",
                Content = "Você tem certeza que deseja executar esta ação?",
                Buttons = {
                    {
                        Title = "Confirmar",
                        Callback = function()
                            Fluent:Notify({
                                Title = "Sucesso",
                                Content = "Ação executada com sucesso!",
                                Duration = 3,
                            })
                        end,
                    },
                    {
                        Title = "Cancelar",
                        Callback = function()
                            print("Cancelado.")
                        end,
                    },
                },
            })
        end,
    })

    -- Toggle
    local GodModeToggle = Tabs.Main:AddToggle("GodMode", {
        Title = "God Mode",
        Description = "Ativa invulnerabilidade",
        Default = false,
    })
    GodModeToggle:OnChanged(function()
        print("God Mode:", Options.GodMode.Value)
    end)

    -- Slider – Velocidade
    local SpeedSlider = Tabs.Main:AddSlider("WalkSpeed", {
        Title = "WalkSpeed",
        Description = "Velocidade de caminhada do personagem",
        Default = 16,
        Min = 0,
        Max = 200,
        Rounding = 0,
        Callback = function(Value)
            -- game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
            print("WalkSpeed:", Value)
        end,
    })

    -- Slider – JumpPower
    local JumpSlider = Tabs.Main:AddSlider("JumpPower", {
        Title = "JumpPower",
        Description = "Poder de salto",
        Default = 50,
        Min = 0,
        Max = 300,
        Rounding = 0,
        Callback = function(Value)
            print("JumpPower:", Value)
        end,
    })

    -- Input
    local NameInput = Tabs.Main:AddInput("PlayerName", {
        Title = "Nome do Alvo",
        Default = "",
        Placeholder = "Digite o nome do jogador...",
        Numeric = false,
        Finished = true,
        Callback = function(Value)
            print("Alvo definido:", Value)
        end,
    })

    -- Dropdown simples
    local TeamDropdown = Tabs.Main:AddDropdown("Team", {
        Title = "Selecionar Time",
        Values = { "Neutro", "Vermelho", "Azul", "Verde", "Amarelo" },
        Multi = false,
        Default = 1,
    })
    TeamDropdown:OnChanged(function(Value)
        print("Time selecionado:", Value)
    end)
end

-- ═══════════════════════════════════════════════════════════════════════════════
--  TAB: COMBATE
-- ═══════════════════════════════════════════════════════════════════════════════
do
    Tabs.Combat:AddParagraph({
        Title = "Opções de Combate",
        Content = "Configure aimbot, ESP e outros recursos de combate.",
    })

    local AimbotToggle = Tabs.Combat:AddToggle("Aimbot", {
        Title = "Aimbot",
        Description = "Travamento de mira automático",
        Default = false,
    })

    local AimSmoothSlider = Tabs.Combat:AddSlider("AimSmooth", {
        Title = "Suavidade do Aim",
        Default = 5,
        Min = 1,
        Max = 10,
        Rounding = 1,
        Callback = function(v) print("Aim smooth:", v) end,
    })

    local AimPartDropdown = Tabs.Combat:AddDropdown("AimPart", {
        Title = "Parte do Corpo",
        Values = { "Head", "HumanoidRootPart", "UpperTorso", "LowerTorso" },
        Multi = false,
        Default = 1,
    })

    local SilentAim = Tabs.Combat:AddToggle("SilentAim", {
        Title = "Silent Aim",
        Description = "Mira sem movimento visível da câmera",
        Default = false,
    })

    -- Keybind para ativar Aimbot manualmente
    local AimKeybind = Tabs.Combat:AddKeybind("AimKey", {
        Title = "Tecla do Aimbot",
        Mode = "Hold",
        Default = "MouseButton2",
        Callback = function(Active)
            print("Aimbot Hold:", Active)
        end,
        ChangedCallback = function(New)
            print("Keybind alterado para:", New)
        end,
    })
end

-- ═══════════════════════════════════════════════════════════════════════════════
--  TAB: VISUAL
-- ═══════════════════════════════════════════════════════════════════════════════
do
    Tabs.Visual:AddParagraph({
        Title = "ESP & Visual",
        Content = "Personalize como os jogadores aparecem na tela.",
    })

    local EspToggle = Tabs.Visual:AddToggle("ESP", {
        Title = "ESP Jogadores",
        Description = "Mostra caixas ao redor de jogadores",
        Default = false,
    })

    local ChamsToggle = Tabs.Visual:AddToggle("Chams", {
        Title = "Chams",
        Description = "Realça personagens através de paredes",
        Default = false,
    })

    -- Colorpicker para cor do ESP
    local EspColor = Tabs.Visual:AddColorpicker("EspColor", {
        Title = "Cor do ESP",
        Default = Color3.fromRGB(220, 38, 38), -- Vermelho padrão!
    })
    EspColor:OnChanged(function()
        print("Cor do ESP:", EspColor.Value)
    end)

    -- Colorpicker com transparência
    local ChamsColor = Tabs.Visual:AddColorpicker("ChamsColor", {
        Title = "Cor dos Chams",
        Description = "Incluindo opacidade",
        Transparency = 0.3,
        Default = Color3.fromRGB(220, 38, 38),
    })

    local EspDistSlider = Tabs.Visual:AddSlider("EspDist", {
        Title = "Distância ESP",
        Default = 500,
        Min = 50,
        Max = 2000,
        Rounding = 0,
        Callback = function(v) print("Distância:", v) end,
    })

    -- Multi-dropdown para partes visíveis
    local EspParts = Tabs.Visual:AddDropdown("EspParts", {
        Title = "Partes do ESP",
        Description = "Selecione múltiplas partes",
        Values = { "Caixa", "Nome", "Vida", "Distância", "Weapon" },
        Multi = true,
        Default = { "Caixa", "Nome", "Vida" },
    })
end

-- ═══════════════════════════════════════════════════════════════════════════════
--  TAB: CONFIGURAÇÕES (InterfaceManager-style manual)
-- ═══════════════════════════════════════════════════════════════════════════════
do
    -- Seção de Tema
    local ThemeSection = Tabs.Settings:AddSection("Aparência")

    ThemeSection:AddDropdown("Theme", {
        Title = "Tema da Interface",
        Values = Fluent.Themes,
        Default = 1,
    })
    Options.Theme:OnChanged(function(Value)
        Fluent:SetTheme(Value)
    end)
    Options.Theme:SetValue("BlackRed")

    -- Acrylic toggle
    ThemeSection:AddToggle("AcrylicMode", {
        Title = "Acrylic / Blur",
        Description = "Efeito de desfoque na janela (pode ser detectado)",
        Default = false,
    })
    Options.AcrylicMode:OnChanged(function()
        Fluent:ToggleAcrylic(Options.AcrylicMode.Value)
    end)

    -- Keybind para minimizar
    local MinSection = Tabs.Settings:AddSection("Minimizar")
    local MinKey = MinSection:AddKeybind("MinimizeKeybind", {
        Title = "Tecla para Minimizar",
        Mode = "Toggle",
        Default = "RightControl",
        Callback = function() end,
        ChangedCallback = function(New)
            Fluent.MinimizeKeybind = Options.MinimizeKeybind
        end,
    })
end

-- ─── Seleciona tab inicial ───────────────────────────────────────────────────
Window:SelectTab(1)

-- ─── Notificação final ───────────────────────────────────────────────────────
task.delay(1, function()
    Fluent:Notify({
        Title = "Pronto!",
        Content = "Todas as tabs e elementos carregados.\nAproveite o tema BlackRed.",
        Duration = 5,
    })
end)
