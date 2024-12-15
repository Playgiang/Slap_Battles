local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Playgiang/GameScript/refs/heads/main/LinoriaLib/test.lua"))()
local ThemeManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/Playgiang/GameScript/refs/heads/main/LinoriaLib/addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/Playgiang/GameScript/refs/heads/main/LinoriaLib/addons/SaveManager.lua"))()
local Options = Library.Options
local Toggles = Library.Toggles

getgenv().config = {
	AntiGef = false,
	Bat = false,
	crowbar = false,
	stamina = false,
	killgefaura = false,
	ItemSelect = nil,
	ItemUp = true,
}

function Notification(Message, Time)
if _G.ChooseNotify == "LinoriaLib" then
Library:Notify(Message, Time or 5)
elseif _G.ChooseNotify == "Roblox" then
game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Error",Text = Message,Icon = "rbxassetid://7733658504",Duration = Time or 5})
end
if _G.NotificationSound then
        local sound = Instance.new("Sound", workspace)
            sound.SoundId = "rbxassetid://4590662766"
            sound.Volume = _G.VolumeTime or 2
            sound.PlayOnRemove = true
            sound:Destroy()
        end
    end

local Window = Library:CreateWindow({
	Title = "Article Hub | Clound X | GEF",
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
    Weapon = Window:AddTab("Weapon", "rbxassetid://119085118161125"),
    Misc = Window:AddTab("Misc", "rbxassetid://4483345998"),
    ["UI Settings"] = Window:AddTab("UI Settings", "rbxassetid://132720500313615"),
}

local Stats = Tabs.Main:AddLeftTabbox()
local players = Stats:AddTab("OP Featured")
local stats = Stats:AddTab("Stats")

local inventory = Tabs.Main:AddRightTabbox()
local Item = inventory:AddTab("Teleport")

players:AddToggle("Anti GEF", {
    Text = "Anti GEF & Boss",
    Default = false,
    Callback = function(Value)
    getgenv().config.AntiGef = Value
while getgenv().config.AntiGef do
for i, v in ipairs(workspace.GEFs:GetChildren()) do
if v:IsA("Model") and v:FindFirstChild("Hurtbox") then
v.Hurtbox:Destroy()
end
end
task.wait()
end
    end
}):AddKeyPicker("Anti GEF", {
   Default = "X",
   Text = "God Mode",
   Mode = Library.IsMobile and "Toggle" ,
   SyncToggleState = Library.IsMobile
})

stats:AddToggle("Stamina", {
    Text = "Inf Max Stamina + Stamina Regen",
    Default = false,
    Callback = function(Value)
    getgenv().config.stamina = Value
        while getgenv().config.stamina do
        game:GetService("Players").LocalPlayer.Upgrades.MaxStamina.Value = math.huge
        game:GetService("Players").LocalPlayer.Upgrades.StaminaRegen.Value = math.huge
        task.wait()
        end
    end
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

Item:AddButton({
     Text = "Teleport To Item ",
     DoubleClick = false,
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
     end
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
if game.Players.LocalPlayer.Backpack:FindFirstChild("Bat") and game.Players.LocalPlayer.Backpack.Bat:FindFirstChild("Damage") then
game:GetService("Players").LocalPlayer.Backpack.Bat.Damage.Value = math.huge
elseif game.Players.LocalPlayer.Character:FindFirstChild("Bat") and game.Players.LocalPlayer.Character.Bat:FindFirstChild("Damage") then
game:GetService("Players").LocalPlayer.Character.Bat.Damage.Value = math.huge
end
task.wait()
end
    end
}):AddKeyPicker("Bat", {
    Default = "H",
    Text = "Inf Damage Bat",
    Mode = Library.IsMobile and "Toggle",
    SyncToggleState = Library.IsMobile,
})

weapond:AddToggle("Crowbar", {
    Text = "Inf Damage Crowbar",
    Default = false,
    Callback = function(Value)
    getgenv().config.crowbar = Value
while getgenv().config.crowbar do
if game.Players.LocalPlayer.Backpack:FindFirstChild("Crowbar") and game.Players.LocalPlayer.Backpack.Crowbar:FindFirstChild("Damage") then
game:GetService("Players").LocalPlayer.Backpack.Crowbar.Damage.Value = 9e9
elseif game.Players.LocalPlayer.Character:FindFirstChild("Crowbar") and game.Players.LocalPlayer.Character.Crowbar:FindFirstChild("Damage") then
game:GetService("Players").LocalPlayer.Character.Crowbar.Damage.Value = 9e9
end
task.wait()
end
    end
}):AddKeyPicker("Crowbar", {
   Default = "B",
   Text = "Inf Damage Crowbar",
   Mode = Library.IsMobile and "Toggle" ,
   SyncToggleState = Library.IsMobile
})

local misc = Tabs.Misc:AddLeftTabbox()
local funstuff = misc:AddTab("Fun Stuff")
local misc2 = Tabs.Misc:AddRightTabbox()
local LocalPlayer = misc2:AddTab("Character")

local Candycane = funstuff:AddButton({
    Text = "Get Candy Cane",
    DoubleClick = false,
    Func = function()
local player = game:GetService("Players").LocalPlayer
if player then
    local playerGui = player:FindFirstChild("PlayerGui")
    local backpack = player:FindFirstChild("Backpack")
    
    if playerGui and backpack then
        local candyCane = playerGui:FindFirstChild("Candy Cane")
        if candyCane then
            local copy = candyCane:Clone()
            copy.Parent = backpack
        else
            Notification("Candy Cane not found in PlayerGui")
        end
    else
        Notification("Could not find PlayerGui or Backpack.")
    end
else
    Notification("LocalPlayer player not found")
end
    end
})

LocalPlayer:AddSlider("Speed Fly", {
    Text = "Speed Fly",
    Default = 50,
    Min = 50,
    Max = 250,
    Rounding = 0,
    Compact = true,
    Callback = function(Value)
_G.SetSpeedFly = Value
    end
})

_G.SetSpeedFly = 20
LocalPlayer:AddToggle("StFly", {
    Text = "Fly",
    Default = false,
    Callback = function(Value)
_G.StartFly = Value
if _G.StartFly == false then
if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") and game.Players.LocalPlayer.Character.Humanoid.RootPart and game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("VelocityHandler") and game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("GyroHandler") then
game.Players.LocalPlayer.Character.HumanoidRootPart.VelocityHandler:Destroy()
game.Players.LocalPlayer.Character.HumanoidRootPart.GyroHandler:Destroy()
game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
end
end
while _G.StartFly do
if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") and game.Players.LocalPlayer.Character.Humanoid.RootPart and game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("VelocityHandler") and game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("GyroHandler") then
game.Players.LocalPlayer.Character.HumanoidRootPart.VelocityHandler.MaxForce = Vector3.new(9e9,9e9,9e9)
game.Players.LocalPlayer.Character.HumanoidRootPart.GyroHandler.MaxTorque = Vector3.new(9e9,9e9,9e9)
game.Players.LocalPlayer.Character.Humanoid.PlatformStand = true
game.Players.LocalPlayer.Character.HumanoidRootPart.GyroHandler.CFrame = Workspace.CurrentCamera.CoordinateFrame
game.Players.LocalPlayer.Character.HumanoidRootPart.VelocityHandler.Velocity = Vector3.new()
if require(game.Players.LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule")):GetMoveVector().X > 0 then
game.Players.LocalPlayer.Character.HumanoidRootPart.VelocityHandler.Velocity = game.Players.LocalPlayer.Character.HumanoidRootPart.VelocityHandler.Velocity + game.Workspace.CurrentCamera.CFrame.RightVector * (require(game.Players.LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule")):GetMoveVector().X * _G.SetSpeedFly)
end
if require(game.Players.LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule")):GetMoveVector().X < 0 then
game.Players.LocalPlayer.Character.HumanoidRootPart.VelocityHandler.Velocity = game.Players.LocalPlayer.Character.HumanoidRootPart.VelocityHandler.Velocity + game.Workspace.CurrentCamera.CFrame.RightVector * (require(game.Players.LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule")):GetMoveVector().X * _G.SetSpeedFly)
end
if require(game.Players.LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule")):GetMoveVector().Z > 0 then
game.Players.LocalPlayer.Character.HumanoidRootPart.VelocityHandler.Velocity = game.Players.LocalPlayer.Character.HumanoidRootPart.VelocityHandler.Velocity - game.Workspace.CurrentCamera.CFrame.LookVector * (require(game.Players.LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule")):GetMoveVector().Z * _G.SetSpeedFly)
end
if require(game.Players.LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule")):GetMoveVector().Z < 0 then
game.Players.LocalPlayer.Character.HumanoidRootPart.VelocityHandler.Velocity = game.Players.LocalPlayer.Character.HumanoidRootPart.VelocityHandler.Velocity - game.Workspace.CurrentCamera.CFrame.LookVector * (require(game.Players.LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule")):GetMoveVector().Z * _G.SetSpeedFly)
end
elseif game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") and game.Players.LocalPlayer.Character.Humanoid.RootPart and game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("VelocityHandler") == nil and game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("GyroHandler") == nil then
local bv = Instance.new("BodyVelocity")
local bg = Instance.new("BodyGyro")

bv.Name = "VelocityHandler"
bv.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
bv.MaxForce = Vector3.new(0,0,0)
bv.Velocity = Vector3.new(0,0,0)

bg.Name = "GyroHandler"
bg.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
bg.MaxTorque = Vector3.new(0,0,0)
bg.P = 1000
bg.D = 50
end
task.wait()
end
    end
}):AddKeyPicker("Fly", {
   Default = "R",
   Text = "Fly",
   Mode = Library.IsMobile and "Toggle" or "Hold",
   SyncToggleState = Library.IsMobile
})

local MenuGroup = Tabs["UI Settings"]:AddLeftGroupbox("Menu")
local CreditsGroup = Tabs["UI Settings"]:AddRightGroupbox("Credits")

MenuGroup:AddDropdown("NotifySide", {
    Text = "Notification Side",
    Values = {"Left", "Right"},
    Default = "Right",
    Multi = false,
    Callback = function(Value)
Library.NotifySide = Value
    end
})

_G.ChooseNotify = "LinoriaLib"
MenuGroup:AddDropdown("NotifyChoose", {
    Text = "Notification Choose",
    Values = {"LinoriaLib", "Roblox"},
    Default = "",
    Multi = false,
    Callback = function(Value)
_G.ChooseNotify = Value
    end
})

_G.NotificationSound = true
MenuGroup:AddToggle("NotifySound", {
    Text = "Notification Sound",
    Default = true, 
    Callback = function(Value) 
_G.NotificationSound = Value 
    end
})

MenuGroup:AddSlider("Volume Notification", {
    Text = "Volume Notification",
    Default = 2,
    Min = 2,
    Max = 10,
    Rounding = 1,
    Compact = true,
    Callback = function(Value)
_G.VolumeTime = Value
    end
})

MenuGroup:AddToggle("KeybindMenuOpen", {Default = false, Text = "Open Keybind Menu", Callback = function(Value) Library.KeybindFrame.Visible = Value end})
MenuGroup:AddToggle("ShowCustomCursor", {Text = "Custom Cursor", Default = true, Callback = function(Value) Library.ShowCustomCursor = Value end})
MenuGroup:AddDivider()
MenuGroup:AddLabel("Menu bind"):AddKeyPicker("MenuKeybind", {Default = "RightShift", NoUI = true, Text = "Menu keybind"})
MenuGroup:AddButton("Copy Link discord", function()
    if setclipboard then
        setclipboard("https://discord.gg/56BDhEaz32")
        Library:Notify("Copied discord link to clipboard!")
    else
        Library:Notify("Discord link: https://discord.gg/56BDhEaz32", 10)
    end
end):AddButton("Copy Link Zalo", function()
    if setclipboard then
        setclipboard("https://zalo.me/g/qlukiy407")
        Library:Notify("Copied Zalo link to clipboard!")
    else
        Library:Notify("Zalo link: https://zalo.me/g/qlukiy407", 10)
    end
end)
MenuGroup:AddButton("Unload", function() Library:Unload() end)

CreditsGroup:AddLabel("AmongUs / Owner", true)
CreditsGroup:AddLabel("Giang Hub / Script", true)
CreditsGroup:AddDivider()
CreditsGroup:AddLabel("Feedback error script or up to you, 3 time feedback to you, wait until notification feelback success", true)
CreditsGroup:AddInput("Feedback", {
    Default = "",
    Numeric = false,
    Text = "",
    Placeholder = "Feedback",
    Callback = function(Value)
_G.Feedback = Value
    end
})

_G.FeedbackSuccess = 0
CreditsGroup:AddButton("Feedback", function()
if _G.FeedbackSuccess == 3 then return end
_G.FeedbackSuccess = _G.FeedbackSuccess + 1
if http and http.request or request or syn.request then
local request = http and http.request or request or syn.request
Notification("Feelback Success", 2)
function Feelback(jsondate)
local response = request({
        Url = "https://discord.com/api/webhooks/1311945249618395197/h2NGvYgregZcbyttDk5QPXClx_YS70XUKnjzPVAqy31ailB3frIREQ5Sb2nIw1cNKvQS",
        Method = "POST",
        Headers = {["Content-Type"] = "application/json"},
        Body = game:GetService("HttpService"):JSONEncode(jsondate)
    })
end
Feelback({
          ["embeds"] = {{
             ["title"] = "Article Hub 🅰️ - Player Feedback",
             ["description"] = "# Feedback",
             ["color"] = 16711680,
             ["fields"] = {
             	{["name"] = "Feedback", ["value"] = "```".._G.Feedback.."```", ["inline"] = true}
                },
            ["footer"] = {["text"] = os.date("%c")}
          }}
        })
       Feelback({
          ["embeds"] = {{
             ["description"] = "# Check Server",
             ["color"] = 16711680,
             ["fields"] = {
                  {["name"] = "Ping", ["value"] = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(), ["inline"] = true},
                  {["name"] = "FPS", ["value"] = math.floor(workspace:GetRealPhysicsFPS()), ["inline"] = true},
                  {["name"] = "Server Player", ["value"] = tostring(#game.Players:GetPlayers()).." / "..game.Players.MaxPlayers, ["inline"] = true},
                  {["name"] = "Display Name", ["value"] = game.Players.LocalPlayer.DisplayName, ["inline"] = true},
                  {["name"] = "User ID", ["value"] = game.Players.LocalPlayer.UserId, ["inline"] = true},
                  {["name"] = "Account Age", ["value"] = game.Players.LocalPlayer.AccountAge.." Days", ["inline"] = true}
                },
            ["footer"] = {["text"] = os.date("%c")}
          }}
        })
    Feelback({
          ["embeds"] = {{
             ["description"] = "# Check Game",
             ["color"] = 16711680,
             ["fields"] = {
                  {["name"] = "Game Name", ["value"] = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name, ["inline"] = true},
                  {["name"] = "Game Id", ["value"] = game.GameId, ["inline"] = true},
                  {["name"] = "Job Id", ["value"] = game.JobId, ["inline"] = true},
                  {["name"] = "Game Place Id", ["value"] = game.PlaceId, ["inline"] = true}
                },
            ["footer"] = {["text"] = os.date("%c")}
          }}
        })
    Feelback({
          ["embeds"] = {{
             ["description"] = "# Executor",
             ["color"] = 16711680,
             ["fields"] = {
                  {["name"] = "Executor", ["value"] = identifyexecutor() or "Unknown", ["inline"] = true}
                },
            ["footer"] = {["text"] = os.date("%c")}
          }}
        })
else
Notification("http not only executor", 2)
end
end)

Library.ToggleKeybind = Options.MenuKeybind

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:BuildConfigSection(Tabs["UI Settings"])
ThemeManager:ApplyToTab(Tabs["UI Settings"])
SaveManager:LoadAutoloadConfig()
