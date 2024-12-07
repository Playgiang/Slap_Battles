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

function TweenTp(Part, Speed, CFnew)
if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") and game.Players.LocalPlayer.Character.Humanoid.RootPart and game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("VelocityHandler") == nil and game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("GyroHandler") == nil then
local bv = Instance.new("BodyVelocity")
local bg = Instance.new("BodyGyro")
bv.Name = "VelocityHandler"
bv.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
bv.MaxForce = Vector3.new(9e9,9e9,9e9)
bv.Velocity = Vector3.new(0,0,0)
bg.Name = "GyroHandler"
bg.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
bg.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
bg.MaxTorque = Vector3.new(9e9,9e9,9e9)
bg.P = 1000
bg.D = 50
end
local Tween = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Part.Position).Magnitude / Speed, Enum.EasingStyle.Linear), {CFrame = Part.CFrame * CFrame.new(0,CFnew,0)})
Tween:Play()
Tween.Completed:Wait()
if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") and game.Players.LocalPlayer.Character.Humanoid.RootPart and game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("VelocityHandler") and game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("GyroHandler") then
game.Players.LocalPlayer.Character.HumanoidRootPart.VelocityHandler:Destroy()
game.Players.LocalPlayer.Character.HumanoidRootPart.GyroHandler:Destroy()
game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
end
end

local Window = Library:CreateWindow({
	Title = "Article Hub 🅰️ - Islands 🌱",
	Center = true,
    AutoShow = true,
    Resizable = true,
    ShowCustomCursor = true,
    NotifySide = "Right",
    TabPadding = 2,
    MenuFadeTime = 0
})
    
Tabs = {
	Tab = Window:AddTab("Main", "rbxassetid://7734053426"),
	["UI Settings"] = Window:AddTab("UI Settings", "rbxassetid://7733955511")
}

local Main1Group = Tabs.Tab:AddLeftGroupbox("AutoFarm")

_G.SpeedTween = 30
Main1Group:AddSlider("Speed Tween", {
    Text = "Speed Tween",
    Default = 30,
    Min = 10,
    Max = 45,
    Rounding = 0,
    Compact = true,
    Callback = function(Value)
_G.SpeedTween = Value
    end
})

