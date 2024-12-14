local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Playgiang/GameScript/refs/heads/main/LinoriaLib/test.lua"))()
local ThemeManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/Playgiang/GameScript/refs/heads/main/LinoriaLib/addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/Playgiang/GameScript/refs/heads/main/LinoriaLib/addons/SaveManager.lua"))()


getgenv().config = {
	AntiGef = false,
	Bat = false,
	crowbar = false,
	stamina = false,
	killgefaura = false,
	ItemSelect = nil,
	ItemUp = true,
}


local Window = Library:CreateWindow({
    Title = "Article Hub | GEF | beta ",
    Center = true,
    AutoShow = true,
    Resizable = true,
    ShowCustomCursor = true,
    NotifySide = "Right",
    TabPadding = 2,
    MenuFadeTime = 0
})


local Tabs = {
    Main = Window:AddTab("Main", "rbxassetid://93827038692127"),
    Weapon = Window:AddTab("Weapon"),
    Misc = Window:AddTab("Misc", "rbxassetid://4483345998"),
    ["UI Settings"] = Window:AddTab("UI Settings", "rbxassetid://132720500313615"),
}

local Stats = Tabs.Main:AddLeftTabbox()
local players = Stats:AddTab("OP Featured")
local stats = Stats:AddTab("Stats")

local inventory = Tabs.Main:AddRightTabbox()
local Item = inventory:AddTab("Teleport")

players:AddToggle("Anti GEF", {
    Text = "Anti GEF And Boss GEF",
    Default = false,
    Callback = function(Value)
    getgenv().config.AntiGef = Value
    while getgenv().config.AntiGef do
        for i, v in ipairs(workspace.GEFs:GetChildren()) do
            if v:IsA("Model") and v:FindFirstChild("Hurtbox") then
                v.Hurtbox:Destroy()
            end
        end
        task.wait(0)
    end
    end,
}):AddKeyPicker("Anti GEF", {
   Default = "X",
   Text = "God Mode",
   Mode = Library.IsMobile and "Toggle" ,
   SyncToggleState = Library.IsMobile
})

stats:AddToggle("Stamina", {
    Text = "Inf Max Stamina + Stamina Regen",
    Default = true,
    Callback = function(Value)
    getgenv().config.stamina = Value
        while getgenv().config.stamina do
        game:GetService("Players").LocalPlayer.Upgrades.MaxStamina.Value = math.huge
        game:GetService("Players").LocalPlayer.Upgrades.StaminaRegen.Value = math.huge
        task.wait()
        end
    end,
})

Item:AddDropdown("Item", {
    Values = {"Bat", "Shotgun", "Handgun", "Crowbar", "Food", "Medkit", "Shells", "Hammer", "Soda", "Money", "GPS"},
    Default = 0,
    Multi = false,
    Text = "Get Item",
    Callback = function(Value)
        getgenv().config.ItemSelect = Value
    end
})

