if _G.GloveChoose == nil then
_G.GloveChoose = "Normal"
end

if _G.GloveChoose == "No" or _G.GloveChoose == "Nah" or _G.GloveChoose == "Nah Id Win" or _G.GloveChoose == "Nah id win" then
if workspace:FindFirstChild("ff") == nil then
local Safespot = Instance.new("Part",workspace)
Safespot.Name = "ff"
Safespot.Position = Vector3.new(10000,-50,10000)
Safespot.Size = Vector3.new(500,10,500)
Safespot.Anchored = true
Safespot.CanCollide = true
Safespot.Transparency = .5
end
end

while true do
repeat task.wait()
for i,v in pairs(game.Players.LocalPlayer.PlayerGui:GetChildren()) do
if v.Name == "Component" and v:FindFirstChild("SlapTournament") then
_G.SlapTournament = v.SlapTournament.Visible
end
end
if _G.SlapTournament == false then
if game.Players.LocalPlayer.Character:FindFirstChild("entered") then
for i, v in pairs(workspace.Arena.island5.Slapples:GetChildren()) do
                if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("entered") and v.Name == "Slapple" or v.Name == "GoldenSlapple" and v:FindFirstChild("Glove") and v.Glove:FindFirstChildWhichIsA("TouchTransmitter") then
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Glove, 0)
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Glove, 1)
                end
            end
       end
for i, v in pairs(game.Workspace.CandyCorns:GetChildren()) do
                if game.Players.LocalPlayer.Character:FindFirstChild("Head") and v:FindFirstChild("TouchTransmitter") then
                    firetouchinterest(game.Players.LocalPlayer.Character:FindFirstChild("Head"), v, 0)
                    firetouchinterest(game.Players.LocalPlayer.Character:FindFirstChild("Head"), v, 1)
                end
            end
end
until _G.SlapTournament == true
game:GetService("ReplicatedStorage").Events.Tournament.TournamentResponse:FireServer(true)
for i,v in pairs(game.Players.LocalPlayer.PlayerGui:GetChildren()) do
if v.Name == "Component" and v:FindFirstChild("SlapTournament") then
v.SlapTournament.Visible = false
if v:FindFirstChild("SlapTournament") and v.SlapTournament:FindFirstChild("Rewards") and v.SlapTournament.Rewards:FindFirstChild("SlapAmount") then
_G.SlapAmount = v.SlapTournament.Rewards.SlapAmount.Text
end
end
end
_G.SlapTournament = false
wait(4)
if _G.GloveChoose == "PowerFull" then
if game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil then
if game.Players.LocalPlayer.leaderstats.Slaps.Value >= 50000 then
fireclickdetector(game.Workspace.Lobby["Error"].ClickDetector)
elseif game.Players.LocalPlayer.leaderstats.Slaps.Value >= 3500 then
fireclickdetector(game.Workspace.Lobby["Reaper"].ClickDetector)
end
wait(0.5)
if not game.Players.LocalPlayer.Character:FindFirstChild("entered") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
repeat task.wait()
firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport1.TouchInterest.Parent, 0)
firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport1.TouchInterest.Parent, 1)
until game.Players.LocalPlayer.Character:FindFirstChild("entered")
end
wait(0.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Battlearena.Arena.CFrame * CFrame.new(0,10,0)
end
elseif _G.GloveChoose == "Normal" then
if game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil then
if game.Players.LocalPlayer.leaderstats.Slaps.Value >= 45 then
fireclickdetector(game.Workspace.Lobby["Diamond"].ClickDetector)
end
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Battlearena.Arena.CFrame * CFrame.new(0,70,0)
wait(0.5)
if game.Players.LocalPlayer.Character:FindFirstChild("rock") == nil then
wait(0.5)
if game.Players.LocalPlayer.Character:FindFirstChild("rock") == nil then
game:GetService("ReplicatedStorage"):WaitForChild("Rockmode"):FireServer()
end
end
repeat task.wait()
if game.Players.LocalPlayer.Character:FindFirstChild("entered") then
for i, v in pairs(workspace.Arena.island5.Slapples:GetChildren()) do
                if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("entered") and v.Name == "Slapple" or v.Name == "GoldenSlapple" and v:FindFirstChild("Glove") and v.Glove:FindFirstChildWhichIsA("TouchTransmitter") then
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Glove, 0)
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Glove, 1)
                end
            end
       end
for i, v in pairs(game.Workspace.CandyCorns:GetChildren()) do
                if game.Players.LocalPlayer.Character:FindFirstChild("Head") and v:FindFirstChild("TouchTransmitter") then
                    firetouchinterest(game.Players.LocalPlayer.Character:FindFirstChild("Head"), v, 0)
                    firetouchinterest(game.Players.LocalPlayer.Character:FindFirstChild("Head"), v, 1)
                end
            end
until game.Players.LocalPlayer.PlayerGui.Event:FindFirstChild("Winner").TextLabel.Text == game.Players.LocalPlayer.Name.." just won "..string.match(_G.SlapAmount, "%d+").." Slaps!"
if game.Players.LocalPlayer.PlayerGui.Event:FindFirstChild("Winner").TextLabel.Text == game.Players.LocalPlayer.Name.." just won "..string.match(_G.SlapAmount, "%d+").." Slaps!" then
if game.Players.LocalPlayer.Character:FindFirstChild("rock") then
game:GetService("ReplicatedStorage"):WaitForChild("Rockmode"):FireServer()
end
end
end
elseif _G.GloveChoose == "No" or _G.GloveChoose == "Nah" or _G.GloveChoose == "Nah Id Win" or _G.GloveChoose == "Nah id win" then
repeat task.wait()
if _G.View == true then
if game.Workspace.CurrentCamera.CameraSubject ~= workspace.Battlearena:FindFirstChild("Arena") then
game.Workspace.CurrentCamera.CameraSubject = workspace.Battlearena:FindFirstChild("Arena")
end
end
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace["Safespot"].CFrame * CFrame.new(0,10,0)
until game.Players.LocalPlayer.Character.Humanoid.Health == 0
if workspace:FindFirstChild("ff") then
workspace:FindFirstChild("ff"):Destroy()
end
wait(0.5)
if _G.View == true then
game.Workspace.CurrentCamera.CameraSubject = game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid")
end
end
task.wait(0.3)
end