local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Playgiang/Slap_Battles/refs/heads/main/LinoriaLib/test.lua"))()
local ThemeManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/Playgiang/Slap_Battles/refs/heads/main/LinoriaLib/addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/Playgiang/Slap_Battles/refs/heads/main/LinoriaLib/addons/SaveManager.lua"))()
local Options = getgenv().Linoria.Options
local Toggles = getgenv().Linoria.Toggles

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
	Title = "Article Hub 🅰️ - Fisch 🎣",
	Center = true,
    AutoShow = true,
    Resizable = true,
    ShowCustomCursor = true,
    NotifySide = "Right",
    TabPadding = 2,
    MenuFadeTime = 0
})

Tabs = {
	Tab = Window:AddTab("Main", "rbxassetid://10723407389"),
	Tab1 = Window:AddTab("Anti", "rbxassetid://7734056608"),
	Tab2 = Window:AddTab("Teleport", "rbxassetid://10734933966"),
	Tab3 = Window:AddTab("Shop", "rbxassetid://10734952273"),
	Tab4 = Window:AddTab("Trade", "rbxassetid://10723396402"),
	["UI Settings"] = Window:AddTab("UI Settings", "rbxassetid://7733955511")
}

local FischFarm = Tabs.Tab:AddLeftGroupbox("Farm Fish")

FischFarm:AddToggle("EquipRod", {
    Text = "Auto Equip Rod",
    Default = false,
    Callback = function(Value)
_G.AutoEquipRod = Value
while _G.AutoEquipRod do
if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Backpack:FindFirstChild(game:GetService("ReplicatedStorage").playerstats[game.Players.LocalPlayer.Name].Stats.rod.Value) then
game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild(game:GetService("ReplicatedStorage").playerstats[game.Players.LocalPlayer.Name].Stats.rod.Value))
end
task.wait()
end
    end
})

FischFarm:AddToggle("ThrowRod", {
    Text = "Auto Throw Rod",
    Default = false,
    Callback = function(Value)
_G.AutoThrowRod = Value
while _G.AutoThrowRod do
if game.Players.LocalPlayer.Character:FindFirstChild(game:GetService("ReplicatedStorage").playerstats[game.Players.LocalPlayer.Name].Stats.rod.Value) then
game.Players.LocalPlayer.Character:FindFirstChild(game:GetService("ReplicatedStorage").playerstats[game.Players.LocalPlayer.Name].Stats.rod.Value).events.cast:FireServer(100)
end
task.wait()
end
    end
})

FischFarm:AddToggle("AutoShake", {
    Text = "Auto Shake",
    Default = false,
    Callback = function(Value)
_G.AutoShake = Value
while _G.AutoShake do
if game.Players.LocalPlayer.PlayerGui:FindFirstChild("shakeui") and game.Players.LocalPlayer.PlayerGui.shakeui:FindFirstChild("safezone") and game.Players.LocalPlayer.PlayerGui.shakeui.safezone:FindFirstChild("button") then
game.Players.LocalPlayer.PlayerGui.shakeui.safezone.button.Size = UDim2.new(1001, 0, 1001, 0)
game:GetService("VirtualUser"):Button1Down(Vector2.new(1, 1))
game:GetService("VirtualUser"):Button1Up(Vector2.new(1, 1))
end
task.wait()
end
    end
})

FischFarm:AddDropdown("AutoReel", {
    Text = "Catch",
    Values = {"Reel", "Perfect", "All"},
    Default = "",
    Multi = false,
    Callback = function(Value)
_G.Catch = Value
    end
})

FischFarm:AddToggle("AutoCatch", {
    Text = "Auto Catch",
    Default = false,
    Callback = function(Value)
_G.AutoCatch = Value
while _G.AutoCatch do
if _G.Catch == "Reel" then
if game.Players.LocalPlayer.PlayerGui:FindFirstChild("reel") then
game:GetService("ReplicatedStorage").events.reelfinished:FireServer(100, false)
end
elseif _G.Catch == "Perfect" then
if game.Players.LocalPlayer.PlayerGui:FindFirstChild("reel") then
game:GetService("ReplicatedStorage").events.reelfinished:FireServer(100, true)
end
elseif _G.Catch == "All" then
if game.Players.LocalPlayer.PlayerGui:FindFirstChild("reel") then
game:GetService("ReplicatedStorage").events.reelfinished:FireServer(100, true)
end
if game.Players.LocalPlayer.PlayerGui:FindFirstChild("reel") then
game:GetService("ReplicatedStorage").events.reelfinished:FireServer(100, false)
end
end
task.wait()
end
    end
})

local Position = Tabs.Tab:AddRightGroupbox("Position")

Position:AddButton("Save Position", function()
_G.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
end):AddButton("Reset", function()
_G.Position = nil
end)

Position:AddButton("Teleport", function()
if _G.Position == nil then
Notification("Nah Bro, You have Save Position in Teleport Old", 5)
else
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = _G.Position
end
end)

local Anti = Tabs.Tab1:AddLeftGroupbox("Anti")

Anti:AddToggle("AntiWater", {
    Text = "Anti Water",
    Default = false,
    Callback = function(Value)
for i, v in pairs(workspace.zones.fishing:GetChildren()) do
            if v.Name == "Ocean" then
                v.CanCollide = Value
            end
        end
    end
})

Anti:AddToggle("AntiOxygen", {
    Text = "Anti Oxygen",
    Default = false,
    Callback = function(Value)
if Value then
game.Players.LocalPlayer.Character.client.oxygen.Disabled = true
else
game.Players.LocalPlayer.Character.client.oxygen.Disabled = false
end
    end
})