Main1Group:AddToggle("Noclip1", {
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

Main1Group:AddSlider("Speed Fly", {
    Text = "Speed Fly",
    Default = 30,
    Min = 10,
    Max = 35,
    Rounding = 0,
    Compact = true,
    Callback = function(Value)
_G.SetSpeedFly = Value
    end
})

_G.SetSpeedFly = 30
Main1Group:AddToggle("StFly", {
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

Main1Group:AddDropdown("Tree", {
    Text = "Tree",
    Values = {"all","Birch","Maple", "Pine", "Hickory", "Spirit", "CherryBlossom"},
    Default = "",
    Multi = false,
    Callback = function(Value)
_G.TrueFarm = Value
    end
})

Main1Group:AddToggle("Auto Farm Tree", {
    Text = "Auto Farm Tree",
    Default = false,
    Callback = function(Value)
_G.AutoFarmTree = Value
while _G.AutoFarmTree do
if _G.TrueFarm == "all" then
for i, v in pairs(workspace.Islands:GetChildren()) do
for i, a in pairs(v.Blocks:GetChildren()) do
if string.match(a.Name, "tree") and a:FindFirstChild("trunk") then
repeat task.wait()
if _G.AutoFarmTree == false then
break
end
TweenTp(a:FindFirstChild("trunk"), _G.SpeedTween, 0)
game:GetService("ReplicatedStorage").rbxts_include.node_modules:FindFirstChild("@rbxts").net.out._NetManaged.CLIENT_BLOCK_HIT_REQUEST:InvokeServer({
["xkpOrfvithbzcvKundjsvoamBnpkqBsXm"] = "\7\240\159\164\163\240\159\164\161\7\n\7\n\7\nkyaxebDphmkcyha",
["part"] = a:FindFirstChild("trunk") or a:FindFirstChildWhichIsA("MeshPart"),
["block"] = a,
["norm"] = Vector3.new(a.CFrame),
["pos"] = a.Position})
until a.Parent == nil
end
end
end
else
for i, v in pairs(workspace.Islands:GetChildren()) do
for i, a in pairs(v.Blocks:GetChildren()) do
if string.match(a.Name, "true".._G.TrueFarm) and a:FindFirstChild("trunk") then
repeat task.wait()
if _G.AutoFarmTree == false then
break
end
TweenTp(a:FindFirstChild("trunk"), 0)
game:GetService("ReplicatedStorage").rbxts_include.node_modules:FindFirstChild("@rbxts").net.out._NetManaged.CLIENT_BLOCK_HIT_REQUEST:InvokeServer({
["xkpOrfvithbzcvKundjsvoamBnpkqBsXm"] = "\7\240\159\164\163\240\159\164\161\7\n\7\n\7\nkyaxebDphmkcyha",
["part"] = a:FindFirstChild("trunk"),
["block"] = a,
["norm"] = Vector3.new(a.CFrame),
["pos"] = a.Position})
until a.Parent == nil
end
end
end
end
task.wait()
end
    end
})

Main1Group:AddDropdown("Crop", {
    Text = "Crop",
    Values = {"candyCaneVine", "carrot", "chiliPepper", "dragonfruit", "grapeVine", "melon", "onion", "pineapple", "potato", "pumpkin", "spinach", "spiritCrop", "starfruit", "tomato", "wheat"},
    Default = "",
    Multi = false,
    Callback = function(Value)
_G.CropFarm = Value
    end
})

Main1Group:AddToggle("Auto Farm Crop", {
    Text = "Auto Farm Crop",
    Default = false,
    Callback = function(Value)
_G.AutoFarmCrop = Value
while _G.AutoFarmCrop do
CC = 0
ReplaceCFrame = {}
for i, v in pairs(workspace.Islands:GetChildren()) do
for i, a in pairs(v.Blocks:GetChildren()) do
if a.Name == _G.CropFarm and a:FindFirstChild("stage") and a.stage.Value == 3 then
TweenTp(a, _G.SpeedTween, 0)
if 30 > (a.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude then
CC = CC + 1
ReplaceCFrame[CC] = a.CFrame
end
game:GetService("ReplicatedStorage").rbxts_include.node_modules:FindFirstChild("@rbxts").net.out._NetManaged.CLIENT_HARVEST_CROP_REQUEST:InvokeServer({
["player"] = game:GetService("Players").LocalPlayer,
["tukiqepvhyyBj"] = "\7\240\159\164\163\240\159\164\161\7\n\7\n\7\nFOenfsq",
["model"] = a})
end
end
end
task.wait()
for i,v in pairs(ReplaceCFrame) do
game:GetService("ReplicatedStorage").rbxts_include.node_modules:FindFirstChild("@rbxts").net.out._NetManaged.CLIENT_BLOCK_PLACE_REQUEST:InvokeServer({
["upperBlock"] = false,
["cframe"] = v,
["foaouddukLJgsWeqarxxCuFoWLvf"] = "\7\240\159\164\163\240\159\164\161\7\n\7\n\7\nUaEGjnxjhvDnxhZlbHrbjiAonkqdgm",
["blockType"] = _G.CropFarm})
v = nil
end
task.wait()
end
    end
})

Main1Group:AddToggle("Auto Farm Berry Bush", {
    Text = "Auto Farm Berry Bush",
    Default = false,
    Callback = function(Value)
_G.AutoFarmCropBush = Value
while _G.AutoFarmCropBush do
for i, v in pairs(workspace.Islands:GetChildren()) do
for i, a in pairs(v.Blocks:GetChildren()) do
if a.Name == "berryBush" or a.Name == "blueberryBush" or a.Name == "blackberryBush" then
if a:FindFirstChild("stage") and a.stage.Value == 2 then
TweenTp(a, _G.SpeedTween)
game:GetService("ReplicatedStorage").rbxts_include.node_modules:FindFirstChild("@rbxts").net.out._NetManaged.CLIENT_HARVEST_CROP_REQUEST:InvokeServer({
["player"] = game.Players.LocalPlayer,
["tukiqepvhyyBj"] = "\7\240\159\164\163\240\159\164\161\7\n\7\n\7\nFOenfsq",
["model"] = a})
end
end
end
end
task.wait()
end
    end
})

Main1Group:AddDropdown("Minerals", {
    Text = "Minerals",
    Values = {"All", "Amethyst", "Amethyst Stone", "Coal", "Copper", "Diamond", "Diorite", "Electrite", "Gold", "Iron", "Obsidian", "Opal", "Stone"},
    Default = "",
    Multi = false,
    Callback = function(Value)
if Value == "All" then
_G.RockFarm = "All"
elseif Value == "Amethyst Stone" then
_G.RockFarm = "rockAmethystStone"
else
_G.RockFarm = "rock"..Value
end
    end
})

Main1Group:AddToggle("Auto Farm Rock", {
    Text = "Auto Farm Rock",
    Default = false,
    Callback = function(Value)
_G.AutoRock = Value
while _G.AutoRock do
if _G.RockFarm == "All" then
if game.Workspace:FindFirstChild("WildernessBlocks") then
for i,v in pairs(game:GetService("Workspace").WildernessBlocks:GetChildren()) do 
if string.find(v.Name, "rock") and v:FindFirstChild("1") then
repeat task.wait()
if _G.AutoRock == false then
break
end
TweenTp(v, _G.SpeedTween, 3)
game:GetService("ReplicatedStorage").rbxts_include.node_modules:FindFirstChild("@rbxts").net.out._NetManaged.CLIENT_BLOCK_HIT_REQUEST:InvokeServer({
["xkpOrfvithbzcvKundjsvoamBnpkqBsXm"] = "\7\240\159\164\163\240\159\164\161\7\n\7\n\7\nkyaxebDphmkcyha",
["part"] = v:FindFirstChild("1"),
["block"] = v,
["norm"] = Vector3.new(v.CFrame),
["pos"] = v:FindFirstChild("1").Position})
until v.Parent == nil
end
end
end
if game.Workspace:FindFirstChild("Islands") then
for i, v in pairs(workspace.Islands:GetChildren()) do
for i, a in pairs(v.Blocks:GetChildren()) do
if string.find(a.Name, "rock") and a:FindFirstChild("1") then
repeat task.wait()
if _G.AutoRock == false then
break
end
TweenTp(a, _G.SpeedTween, 3)
game:GetService("ReplicatedStorage").rbxts_include.node_modules:FindFirstChild("@rbxts").net.out._NetManaged.CLIENT_BLOCK_HIT_REQUEST:InvokeServer({
["xkpOrfvithbzcvKundjsvoamBnpkqBsXm"] = "\7\240\159\164\163\240\159\164\161\7\n\7\n\7\nkyaxebDphmkcyha",
["part"] = a:FindFirstChild("1"),
["block"] = a,
["norm"] = Vector3.new(a.CFrame),
["pos"] = a:FindFirstChild("1").Position})
until a.Parent == nil
end
end
end
end
else
if game.Workspace:FindFirstChild("WildernessBlocks") then
for i,v in pairs(game:GetService("Workspace").WildernessBlocks:GetChildren()) do 
if v.Name == _G.RockFarm and v:FindFirstChild("1") then
repeat task.wait()
if _G.AutoRock == false then
break
end
TweenTp(v, _G.SpeedTween, 3)
game:GetService("ReplicatedStorage").rbxts_include.node_modules:FindFirstChild("@rbxts").net.out._NetManaged.CLIENT_BLOCK_HIT_REQUEST:InvokeServer({
["xkpOrfvithbzcvKundjsvoamBnpkqBsXm"] = "\7\240\159\164\163\240\159\164\161\7\n\7\n\7\nkyaxebDphmkcyha",
["part"] = v:FindFirstChild("1"),
["block"] = v,
["norm"] = Vector3.new(v.CFrame),
["pos"] = v:FindFirstChild("1").Position})
until v.Parent == nil
end
end
end
if game.Workspace:FindFirstChild("Islands") then
for i, v in pairs(workspace.Islands:GetChildren()) do
for i, a in pairs(v.Blocks:GetChildren()) do
if a.Name == _G.RockFarm and a:FindFirstChild("1") then
repeat task.wait()
if _G.AutoRock == false then
break
end
TweenTp(a, _G.SpeedTween, 3)
game:GetService("ReplicatedStorage").rbxts_include.node_modules:FindFirstChild("@rbxts").net.out._NetManaged.CLIENT_BLOCK_HIT_REQUEST:InvokeServer({
["xkpOrfvithbzcvKundjsvoamBnpkqBsXm"] = "\7\240\159\164\163\240\159\164\161\7\n\7\n\7\nkyaxebDphmkcyha",
["part"] = a:FindFirstChild("1"),
["block"] = a,
["norm"] = Vector3.new(a.CFrame),
["pos"] = a:FindFirstChild("1").Position})
until a.Parent == nil
end
end
end
end
end
task.wait()
end
    end
})

Main1Group:AddDropdown("Burn", {
    Text = "Burn",
    Values = {"ironOre", "goldOre", "copperOre", "iron"},
    Default = "",
    Multi = false,
    Callback = function(Value)
_G.BurnOre = Value
    end
})

Main1Group:AddDropdown("NeedBurn", {
    Text = "Need Burn",
    Values = {"coal"},
    Default = "",
    Multi = false,
    Callback = function(Value)
_G.NeedBurn = Value
    end
})

Main1Group:AddDropdown("Kiln", {
    Text = "Kiln",
    Values = {"campfire", "smallFurnace", "steelMill"},
    Default = "",
    Multi = false,
    Callback = function(Value)
_G.KilnBurn = Value
    end
})

Main1Group:AddToggle("Auto Burn", {
    Text = "Auto Burn",
    Default = false,
    Callback = function(Value)
_G.AutoBurn = Value
while _G.AutoBurn do
for i, v in pairs(workspace.Islands:GetChildren()) do
for i, a in pairs(v.Blocks:GetChildren()) do
if a.Name == _G.KilnBurn then
game:GetService("ReplicatedStorage").rbxts_include.node_modules:FindFirstChild("@rbxts").net.out._NetManaged.CLIENT_BLOCK_WORKER_DEPOSIT_TOOL_REQUEST:InvokeServer({
["amount"] = 1,
["block"] = a,
["oqCREryvwqdcezCxKjedozsQIpwfhw"] = "\7\240\159\164\163\240\159\164\161\7\n\7\n\7\ndhcEazkxdsJcKmwdytghxntlgqtCyCsa",
["toolName"] = _G.BurnOre})
game:GetService("ReplicatedStorage").rbxts_include.node_modules:FindFirstChild("@rbxts").net.out._NetManaged.CLIENT_BLOCK_WORKER_DEPOSIT_TOOL_REQUEST:InvokeServer({
["amount"] = 1,
["block"] = a,
["oqCREryvwqdcezCxKjedozsQIpwfhw"] = "\7\240\159\164\163\240\159\164\161\7\n\7\n\7\ndhcEazkxdsJcKmwdytghxntlgqtCyCsa",
["toolName"] = _G.NeedBurn})
end
end
end
task.wait()
end
    end
})

local Main2Group = Tabs.Tab:AddRightGroupbox("Aura")

_G.ReachArua = 30
Main2Group:AddSlider("Reach Aura", {
    Text = "Reach Aura",
    Default = 30,
    Min = 10,
    Max = 50,
    Rounding = 0,
    Compact = true,
    Callback = function(Value)
_G.ReachArua = Value
    end
})

Main2Group:AddToggle("Aura Pickup", {
    Text = "Aura Pickup Item",
    Default = false,
    Callback = function(Value)
_G.AutoPickupItem = Value
while _G.AutoPickupItem do
for i, v in pairs(workspace.Islands:GetChildren()) do
for i, a in pairs(v.Drops:GetChildren()) do
if a.ClassName == "Tool" and _G.ReachArua >= (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - a.HandleDisabled.Position).Magnitude then
game:GetService("ReplicatedStorage").rbxts_include.node_modules:FindFirstChild("@rbxts").net.out._NetManaged.CLIENT_TOOL_PICKUP_REQUEST:InvokeServer({
["tool"] = a,
["UkOvamtydvkHSlqjbwGaxeezvfgtmcasShNxTad"] = "\7\240\159\164\163\240\159\164\161\7\n\7\n\7\nqsxlRbaoicRuVtnfBkCmofWahfZ"})
end
end
end
task.wait()
end
    end
})

Main2Group:AddDropdown("Minerals", {
    Text = "Minerals",
    Values = {"All", "Amethyst", "Amethyst Stone", "Coal", "Copper", "Diamond", "Diorite", "Electrite", "Gold", "Iron", "Obsidian", "Opal", "Stone"},
    Default = "",
    Multi = false,
    Callback = function(Value)
if Value == "All" then
_G.Rock = "All"
elseif Value == "Amethyst Stone" then
_G.Rock = "rockAmethystStone"
else
_G.Rock = "rock"..Value
end
    end
})

Main2Group:AddToggle("Aura Rock", {
    Text = "Aura Rock",
    Default = false,
    Callback = function(Value)
_G.AuraRock = Value
while _G.AuraRock do
if _G.Rock == "All" then
if game.Workspace:FindFirstChild("WildernessBlocks") then
for i,v in pairs(game:GetService("Workspace").WildernessBlocks:GetChildren()) do 
if string.find(v.Name, "rock") and v:FindFirstChild("1") and _G.ReachArua >= (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).Magnitude then
game:GetService("ReplicatedStorage").rbxts_include.node_modules:FindFirstChild("@rbxts").net.out._NetManaged.CLIENT_BLOCK_HIT_REQUEST:InvokeServer({
["xkpOrfvithbzcvKundjsvoamBnpkqBsXm"] = "\7\240\159\164\163\240\159\164\161\7\n\7\n\7\nkyaxebDphmkcyha",
["part"] = v:FindFirstChild("1"),
["block"] = v,
["norm"] = Vector3.new(v.CFrame),
["pos"] = v:FindFirstChild("1").Position})
end
end
end
if game.Workspace:FindFirstChild("Islands") then
for i, v in pairs(workspace.Islands:GetChildren()) do
for i, a in pairs(v.Blocks:GetChildren()) do
if string.find(a.Name, "rock") and a:FindFirstChild("1") and _G.ReachArua >= (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - a.Position).Magnitude then
game:GetService("ReplicatedStorage").rbxts_include.node_modules:FindFirstChild("@rbxts").net.out._NetManaged.CLIENT_BLOCK_HIT_REQUEST:InvokeServer({
["xkpOrfvithbzcvKundjsvoamBnpkqBsXm"] = "\7\240\159\164\163\240\159\164\161\7\n\7\n\7\nkyaxebDphmkcyha",
["part"] = a:FindFirstChild("1"),
["block"] = a,
["norm"] = Vector3.new(a.CFrame),
["pos"] = a:FindFirstChild("1").Position})
end
end
end
end
else
if game.Workspace:FindFirstChild("WildernessBlocks") then
for i,v in pairs(game:GetService("Workspace").WildernessBlocks:GetChildren()) do 
if v.Name == _G.Rock and v:FindFirstChild("1") and _G.ReachArua >= (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).Magnitude then
game:GetService("ReplicatedStorage").rbxts_include.node_modules:FindFirstChild("@rbxts").net.out._NetManaged.CLIENT_BLOCK_HIT_REQUEST:InvokeServer({
["xkpOrfvithbzcvKundjsvoamBnpkqBsXm"] = "\7\240\159\164\163\240\159\164\161\7\n\7\n\7\nkyaxebDphmkcyha",
["part"] = v:FindFirstChild("1"),
["block"] = v,
["norm"] = Vector3.new(v.CFrame),
["pos"] = v:FindFirstChild("1").Position})
end
end
end
if game.Workspace:FindFirstChild("Islands") then
for i, v in pairs(workspace.Islands:GetChildren()) do
for i, a in pairs(v.Blocks:GetChildren()) do
if a.Name == _G.Rock and a:FindFirstChild("1") and _G.ReachArua >= (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - a.Position).Magnitude then
game:GetService("ReplicatedStorage").rbxts_include.node_modules:FindFirstChild("@rbxts").net.out._NetManaged.CLIENT_BLOCK_HIT_REQUEST:InvokeServer({
["xkpOrfvithbzcvKundjsvoamBnpkqBsXm"] = "\7\240\159\164\163\240\159\164\161\7\n\7\n\7\nkyaxebDphmkcyha",
["part"] = a:FindFirstChild("1"),
["block"] = a,
["norm"] = Vector3.new(a.CFrame),
["pos"] = a:FindFirstChild("1").Position})
end
end
end
end
end
task.wait()
end
    end
})

Main2Group:AddDropdown("Tree", {
    Text = "Tree",
    Values = {"all","Birch","Maple", "Pine", "Hickory", "Spirit", "CherryBlossom"},
    Default = "",
    Multi = false,
    Callback = function(Value)
_G.TrueFarm = Value
    end
})

Main2Group:AddToggle("Aura Tree", {
    Text = "Aura Tree",
    Default = false,
    Callback = function(Value)
_G.AuraTree = Value
while _G.AuraTree do
if _G.TrueFarm == "all" then
for i, v in pairs(workspace.Islands:GetChildren()) do
for i, a in pairs(v.Blocks:GetChildren()) do
if string.match(a.Name, "tree") and a:FindFirstChild("trunk") and _G.ReachArua >= (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - a.trunk.Position).Magnitude then
game:GetService("ReplicatedStorage").rbxts_include.node_modules:FindFirstChild("@rbxts").net.out._NetManaged.CLIENT_BLOCK_HIT_REQUEST:InvokeServer({
["xkpOrfvithbzcvKundjsvoamBnpkqBsXm"] = "\7\240\159\164\163\240\159\164\161\7\n\7\n\7\nkyaxebDphmkcyha",
["part"] = a:FindFirstChild("trunk"),
["block"] = a,
["norm"] = Vector3.new(a.CFrame),
["pos"] = a.Position})
end
end
end
else
for i, v in pairs(workspace.Islands:GetChildren()) do
for i, a in pairs(v.Blocks:GetChildren()) do
if string.match(a.Name, "tree".._G.TrueFarm) and a:FindFirstChild("trunk") and _G.ReachArua >= (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - a.trunk.Position).Magnitude then
game:GetService("ReplicatedStorage").rbxts_include.node_modules:FindFirstChild("@rbxts").net.out._NetManaged.CLIENT_BLOCK_HIT_REQUEST:InvokeServer({
["xkpOrfvithbzcvKundjsvoamBnpkqBsXm"] = "\7\240\159\164\163\240\159\164\161\7\n\7\n\7\nkyaxebDphmkcyha",
["part"] = a:FindFirstChild("trunk"),
["block"] = a,
["norm"] = Vector3.new(a.CFrame),
["pos"] = a.Position})
end
end
end
end
task.wait()
end
    end
})

--- Create ---
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
    Max = 5,
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

CreditsGroup:AddLabel("AmongUs - Python / Dex / Script")
CreditsGroup:AddLabel("Giang Hub - Script / Dex")

Library.ToggleKeybind = Options.MenuKeybind

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:BuildConfigSection(Tabs["UI Settings"])
ThemeManager:ApplyToTab(Tabs["UI Settings"])
SaveManager:LoadAutoloadConfig()
