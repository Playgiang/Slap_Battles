

local repo = 'https://raw.githubusercontent.com/mstudio45/LinoriaLib/main/'
local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()

--// Create Window \\--
local Window = Library:CreateWindow({
    Title = 'AmongUs x GiangMc Hub | Weird Strict Dad | ' .. identifyexecutor(),
    Center = true,
    AutoShow = true,
    TabPadding = 8,
    MenuFadeTime = 0
})

--// Create Tab \\-
local Tabs = {
    Main = Window:AddTab('Main'),
    Teleport = Window:AddTab('Teleport'),
    Visual = Window:AddTab('Visual'),
    ['UI Settings'] = Window:AddTab('UI Settings'),
}

--//Main Tab\\--
local main = Tabs.Main:AddLeftTabbox()
local Main = main:AddTab('Main')
local time = main:AddTab('Settings')

local isDeleting = false

Main:AddToggle('Chaser', {
    Text = 'Delete Mom',
    Default = true,
    Tooltip = 'Remove Mom',
    Callback = function(Value)
        isDeleting = Value
        if isDeleting then
            while isDeleting do
                local momChase = game.Workspace.Chasers:FindFirstChild("MomChase")
                if momChase then
                    momChase:Destroy()
                end
                wait(0)
            end
        end
    end
})

--// Players Tab \\--
local Players = Tabs.Main:AddRightTabbox()
local PlayersTab = Players:AddTab('Players')

local isNoFogEnabled = false
local isFullBrightEnabled = false

local function setPlayerValues()
    while _G.infStats do
        local stats = game.Players.LocalPlayer

        if stats then
            stats.Energy.Value = 100
            stats.Hunger.Value = 100
            stats.Oxygen.Value = 100
            stats.Thirst.Value = 100
        end
        wait(0)
    end
end

PlayersTab:AddToggle('infStats', {
    Text = 'Inf Stats',
    Default = false,
    Callback = function(Value)
        _G.infStats = Value
        if Value then
            setPlayerValues()
        end
    end
})

PlayersTab:AddToggle('NoFog', {
    Text = 'No Fog',
    Default = false,
    Callback = function(Value)
        isNoFogEnabled = Value
        if isNoFogEnabled then
            game.Lighting.FogEnd = 1000000000
        else
            game.Lighting.FogEnd = 1000
        end
    end
})

PlayersTab:AddToggle('FullBright', {
    Text = 'Full Bright',
    Default = false,
    Callback = function(Value)
        isFullBrightEnabled = Value
        if isFullBrightEnabled then
            game.Lighting.Brightness = 100
            game.Lighting.GlobalShadows = false
        else
            game.Lighting.Brightness = 1
            game.Lighting.GlobalShadows = true
        end
    end
})
--// LocalPlayers \\--

local localplayers = Tabs.Main:AddRightTabbox()
local LocalPlayersTab = localplayers:AddTab('Players')

LocalPlayersTab:AddSlider('JumpPowerSlider', {
    Text = 'Jump Power',
    Default = 0,
    Min = 0,
    Max = 200,
    Rounding = 1,
    Compact = false,
    Callback = function(Value)
        _G.JumpPowerValue = Value
    end
})

LocalPlayersTab:AddSlider('GravitySlider', {
    Text = 'Gravity',
    Default = 0,
    Min = 0,
    Max = 300,
    Rounding = 1,
    Compact = false,
    Callback = function(Value)
        _G.GravityValue = Value
    end
})

LocalPlayersTab:AddSlider('WalkSpeedSlider', {
    Text = 'Walk Speed',
    Default = 0,
    Min = 0,
    Max = 100,
    Rounding = 1,
    Compact = false,
    Callback = function(Value)
        _G.WalkSpeedValue = Value
    end
})

LocalPlayersTab:AddButton({
    Text = 'Run Values',
    Func = function()
        local player = game.Players.LocalPlayer
        player.Character.Humanoid.JumpPower = _G.JumpPowerValue
        player.Character.Humanoid.WalkSpeed = _G.WalkSpeedValue
        game.Workspace.Gravity = _G.GravityValue
    end,
    Tooltip = 'Apply current slider values'
})

--// Visuals Tab \\--
local Esp = Tabs.Visual:AddRightTabbox()
local esp = Esp:AddTab('Esp')
local color = Esp:AddTab('settings')

local espEnabled = false
local espColor = Color3.new(0, 1, 0)

