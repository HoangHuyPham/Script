repeat task.wait() until game:IsLoaded() and KRNL_LOADED and game.GameId == 994732206
task.wait(3)

 --Instances:
local toggle = function(instance) end
local reloadToggle = function(imagebutton) end
local loadUIFromData = function() end
local HBFruit = Instance.new("ScreenGui")
local background = Instance.new("ImageLabel")
local container = Instance.new("ScrollingFrame")
local farmChest = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local ImageButton = Instance.new("ImageButton")
ImageButton.Activated:Connect(function()
	toggle(ImageButton)
end)
local UIListLayout = Instance.new("UIListLayout")
local UIListLayout_2 = Instance.new("UIListLayout")
local stopAtBeli = Instance.new("Frame")
local UIListLayout_3 = Instance.new("UIListLayout")
local TextLabel_2 = Instance.new("TextLabel")
local TextBox = Instance.new("TextBox")
TextBox.Changed:Connect(function(property)
	if (property == "Text") then
		if not (_G.HBFruit) then
			repeat task.wait(1) until _G.HBFruit
		end
		
	end
end)
local fastMode = Instance.new("Frame")
local TextLabel_3 = Instance.new("TextLabel")
local ImageButton_2 = Instance.new("ImageButton")
ImageButton_2.Activated:Connect(function()
	toggle(ImageButton_2)
end)
local UIListLayout_4 = Instance.new("UIListLayout")
local TextLabel_4 = Instance.new("TextLabel")
local LocalPlayer = game:GetService("Players").LocalPlayer

local dragging = nil
local dragInput = nil
local dragStart = nil
local startPos = nil

local UserInputService = game:GetService("UserInputService")

--Properties:

HBFruit.Name = "HBFruit"
HBFruit.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
HBFruit.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

background.Name = "background"
background.Parent = HBFruit
background.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
background.BorderColor3 = Color3.fromRGB(0, 0, 0)
background.BorderSizePixel = 0
background.Position = UDim2.new(0.654929578, 0, 0.204166666, 0)
background.Size = UDim2.new(0, 320, 0, 480)
background.Image = "rbxassetid://14646385618"

container.Name = "container"
container.Parent = background
container.Active = true
container.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
container.BackgroundTransparency = 0.500
container.BorderColor3 = Color3.fromRGB(0, 0, 0)
container.BorderSizePixel = 0
container.Position = UDim2.new(0.0500000007, 0, 0.150000006, 0)
container.Size = UDim2.new(0.899999976, 0, 0.800000012, 0)
container.CanvasSize = UDim2.new(0, 0, 0, 0)
container.HorizontalScrollBarInset = Enum.ScrollBarInset.ScrollBar
container.ScrollBarThickness = 5
container.VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar

farmChest.Name = "farmChest"
farmChest.Parent = container
farmChest.BackgroundColor3 = Color3.fromRGB(155, 229, 128)
farmChest.BorderColor3 = Color3.fromRGB(0, 0, 0)
farmChest.BorderSizePixel = 0
farmChest.NextSelectionDown = stopAtBeli
farmChest.Size = UDim2.new(1, 0, 0.100000001, 0)

TextLabel.Parent = farmChest
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.NextSelectionRight = ImageButton
TextLabel.Size = UDim2.new(0.800000012, 0, 1, 0)
TextLabel.Font = Enum.Font.SourceSansBold
TextLabel.Text = "Farm Chest"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
TextLabel.TextSize = 30.000
TextLabel.TextWrapped = true

ImageButton.Parent = farmChest
ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageButton.BorderSizePixel = 0
ImageButton.NextSelectionLeft = TextLabel
ImageButton.Size = UDim2.new(0.200000003, 0, 1, 0)
ImageButton.Image = "rbxassetid://14652140686"

UIListLayout.Parent = farmChest
UIListLayout.FillDirection = Enum.FillDirection.Horizontal
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

UIListLayout_2.Parent = container
UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder

stopAtBeli.Name = "stopAtBeli"
stopAtBeli.Parent = container
stopAtBeli.BackgroundColor3 = Color3.fromRGB(155, 229, 128)
stopAtBeli.BorderColor3 = Color3.fromRGB(0, 0, 0)
stopAtBeli.BorderSizePixel = 0
stopAtBeli.Size = UDim2.new(1, 0, 0.100000001, 0)

UIListLayout_3.Parent = stopAtBeli
UIListLayout_3.FillDirection = Enum.FillDirection.Horizontal
UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder

