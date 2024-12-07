_G.GameType = "None"

if game.PlaceId == 6403373529 or game.PlaceId == 9015014224 or game.PlaceId == 11520107397 then
_G.GameType = "Slap_Battles"
end
if game.PlaceId == 4872321990 then 
_G.GameType = "Islands"
end
if game.PlaceId == 9772878203 then 
_G.GameType = "Raise-A-Floppy-2"
end
if _G.GameType = "None" then
Print("Invaild Game")
end

loadstring(game:HttpGet("https://raw.githubusercontent.com/Playgiang/Slap_Battles/refs/heads/main/scr/" .. _G.GameType .. ".lua"))()