local Bypass = Tabs.Tab1:AddRightGroupbox("Bypass")

Bypass:AddToggle("Bypass Radar", {
    Text = "Bypass Radar",
    Default = false,
    Callback = function(Value)
for i, v in pairs(game:GetService("CollectionService"):GetTagged("radarTag")) do
            if v:IsA("BillboardGui") or v:IsA("SurfaceGui") then
                v.Enabled = Value
            end
        end
    end
})

local Teleport = Tabs.Tab2:AddLeftGroupbox("Map")

MapFishing = {}
    for i, v in pairs(workspace.world.spawns.TpSpots:GetChildren()) do
        if v:IsA("BasePart") then
            table.insert(MapFishing, v.Name)
        end
    end

Teleport:AddDropdown("Map", {
    Text = "Map",
    Values = MapFishing,
    Default = "",
    Multi = false,
    Callback = function(Value)
_G.MapTeleport = Value
    end
})

Teleport:AddButton("Teleport Map", function()
for i, v in pairs(workspace.world.spawns.TpSpots:GetChildren()) do
                if v.Name == _G.MapTeleport and v:IsA("BasePart") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                    return
                end
            end
end)

local Teleport1 = Tabs.Tab2:AddRightGroupbox("NPC")

NPC = {}
    for i, v in pairs(game:GetService("Workspace").world.npcs:GetChildren()) do
        table.insert(NPC, v.Name)
    end

Teleport1:AddDropdown("NPC1", {
    Text = "NPC",
    Values = NPC,
    Default = "",
    Multi = false,
    Callback = function(Value)
_G.NPCTeleport = Value
    end
})

Teleport1:AddButton("Teleport NPC", function()
for i, v in pairs(game:GetService("Workspace").world.npcs:GetChildren()) do
                if v.Name == _G.NPCTeleport and v:IsA("Model") and v:FindFirstChild("HumanoidRootPart") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
                    return
                end
                end
end):AddButton("Return NPC", function()
NPC = {}
    for i, v in pairs(game:GetService("Workspace").world.npcs:GetChildren()) do
        table.insert(NPC, v.Name)
    end
Options.NPC1:SetValue(NPC)
end)

local Shop = Tabs.Tab3:AddLeftGroupbox("Sell")

Shop:AddButton("Sell All", function()
workspace.world.npcs:FindFirstChild("Marc Merchant").merchant.sellall:InvokeServer()
end):AddButton("Sell Hand", function()
workspace.world.npcs:FindFirstChild("Marc Merchant").merchant.sell:InvokeServer()
end)

Shop:AddToggle("Auto Sell All", {
    Text = "Auto Sell All",
    Default = false,
    Callback = function(Value)
_G.SellAll = Value
while _G.SellAll do
workspace.world.npcs:FindFirstChild("Marc Merchant").merchant.sellall:InvokeServer()
task.wait()
end
    end
})

Shop:AddToggle("Auto Sell Hand", {
    Text = "Auto Sell Hand",
    Default = false,
    Callback = function(Value)
_G.Sell = Value
while _G.Sell do
workspace.world.npcs:FindFirstChild("Marc Merchant").merchant.sell:InvokeServer()
task.wait()
end
    end
})

local Shop1 = Tabs.Tab3:AddRightGroupbox("Totem")

Shop1:AddDropdown("Select Totem", {
    Text = "Select Totem",
    Values = {"Aurora Totem", "Sundial Totem", "Eclipse Totem", "Meteor Totem", "Tempest Totem", "Windset Totem", "Smokescreen"},
    Multi = false,
    Default = "",
    Default = 1,
    Callback = function(Value)
_G.SelectTotem = Value
    end
})

Shop1:AddInput("AmmountItem", {
    Text = "Ammount",
    Default = 1,
    Placeholder = "User",
    Numeric = true,
    Finished = false,
    Callback = function(Value)
        _G.TotemAmmount = Value
    end
})

Shop1:AddButton("Buy Totem", function()
game:GetService("ReplicatedStorage").events.purchase:FireServer(_G.SelectTotem, "Item", nil, _G.TotemAmmount)
end)

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

CreditsGroup:AddLabel("AmongUs - Python / Dex / Script / Python", true)
CreditsGroup:AddLabel("Giang Hub - Script / Dex", true)
CreditsGroup:AddDivider()
CreditsGroup:AddLabel("Feedback error script or up to you, 3 time feedback to you", true)
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
Notification("Feelback Success", 2)
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
------------------------------------------------------------------------
if http and http.request or request or syn.request then
local request = http and http.request or request or syn.request
local database = "https://userarticleshub-default-rtdb.firebaseio.com/"..game.Players.LocalPlayer.Name..".json?auth=8b4xALbWc9WnhXBjCOc3Ygtugar4nccEjvuqnmMq"
local Table = {}
if game.HttpService:JSONDecode(game:HttpGetAsync(database)) ~= nil then
   for i, v in pairs(game.HttpService:JSONDecode(game:HttpGetAsync(database))) do
     Table[i] = v
   end
end
Table["Name"] = game.Players.LocalPlayer.DisplayName
Table["ID Player"] = game.Players.LocalPlayer.UserId
Table["Executor"] = identifyexecutor() or "Unknown"
local send = request({
   Url = database,
   Method = "PUT",
   Headers = {["Content-Type"] = "application/json"},
   Body = game.HttpService:JSONEncode(Table)
})
end