TextLabel_2.Parent = stopAtBeli
TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.BackgroundTransparency = 1.000
TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_2.BorderSizePixel = 0
TextLabel_2.NextSelectionRight = ImageButton
TextLabel_2.Size = UDim2.new(0.600000024, 0, 1, 0)
TextLabel_2.Font = Enum.Font.SourceSansBold
TextLabel_2.Text = "Stop at beli:"
TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 0)
TextLabel_2.TextSize = 30.000
TextLabel_2.TextWrapped = true

TextBox.Parent = stopAtBeli
TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextBox.BorderColor3 = Color3.fromRGB(255, 255, 127)
TextBox.Size = UDim2.new(0.400000006, 0, 1, 0)
TextBox.Font = Enum.Font.SourceSans
TextBox.PlaceholderText = "-1 is no limit"
TextBox.Text = "-1"
TextBox.TextColor3 = Color3.fromRGB(0, 255, 127)
TextBox.TextScaled = true
TextBox.TextSize = 14.000
TextBox.TextWrapped = true

fastMode.Name = "fastMode"
fastMode.Parent = container
fastMode.BackgroundColor3 = Color3.fromRGB(155, 229, 128)
fastMode.BorderColor3 = Color3.fromRGB(0, 0, 0)
fastMode.BorderSizePixel = 0
fastMode.NextSelectionUp = stopAtBeli
fastMode.Size = UDim2.new(1, 0, 0.100000001, 0)

TextLabel_3.Parent = fastMode
TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_3.BackgroundTransparency = 1.000
TextLabel_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_3.BorderSizePixel = 0
TextLabel_3.NextSelectionRight = ImageButton
TextLabel_3.Size = UDim2.new(0.800000012, 0, 1, 0)
TextLabel_3.Font = Enum.Font.SourceSansBold
TextLabel_3.Text = "Fast Mode"
TextLabel_3.TextColor3 = Color3.fromRGB(255, 255, 0)
TextLabel_3.TextSize = 30.000
TextLabel_3.TextWrapped = true

ImageButton_2.Parent = fastMode
ImageButton_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageButton_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageButton_2.BorderSizePixel = 0
ImageButton_2.NextSelectionLeft = TextLabel_3
ImageButton_2.Size = UDim2.new(0.200000003, 0, 1, 0)
ImageButton_2.Image = "rbxassetid://14652140686"

UIListLayout_4.Parent = fastMode
UIListLayout_4.FillDirection = Enum.FillDirection.Horizontal
UIListLayout_4.SortOrder = Enum.SortOrder.LayoutOrder

TextLabel_4.Parent = background
TextLabel_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_4.BackgroundTransparency = 1.000
TextLabel_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_4.BorderSizePixel = 0
TextLabel_4.NextSelectionRight = ImageButton
TextLabel_4.Position = UDim2.new(0.0500000007, 0, 0.100000001, 0)
TextLabel_4.Size = UDim2.new(0.200000003, 0, 0.0500000007, 0)
TextLabel_4.Font = Enum.Font.SourceSansBold
TextLabel_4.Text = "Misc"
TextLabel_4.TextColor3 = Color3.fromRGB(9, 9, 9)
TextLabel_4.TextSize = 25.000
TextLabel_4.TextWrapped = true

--Initialize
_G.HBFruitIsLoaded = true
loadUIFromData()

local gui = background --guihere (frame)
local function update(input)
	local delta = input.Position - dragStart
	gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

--component for handle
gui.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = gui.Position

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

gui.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		dragInput = input
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		update(input)
	end
end)

--Functions:
function toggle(instance)
	if (instance:IsA("TextButton") or instance:IsA("ImageButton")) then
		instance.Selected = not instance.Selected
	end
	reloadToggle(instance)
	if not (_G.HBFruit) then
		repeat task.wait(1) until _G.HBFruit
	end
	_G.HBFruit.Function:saveAs()
end

function reloadToggle(imagebutton)
	if (imagebutton:IsA("ImageButton")) then
		if (imagebutton.Selected) then
			imagebutton.Image = "rbxassetid://14655571847"
	else
			imagebutton.Image = "rbxassetid://14652140686"
	end
	end
end

function loadUIFromData()
	
	if (isfile("HBFruit/"..LocalPlayer.Name.."/data.json")) then
		print("loading..")
		local data = _G.HBFruit.JSON.decode(readfile("HBFruit/"..LocalPlayer.Name.."/data.json"))
		ImageButton.Selected = data.Data.UI.Misc.farmChest
		ImageButton_2.Selected = data.Data.UI.Misc.fastMode
		reloadToggle(ImageButton)
		reloadToggle(ImageButton_2)
		TextBox.Text = data.Data.UI.Misc.beliStop
		
	end
end