local function createESP(part)
    local espBox = Instance.new("BoxHandleAdornment")
    espBox.Size = part.Size + Vector3.new(0.2, 0.2, 0.2)
    espBox.Adornee = part
    espBox.Color3 = espColor
    espBox.AlwaysOnTop = true
    espBox.ZIndex = 5
    espBox.Transparency = 0.5
    espBox.Parent = part
end

esp:AddToggle('ESP', {
    Text = 'ESP Mom',
    Default = false,
    Callback = function(Value)
        espEnabled = Value
        if Value then
            local momChase = game.Workspace.Chasers:FindFirstChild("MomChase")
            if momChase then
                createESP(momChase)
                momChase:GetPropertyChangedSignal("Parent"):Connect(function()
                    if momChase.Parent ~= game.Workspace then
                        espEnabled = false
                    end
                end)
            end
        else
            local espBox = game.Workspace.Chasers:FindFirstChild("MomChase") and game.Workspace.Chasers.MomChase:FindFirstChildOfClass("BoxHandleAdornment")
            if espBox then
                espBox:Destroy()
            end
        end
    end
})

color:AddLabel('Color'):AddColorPicker('ColorPicker', {
    Default = espColor,
    Title = 'ESP Color',
    Transparency = 0,
    Callback = function(Value)
        espColor = Value
        if espEnabled then
            local momChase = game.Workspace.Chasers:FindFirstChild("MomChase")
            if momChase then
                local espBox = momChase:FindFirstChildOfClass("BoxHandleAdornment")
                if espBox then
                    espBox.Color3 = espColor
                end
            end
        end
    end
})

--// Teleport Tab\\--
local Place = Tabs.Teleport:AddLeftTabbox()
local places =  Place:AddTab('Places')

places:AddDropdown('Place', {
    Values = { 'Lake', 'Farm', 'SnailHouse', 'WareHouse', 'GreekHouse', 'Monument', 'ShelterHouse', 'Gates or Bloxilar' },
    Default = 1,
    Multi = false,
    Text = 'Chossen Place',
    Tooltip = 'Chossen A Places To Teleport',
    Callback = function(Value)
        _G.place = Value
    end
})

local Button = places:AddButton({
    Text = 'Teleport',
    Func = function()
        local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
        if _G.place == "Lake" then
            hrp.CFrame = CFrame.new(143, 57, 448)
        elseif _G.place == "Farm" then
            hrp.CFrame = CFrame.new(107, 56, 941)
        elseif _G.place == "SnailHouse" then
            hrp.CFrame = CFrame.new(616, 56, 884)
        elseif _G.place == "WareHouse" then
            hrp.CFrame = CFrame.new(1010, 56, 848)
        elseif _G.place == "GreekHouse" then
            hrp.CFrame = CFrame.new(1158, 63, 402)
        elseif _G.place == "Monument" then
            hrp.CFrame = CFrame.new(1123, 56, 215)
        elseif _G.place == "ShelterHouse" then
            hrp.CFrame = CFrame.new(65, 56, -78)
        elseif _G.place == "Gates" then
            hrp.CFrame = CFrame.new(808, 56, -113)
        else
            print("Invalid place or _G.place not set")
        end
    end,
    DoubleClick = false,
    Tooltip = 'Click to teleport to the selected place'
})



--// Dont Touch This \\--
local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')
MenuGroup:AddButton('Unload', function() Library:Unload() end)
Library.KeybindFrame.Visible = false;
Library:OnUnload(function()
    WatermarkConnection:Disconnect()
    print('Unloaded!')
    Library.Unloaded = true
end)
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({ 'MenuKeybind' })
ThemeManager:SetFolder('AmongUsXGiangMcHub')
SaveManager:SetFolder('AmongUsXGiangMcHub/Doors')
SaveManager:BuildConfigSection(Tabs['UI Settings'])
ThemeManager:ApplyToTab(Tabs['UI Settings'])
SaveManager:LoadAutoloadConfig()

--[[
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(143, 57, 448) -- Lake
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(107, 56, 941) -- Farm
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(616, 56, 884) -- SnailHouse
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1010, 56, 848) -- WareHouse
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1158, 63, 402) -- GreekHouse
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1123, 56, 215) -- monument
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(65, 56, -78) -- ShelterHouse
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(808, 56, -113) -- Gates or Bloxilar
]]

