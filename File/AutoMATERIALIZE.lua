if _G.Farm == nil then
_G.Farm = {
	Slapple = true,
	Candy = false
}
end

function TPOrb()
Orb = true
while Orb do
if game.Workspace:FindFirstChild("MATERIALIZEOrb") == nil then
for i,v in pairs(game.Workspace:GetChildren()) do
                    if v.Name == "JetOrb" or v.Name == "PhaseOrb" then
game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(v.CFrame * CFrame.new(6,0,0)
                    end
                end
else
Orb = false
end
task.wait()
end
end

repeat task.wait()
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
until game.Workspace:FindFirstChild("JetOrb") or game.Workspace:FindFirstChild("PhaseOrb")
game:GetService("Players").LocalPlayer.Reset:FireServer()
wait(4)
if game.Players.LocalPlayer.leaderstats.Glove.Value ~= "Defense" then
fireclickdetector(game.Workspace.Lobby["Defense"].ClickDetector)
end
wait(0.2)
repeat task.wait()
if game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(workspace.Lobby.Teleport1.CFrame)
end
until game.Players.LocalPlayer.Character:FindFirstChild("entered")
task.wait(2.75)
coroutine.wrap(TPOrb)()
wait(0.35)
repeat
if game.Workspace:FindFirstChild("MATERIALIZEOrb") == nil then
game:GetService("ReplicatedStorage").Barrier:FireServer()
wait(0.05)
for i,v in pairs(game.Workspace:GetChildren()) do
                    if string.find(v.Name, "ÅBarrier") then
                        if v.CanCollide == true then
                            v.CanCollide = false
                         end
                     end
                end
wait(4.5)
end
task.wait()
until game.Workspace:FindFirstChild("MATERIALIZEOrb")
game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(game.Workspace:FindFirstChild("MATERIALIZEOrb").CFrame)
end