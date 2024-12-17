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
	Tab4 = Window:AddTab("Local", "rbxassetid://4335489011"),
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

FischFarm:AddSlider("Auto cast Power", {
    Text = "Throwing Power",
    Default = 100,
    Min = 1,
    Max = 100,
    Rounding = 0,
    Compact = true,
    Callback = function(Value)
_G.castpower = Value
    end
})

FischFarm:AddToggle("ThrowRod", {
    Text = "Auto Throw Rod",
    Default = false,
    Callback = function(Value)
_G.AutoThrowRod = Value
while _G.AutoThrowRod do
if game.Players.LocalPlayer.Character:FindFirstChild(game:GetService("ReplicatedStorage").playerstats[game.Players.LocalPlayer.Name].Stats.rod.Value) then
game.Players.LocalPlayer.Character:FindFirstChild(game:GetService("ReplicatedStorage").playerstats[game.Players.LocalPlayer.Name].Stats.rod.Value).events.cast:FireServer(_G.castpower)
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

FischFarm:AddToggle("Chance for perfect or normal1", {
    Text = "Chance for normal or perfect",
    Default = false,
    Callback = function(Value)
_G.normalorperfect1 = Value
while _G.normalorperfect1 do
local chance = math.random(1, 100)
if chance > 85 then
    local idkwhattonamethis = true
    print(idkwhattonamethis)
    if game.Players.LocalPlayer.PlayerGui:FindFirstChild("reel") then
    game:GetService("ReplicatedStorage").events.reelfinished:FireServer(100, true)
    end
elseif chance < 85 then
    local idkwhattonamethis = false
    print(idkwhattonamethis)
    if game.Players.LocalPlayer.PlayerGui:FindFirstChild("reel") then
    game:GetService("ReplicatedStorage").events.reelfinished:FireServer(100, false)
    end
end
if game.Players.LocalPlayer.PlayerGui:FindFirstChild("reel") then
end
task.wait()
end
    end
})

FischFarm:AddToggle("AutoCatchPerfect", {
    Text = "Auto Catch Perfect",
    Default = false,
    Callback = function(Value)
_G.AutoCatchPerfect = Value
while _G.AutoCatchPerfect do
if game.Players.LocalPlayer.PlayerGui:FindFirstChild("reel") then
game:GetService("ReplicatedStorage").events.reelfinished:FireServer(100, true)
end
task.wait()
end
    end
})

FischFarm:AddToggle("AutoReel", {
    Text = "Auto Reel",
    Default = false,
    Callback = function(Value)
_G.AutoReel = Value
while _G.AutoReel do
if game.Players.LocalPlayer.PlayerGui:FindFirstChild("reel") then
game:GetService("ReplicatedStorage").events.reelfinished:FireServer(100, false)
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

MiscBox = Tabs.Tab:AddRightTabbox()
local Misc = MiscBox:AddTab("Misc")

Misc:AddInput("FlySpeed", {
    Default = "50",
    Numeric = true,
    Text = "Fly Speed",
    Placeholder = "UserFlySpeed",
    Callback = function(Value)
_G.SetSpeedFly = Value
    end
})

_G.SetSpeedFly = 50
Misc:AddToggle("Start Fly", {
    Text = "Start Fly",
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

Misc:AddToggle("Noclip1", {
    Text = "Noclip Character",
    Default = false,
    Callback = function(Value)
_G.Noclip = Value
if _G.Noclip == false then
if game.Players.LocalPlayer.Character ~= nil then
for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
				if v:IsA("BasePart") and v.CanCollide == false and v.Name ~= "Humanoid" then
					v.CanCollide = true
				end
			end
end
end
while _G.Noclip do
if game.Players.LocalPlayer.Character ~= nil then
for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
				if v:IsA("BasePart") and v.CanCollide == true and v.Name ~= "Humanoid" then
					v.CanCollide = false
				end
			end
end
task.wait()
end
    end
}):AddKeyPicker("Noclip", {
   Default = "T",
   Text = "Noclip",
   Mode = Library.IsMobile and "Toggle" or "Hold",
   SyncToggleState = Library.IsMobile
})

local Player1 = MiscBox:AddTab("Player")

Player1:AddInput("Players", {
    Default = "",
    Numeric = false,
    Text = "",
    Finished = true,
    Placeholder = "Username",
    Callback = function(Value)
_G.PlayerTarget = Value
for _, v in pairs(game.Players:GetPlayers()) do
if string.sub(v.Name, 1, #_G.PlayerTarget):lower() == _G.PlayerTarget:lower() then
PlayerTa = v
end
end
if PlayerTa then
_G.PlayerPut = PlayerTa.Name
Notification("Found Player [ "..PlayerTa.Name.." ]", 5)
else
Notification("Can't find player", 5)
end
    end
})

Player1:AddButton("Teleport Player", function()
if game.Players[_G.PlayerPut].Character and game.Players[_G.PlayerPut].Character:FindFirstChild("HumanoidRootPart") then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[_G.PlayerPut].Character.HumanoidRootPart.CFrame
end
end)

Player1:AddToggle("Auto Teleport Player", {
    Text = "Auto Teleport Player",
    Default = false, 
    Callback = function(Value) 
_G.PlayerTele = Value
while _G.PlayerTele do
if game.Players[_G.PlayerPut].Character and game.Players[_G.PlayerPut].Character:FindFirstChild("HumanoidRootPart") then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[_G.PlayerPut].Character.HumanoidRootPart.CFrame
end
task.wait()
end
    end
})

Player1:AddToggle("Auto View Player", {
    Text = "Auto View Player",
    Default = false, 
    Callback = function(Value) 
_G.PlayerView = Value
if _G.PlayerView == false then
if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
end
end
while _G.PlayerView do
if game.Players[_G.PlayerPut].Character:FindFirstChild("Humanoid") then
game.Workspace.CurrentCamera.CameraSubject = game.Players[_G.PlayerPut].Character:FindFirstChild("Humanoid")
end
task.wait()
end
    end
})

local Anti = Tabs.Tab1:AddLeftGroupbox("Anti")

Anti:AddToggle("AntiWater", {
    Text = "Anti Water",
    Default = false,
    Callback = function(Value)
_G.AntiWater = Value
while _G.AntiWater do
for i, v in pairs(workspace.zones.fishing:GetChildren()) do
            if v.ClassName == "Part" then
                v.CanCollide = Value
            end
        end
task.wait()
end
    end
})

Anti:AddToggle("AntiOxygen", {
    Text = "Anti Oxygen",
    Default = false,
    Callback = function(Value)
_G.AntiOxygen = Value
while _G.AntiOxygen do
if game.Players.LocalPlayer.Character:FindFirstChild("client") and game.Players.LocalPlayer.Character.client:FindFirstChild("oxygen") then
if game.Players.LocalPlayer.Character.client.oxygen.Disabled ~= Value then
game.Players.LocalPlayer.Character.client.oxygen.Disabled = Value
end
end
task.wait()
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
                end
                end
end):AddButton("Return NPC", function()
NPC = {}
    for i, v in pairs(game:GetService("Workspace").world.npcs:GetChildren()) do
        table.insert(NPC, v.Name)
    end
NPC1:SetValue(NPC)
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

local Shop1 = Tabs.Tab3:AddRightGroupbox("Buy")

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

local Local1Group = Tabs.Tab4:AddLeftGroupbox("Speed")

Local1Group:AddSlider("WalkSpeed", {
    Text = "Speed",
    Default = 20,
    Min = 20,
    Max = 1000,
    Rounding = 0,
    Compact = true,
    Callback = function(Value)
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
Walkspeed = Value
    end
})

Local1Group:AddInput("WalkSpeed1", {
    Default = "20",
    Numeric = false,
    Text = "Speed",
    Placeholder = "UserSpeed",
    Callback = function(Value)
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
Walkspeed = Value
    end
})

Local1Group:AddToggle("SetSpeed", {
    Text = "Auto Set Speed",
    Default = false, 
    Callback = function(Value) 
KeepWalkspeed = Value
            while KeepWalkspeed do
                if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") ~= nil and game.Players.LocalPlayer.Character.Humanoid.WalkSpeed ~= Walkspeed then
                    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Walkspeed
                end
task.wait()
            end
    end
})

local Local2Group = Tabs.Tab4:AddRightGroupbox("Jump")

Local2Group:AddSlider("JumpPower", {
    Text = "Jump",
    Default = 50,
    Min = 50,
    Max = 1000,
    Rounding = 0,
    Compact = true,
    Callback = function(Value)
game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
Jumppower = Value
    end
})

Local2Group:AddInput("JumpPower1", {
    Default = "50",
    Numeric = true,
    Text = "Jump",
    Placeholder = "UserJump",
    Callback = function(Value)
game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
Jumppower = Value
    end
})

Local2Group:AddToggle("SetJump", {
    Text = "Auto Set Jump",
    Default = false, 
    Callback = function(Value) 
KeepJumppower = Value
            while KeepJumppower do
                if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") ~= nil and game.Players.LocalPlayer.Character.Humanoid.JumpPower ~= Jumppower then
                    game.Players.LocalPlayer.Character.Humanoid.JumpPower = Jumppower
                end
task.wait()
            end
    end
})

local Local3Group = Tabs.Tab4:AddLeftGroupbox("Remaining")

Local3Group:AddSlider("HipHeight", {
    Text = "Hip Height",
    Default = 0,
    Min = 0,
    Max = 100,
    Rounding = 0,
    Compact = true,
    Callback = function(Value)
game.Players.LocalPlayer.Character.Humanoid.HipHeight = Value
HipHeight = Value
    end
})

Local3Group:AddToggle("SetHipHeight", {
    Text = "Auto Set Hip Height",
    Default = false, 
    Callback = function(Value) 
KeepHipHeight = Value
           while KeepHipHeight do
              if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") ~= nil and game.Players.LocalPlayer.Character.Humanoid.HipHeight ~= HipHeight then
                  game.Players.LocalPlayer.Character.Humanoid.HipHeight  = HipHeight
              end
task.wait()
         end
    end
})

Local3Group:AddSlider("Gravity", {
    Text = "Gravity",
    Default = 0,
    Min = 0,
    Max = 100,
    Rounding = 0,
    Compact = true,
    Callback = function(Value)
game.Workspace.Gravity = Value
    end
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

CreditsGroup:AddLabel("AmongUs - Python / Dex / Script / Python", true)
CreditsGroup:AddLabel("Giang Hub - Script / Dex", true)
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