local Teleport = Item:AddButton({
    Text = "Teleport To Item",
    Func = function()
        if getgenv().config.ItemSelect then
            local matchingParts = {}
            for _, part in ipairs(workspace.Pickups:GetChildren()) do
                if part:IsA("MeshPart") and part.Name == getgenv().config.ItemSelect then
                    table.insert(matchingParts, part)
                end
            end
            if #matchingParts > 0 then
                local selectedPart = matchingParts[math.random(1, #matchingParts)]
                local oldPos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = selectedPart.CFrame
                task.wait(0.2)
                local proximityPrompt = selectedPart:FindFirstChildOfClass("ProximityPrompt")
                if proximityPrompt then
                    fireproximityprompt(selectedPart.ProximityPrompt)
                end
                task.wait(0.5)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldPos
            end
        end
    end,
    DoubleClick = false
})

local weapon = Tabs.Weapon:AddLeftTabbox()
local weapond = weapon:AddTab("Melee Featured")
local gun = weapon:AddTab("Gun Featured")

weapond:AddToggle("Bat", {
    Text = "Inf Damage Bat",
    Default = false,
    Callback = function(Value)
        getgenv().config.Bat = Value
        while getgenv().config.Bat do
            pcall(function()
                game:GetService("Players").LocalPlayer.Backpack.Bat.Damage.Value = math.huge
            end)
            task.wait()
        end
    end,
}):AddKeyPicker("Bat", {
    Default = "H",
    Text = "Bat Inf Damage",
    Mode = Library.IsMobile and "Toggle",
    SyncToggleState = Library.IsMobile,
})

weapond:AddToggle("Crowbar", {
    Text = "Inf Damage Crowbar",
    Default = false,
    Callback = function(Value)
    getgenv().config.crowbar = Value
    local player = game.Players.LocalPlayer
        if player.Backpack:FindFirstChild("Crowbar") and player.Backpack.Crowbar:FindFirstChild("Damage") then
    while getgenv().config.crowbar do
            player.Backpack.Crowbar.Damage.Value = 99999999999999999
        task.wait()
    end
    end
    end,
}):AddKeyPicker("Crowbar", {
   Default = "B",
   Text = "Crowbar Damage Inf",
   Mode = Library.IsMobile and "Toggle" ,
   SyncToggleState = Library.IsMobile
})

local misc = Tabs.Misc:AddLeftTabbox()
local funstuff = misc:AddTab("Fun Stuff")
local misc2 = Tabs.Misc:AddRightTabbox()
local LocalPlayer = misc2:AddTab("Character")

local Candycane = funstuff:AddButton({
    Text = "Get Candy Cane",
    Func = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/tanhoangviet/gui.Library/main/CandyCane%5BGEF%5D.lua",true))()
    end,
    DoubleClick = false
})

_G.speed = 30

LocalPlayer:AddSlider("Speed", {
    Text = "Set Speed",
    Default = 10,
    Min = 0,
    Max = 100,
    Rounding = 1,
    Compact = false,

    Callback = function(Value)
        _G.speed = Value
    end,
    
    Visible = true
})

LocalPlayer:AddToggle("Speed", {
    Text = "Walkspeed Set Auto",
    Default = false, 
    Callback = function(Value)
    speed = Value
        while speed do
                if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") ~= nil and game.Players.LocalPlayer.Character.Humanoid.WalkSpeed ~= Walkspeed then
                    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = _G.speed
                end
task.wait()
            end
    end
})

LocalPlayer:AddSlider("Jump", {
    Text = "Set Jump Power",
    Default = 10,
    Min = 0,
    Max = 100,
    Rounding = 1,
    Compact = false,

    Callback = function(Value)
        _G.jump = Value
    end,
    
    Visible = true
})

LocalPlayer:AddToggle("Speed", {
    Text = "Jump Power Auto",
    Default = false, 
    Callback = function(Value)
    KeepJumppower = Value
        while KeepJumppower do
                if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") ~= nil and game.Players.LocalPlayer.Character.Humanoid.JumpPower ~= Jumppower then
                    game.Players.LocalPlayer.Character.Humanoid.JumpPower = _G.jump
                end
task.wait()
            end
    end
})



local MenuGroup = Tabs["UI Settings"]:AddLeftGroupbox("Menu")
MenuGroup:AddToggle("KeybindMenuOpen", {Default = false, Text = "Open Keybind Menu", Callback = function(Value) Library.KeybindFrame.Visible = Value end})
MenuGroup:AddToggle("ShowCustomCursor", {Text = "Custom Cursor", Default = true, Callback = function(Value) Library.ShowCustomCursor = Value end})
MenuGroup:AddDivider()
MenuGroup:AddLabel("Menu bind"):AddKeyPicker("MenuKeybind", {Default = "RightShift", NoUI = true, Text = "Menu keybind"})

Library.KeybindFrame.Visible = false; 
Library:OnUnload(function()
    Library:Disconnect()
    Library.Unloaded = true
end)

MenuGroup:AddButton("Unload", function() Library:Unload() end)
MenuGroup:AddLabel("Menu bind"):AddKeyPicker("MenuKeybind", {Default = "End", NoUI = true, Text = "Menu keybind"})
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({"MenuKeybind"})
ThemeManager:SetFolder("Article")
SaveManager:SetFolder("Article/GEF")
SaveManager:BuildConfigSection(Tabs["UI Settings"])
ThemeManager:ApplyToTab(Tabs["UI Settings"])
SaveManager:LoadAutoloadConfig()
