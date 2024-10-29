if _G.GloveChoose == nil then
_G.GloveChoose = "No"
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

if _G.Farm == nil then
_G.Farm = {
	Slapple = true,
	Candy = false
}
end

while true do
repeat task.wait()
for i,v in pairs(game.Players.LocalPlayer.PlayerGui:GetChildren()) do
if v.Name == "Component" and v:FindFirstChild("SlapTournament") then
_G.SlapTournament = v.SlapTournament.Visible
end
end
if _G.SlapTournament == false then
if _G.Farm.Slapple == true then
if game.Players.LocalPlayer.Character:FindFirstChild("entered") then
for i, v in pairs(workspace.Arena.island5.Slapples:GetChildren()) do
                if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("entered") and v.Name == "Slapple" or v.Name == "GoldenSlapple" and v:FindFirstChild("Glove") and v.Glove:FindFirstChildWhichIsA("TouchTransmitter") then
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Glove, 0)
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Glove, 1)
                end
            end
       end
end
if _G.Farm.Candy == true then
for i, v in pairs(game.Workspace.CandyCorns:GetChildren()) do
                if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                   v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                end
            end
end
end
until _G.SlapTournament == true
game:GetService("ReplicatedStorage").Events.Tournament.TournamentResponse:FireServer(true)
for i,v in pairs(game.Players.LocalPlayer.PlayerGui:GetChildren()) do
if v.Name == "Component" and v:FindFirstChild("SlapTournament") then
v.SlapTournament.Visible = false
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
elseif _G.GloveChoose == "No" or _G.GloveChoose == "Nah" or _G.GloveChoose == "Nah Id Win" or _G.GloveChoose == "Nah id win" then
repeat task.wait()
if game.Workspace.CurrentCamera.CameraSubject ~= workspace.Battlearena:FindFirstChild("Arena") then
game.Workspace.CurrentCamera.CameraSubject = workspace.Battlearena:FindFirstChild("Arena")
end
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace["Safespot"].CFrame * CFrame.new(0,10,0)
until game.Players.LocalPlayer.Character.Humanoid.Health == 0
if workspace:FindFirstChild("ff") then
workspace:FindFirstChild("ff"):Destroy()
end
wait(0.5)
game.Workspace.CurrentCamera.CameraSubject = game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid")
end
task.wait(0.3)
end