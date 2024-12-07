local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "Script"

local Frame = Instance.new("Frame")
Frame.Name = "Frame1"
Frame.Size = UDim2.new(0.5, 0, 0.75, 0)
Frame.Position = UDim2.new(0.3, 0, 0.15, 0)
Frame.BackgroundColor3 = Color3.new(1, 1, 1)
Frame.BorderColor3 = Color3.new(0, 0, 0)
Frame.BorderSizePixel = 1
Frame.Active = true
Frame.BackgroundTransparency = 1
Frame.Draggable = true
Frame.Parent = gui

local ImageLabel = Instance.new("ImageLabel")
ImageLabel.Size = UDim2.new(1, 0, 1, 0)
ImageLabel.Position = UDim2.new(0, 0, 0, 0)
ImageLabel.BackgroundColor3 = Color3.new(255,255,255)
ImageLabel.BackgroundTransparency = 1
ImageLabel.ImageColor3 = Color3.new(1, 0, 0)
ImageLabel.Image = "rbxassetid://4576475446"
ImageLabel.Parent = Frame

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 15)
UICorner.Parent = ImageLabel

local TextButton = Instance.new("TextButton")
TextButton.Size = UDim2.new(0.15, 0, 0.15, 0)
TextButton.Position = UDim2.new(0.85, 0, 0, 0)
TextButton.BackgroundColor3 = Color3.new(0, 0, 0)
TextButton.Text = "X"
TextButton.TextSize = 10
TextButton.BackgroundTransparency = 1
TextButton.TextColor3 = Color3.new(255, 255, 255)
TextButton.Parent = Frame
TextButton.MouseButton1Click:Connect(function()
game.CoreGui.Script:Destroy()
end)

local TextLabel = Instance.new("TextLabel")
TextLabel.Size = UDim2.new(1, 0, 0.14, 0)
TextLabel.Position = UDim2.new(0, 0, 0, 0)
TextLabel.BackgroundColor3 = Color3.new(255, 255, 255)
TextLabel.Text = "Choose Script"
TextLabel.TextSize = 17
TextLabel.BackgroundTransparency = 1
TextLabel.TextColor3 = Color3.new(255, 255, 255)
TextLabel.Font = Enum.Font.Code
TextLabel.Parent = Frame

local Frame1 = Instance.new("Frame")
Frame1.Size = UDim2.new(0.8, 0, 0.13, 0)
Frame1.Position = UDim2.new(0.1, 0, 0.15, 0)
Frame1.BackgroundColor3 = Color3.new(1, 1, 1)
Frame1.Active = true
Frame1.BackgroundTransparency = 1
Frame1.Parent = Frame

local TextBox = Instance.new("TextBox")
TextBox.Size = UDim2.new(1, 0, 1, 0)
TextBox.Position = UDim2.new(0, 0, 0, 0)
TextBox.BackgroundColor3 = Color3.new(0, 0, 0)
TextBox.BorderColor3 = Color3.new(0, 0, 0)
TextBox.BorderSizePixel = 1
TextBox.Text = ""
TextBox.PlaceholderText = "Search"
TextBox.TextColor3 = Color3.new(1, 1, 1)
TextBox.Font = Enum.Font.Code
TextBox.BackgroundTransparency = 0.5
TextBox.TextSize = 16
TextBox.Parent = Frame1
TextBox.Changed:Connect(function()
	if TextBox.Text:lower() ~= "" then
		for i,v in pairs(game.CoreGui.Script.Frame1.ScrollingFrame:GetDescendants()) do
			if v:IsA("TextButton") then
				if string.find(v.Text:lower(), TextBox.Text:lower()) then
					v.Visible = true
				else
					v.Visible = false
				end
			end
		end
	else
		for i, v in pairs(game.CoreGui.Script.Frame1.ScrollingFrame:GetDescendants()) do
			if v:IsA("TextButton") then
				v.Visible = true
			end
		end
	end
end)

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 7)
UICorner.Parent = TextBox

local ScrollingFrame = Instance.new("ScrollingFrame")
ScrollingFrame.Size = UDim2.new(1, 0, 0.7, 0)
ScrollingFrame.Position = UDim2.new(0, 0, 0.3, 0)
ScrollingFrame.BackgroundColor3 = Color3.new(1, 1, 1)
ScrollingFrame.BorderColor3 = Color3.new(0, 0, 0)
ScrollingFrame.BorderSizePixel = 1
ScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.Parent = Frame

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 10)
UIListLayout.Parent = ScrollingFrame

local Padding = Instance.new("UIPadding")
Padding.PaddingTop = UDim.new(0, 5)
Padding.Parent = ScrollingFrame

function CreateabuttonSc(Name, Call)
local TextButton = Instance.new("TextButton")
TextButton.Size = UDim2.new(0.8, 0, 0.18, 0)
TextButton.Position = UDim2.new(0, 0, 0, 0)
TextButton.BackgroundColor3 = Color3.new(255, 255, 255)
TextButton.Text = Name
TextButton.TextSize = 10
TextButton.BackgroundTransparency = 0.4
TextButton.TextColor3 = Color3.new(0, 0, 0)
TextButton.Parent = ScrollingFrame
TextButton.MouseButton1Click:Connect(function()
pcall(Call)
game.CoreGui.Script:Destroy()
end)

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 7)
UICorner.Parent = TextButton
end

CreateabuttonSc("Islands 🌱", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Playgiang/GameScript/refs/heads/main/scr/Islands.lua"))()
end)

CreateabuttonSc("Weird Strict Dad 👨‍👦", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Playgiang/GameScript/refs/heads/main/scr/Weird_strict_Dad.lua"))()
end)

CreateabuttonSc("Slap Battles 👏", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Playgiang/GameScript/refs/heads/main/Slap_Battles.lua"))()
end)