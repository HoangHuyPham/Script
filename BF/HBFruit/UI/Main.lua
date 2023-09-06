-- Version: 1.0(Beta)
repeat task.wait() until game:IsLoaded() 
task.wait(2)

local notifierBusy= false
local UserInputService = game:GetService("UserInputService")

local dragging = nil
local dragInput = nil
local dragStart = nil
local startPos = nil

-- Instances:

local HBFruit = Instance.new("ScreenGui")
local background = Instance.new("ImageLabel")
local container = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local farmChest = Instance.new("TextLabel")
local farmChestBtn = Instance.new("ImageButton")
local fastMode = Instance.new("TextLabel")
local fastModeBtn = Instance.new("ImageButton")
local lockFPS = Instance.new("TextLabel")
local lockFPSBtn = Instance.new("ImageButton")
local stopAtBeli = Instance.new("TextLabel")
local stopAtBeliTextBox = Instance.new("TextBox")
local sea1 = Instance.new("TextLabel")
local sea1Btn = Instance.new("TextButton")
local sea2 = Instance.new("TextLabel")
local sea2Btn = Instance.new("TextButton")
local sea3 = Instance.new("TextLabel")
local sea3Btn = Instance.new("TextButton")
local hopServer = Instance.new("TextLabel")
local hopServerBtn = Instance.new("TextButton")
local hopLowServer = Instance.new("TextLabel")
local hopLowServerBtn = Instance.new("TextButton")
local changeToMarine = Instance.new("TextLabel")
local changeToMarineBtn = Instance.new("TextButton")
local changeToPirate = Instance.new("TextLabel")
local changeToPirateBtn = Instance.new("TextButton")

local pagination = Instance.new("ScrollingFrame")
local UIListLayout_2 = Instance.new("UIListLayout")
local main = Instance.new("TextButton")
local localPlayer = Instance.new("TextButton")
local misc = Instance.new("TextButton")
local setting = Instance.new("TextButton")
local backgroundNotifier = Instance.new("ImageLabel")
local content = Instance.new("TextLabel")

--Functions
local updateStatusUI = function()end
local toggle = function(instance)end
local notify = function(content)end
local loadUIWithArgs = function(isPagination, farmChest, fastMode, lockFPS, stopBeliAt)end
local processStopAtBeli = function()end

--Properties:

HBFruit.Name = "HBFruit"
HBFruit.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
HBFruit.Enabled = true
HBFruit.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
HBFruit.ResetOnSpawn = false
HBFruit.DisplayOrder = 9998

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
container.BackgroundTransparency = 0.5
container.BorderColor3 = Color3.fromRGB(0, 0, 0)
container.BorderSizePixel = 0
container.Position = UDim2.new(0.05, 0, 0.15, 0)
container.Size = UDim2.new(0.9, 0, 0.8, 0)
container.CanvasSize = UDim2.new(0, 0, 0, 0)
container.HorizontalScrollBarInset = Enum.ScrollBarInset.ScrollBar
container.ScrollBarThickness = 5
container.VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar

UIListLayout.Parent = container
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

farmChest.Name = "farmChest"
farmChest.Parent = container
farmChest.BackgroundColor3 = Color3.fromRGB(85, 170, 0)
farmChest.BorderColor3 = Color3.fromRGB(255, 255, 0)
farmChest.Size = UDim2.new(0.8, 0, 0.1, 0)
farmChest.Font = Enum.Font.Roboto
farmChest.Text = "Farm Chest"
farmChest.TextColor3 = Color3.fromRGB(255, 255, 255)
farmChest.TextSize = 25.000
farmChest.BorderSizePixel = 1
farmChest.BorderMode = Enum.BorderMode.Inset
farmChest:SetAttribute("id", 0)

farmChestBtn.Parent = farmChest
farmChestBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
farmChestBtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
farmChestBtn.BorderSizePixel = 0
farmChestBtn.Position = UDim2.new(1, 0, 0, 0)
farmChestBtn.Size = UDim2.new(0.25, 0, 1, 0)
farmChestBtn.Image = "rbxassetid://14652140686"

fastMode.Name = "fastMode"
fastMode.Parent = container
fastMode.BackgroundColor3 = Color3.fromRGB(85, 170, 0)
fastMode.BorderColor3 = Color3.fromRGB(255, 255, 0)
fastMode.Size = UDim2.new(0.800000012, 0, 0.100000001, 0)
fastMode.Font = Enum.Font.Roboto
fastMode.Text = "Fast Mode"
fastMode.TextColor3 = Color3.fromRGB(255, 255, 255)
fastMode.TextSize = 25
fastMode.BorderSizePixel = 1
fastMode.BorderMode = Enum.BorderMode.Inset
fastMode:SetAttribute("id", 0)

fastModeBtn.Parent = fastMode
fastModeBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
fastModeBtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
fastModeBtn.BorderSizePixel = 0
fastModeBtn.Position = UDim2.new(1, 0, 0, 0)
fastModeBtn.Size = UDim2.new(0.25, 0, 1, 0)
fastModeBtn.Image = "rbxassetid://14652140686"

lockFPS.Name = "lockFPS"
lockFPS.Parent = container
lockFPS.BackgroundColor3 = Color3.fromRGB(85, 170, 0)
lockFPS.BorderColor3 = Color3.fromRGB(255, 255, 0)
lockFPS.Size = UDim2.new(0.800000012, 0, 0.100000001, 0)
lockFPS.Font = Enum.Font.Roboto
lockFPS.Text = "Lock FPS(Decrease CPU/GPU consumption)"
lockFPS.TextColor3 = Color3.fromRGB(255, 255, 255)
lockFPS.TextSize = 25
lockFPS.TextScaled = true
lockFPS.BorderSizePixel = 1
lockFPS.BorderMode = Enum.BorderMode.Inset
lockFPS:SetAttribute("id", 0)

lockFPSBtn.Parent = lockFPS
lockFPSBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
lockFPSBtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
lockFPSBtn.BorderSizePixel = 0
lockFPSBtn.Position = UDim2.new(1, 0, 0, 0)
lockFPSBtn.Size = UDim2.new(0.25, 0, 1, 0)
lockFPSBtn.Image = "rbxassetid://14652140686"

stopAtBeli.Name = "stopAtBeli"
stopAtBeli.Parent = container
stopAtBeli.BackgroundColor3 = Color3.fromRGB(85, 170, 0)
stopAtBeli.BorderColor3 = Color3.fromRGB(255, 255, 0)
stopAtBeli.BorderSizePixel = 1
stopAtBeli.BorderMode = Enum.BorderMode.Inset
stopAtBeli.Size = UDim2.new(0.6, 0, 0.1, 0)
stopAtBeli.Font = Enum.Font.Roboto
stopAtBeli.Text = "Stop At Beli:"
stopAtBeli.TextColor3 = Color3.fromRGB(255, 255, 255)
stopAtBeli.TextSize = 25
stopAtBeli:SetAttribute("id", 3)

stopAtBeliTextBox.Parent = stopAtBeli
stopAtBeliTextBox.BackgroundColor3 = Color3.fromRGB(165, 165, 82)
stopAtBeliTextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
stopAtBeliTextBox.BorderSizePixel = 0
stopAtBeliTextBox.Position = UDim2.new(1, 0, 0, 0)
stopAtBeliTextBox.Size = UDim2.new(0.65, 0, 1, 0)
stopAtBeliTextBox.Font = Enum.Font.Roboto
stopAtBeliTextBox.PlaceholderText = "-1 is no limit"
stopAtBeliTextBox.Text = "-1"
stopAtBeliTextBox.PlaceholderColor3 = Color3.fromRGB(0,0,255)
stopAtBeliTextBox.TextColor3 = Color3.fromRGB(0, 255, 127)
stopAtBeliTextBox.TextScaled = true
stopAtBeliTextBox.TextSize = 25
stopAtBeliTextBox.TextWrapped = true

sea1.Name = "sea1"
sea1.Parent = container
sea1.BackgroundColor3 = Color3.fromRGB(85, 170, 0)
sea1.BorderColor3 = Color3.fromRGB(255, 255, 0)
sea1.BorderSizePixel = 1
sea1.BorderMode = Enum.BorderMode.Inset
sea1.Size = UDim2.new(1, 0, 0.1, 0)
sea1.Font = Enum.Font.Roboto
sea1.Text = "Sea 1"
sea1.TextColor3 = Color3.fromRGB(255, 255, 255)
sea1.TextSize = 25
sea1:SetAttribute("id", 1)

sea1Btn.Parent = sea1
sea1Btn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
sea1Btn.BackgroundTransparency = 1
sea1Btn.BorderColor3 = Color3.fromRGB(0, 0, 0)
sea1Btn.BorderSizePixel = 0
sea1Btn.Size = UDim2.new(1, 0, 1, 0)
sea1Btn.Font = Enum.Font.SourceSans
sea1Btn.Text = ""
sea1Btn.TextColor3 = Color3.fromRGB(0, 0, 0)
sea1Btn.TextSize = 14

sea2.Name = "sea2"
sea2.Parent = container
sea2.BackgroundColor3 = Color3.fromRGB(85, 170, 0)
sea2.BorderColor3 = Color3.fromRGB(255, 255, 0)
sea2.Size = UDim2.new(1, 0, 0.1, 0)
sea2.Font = Enum.Font.Roboto
sea2.BorderSizePixel = 1
sea2.BorderMode = Enum.BorderMode.Inset
sea2.Text = "Sea 2"
sea2.TextColor3 = Color3.fromRGB(255, 255, 255)
sea2.TextSize = 25
sea2:SetAttribute("id", 1)

sea2Btn.Parent = sea2
sea2Btn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
sea2Btn.BackgroundTransparency = 1
sea2Btn.BorderColor3 = Color3.fromRGB(0, 0, 0)
sea2Btn.BorderSizePixel = 0
sea2Btn.Size = UDim2.new(1, 0, 1, 0)
sea2Btn.Font = Enum.Font.SourceSans
sea2Btn.Text = ""
sea2Btn.TextColor3 = Color3.fromRGB(0, 0, 0)
sea2Btn.TextSize = 14

sea3.Name = "sea3"
sea3.Parent = container
sea3.BackgroundColor3 = Color3.fromRGB(85, 170, 0)
sea3.BorderColor3 = Color3.fromRGB(255, 255, 0)
sea3.Size = UDim2.new(1, 0, 0.1, 0)
sea3.Font = Enum.Font.Roboto
sea3.Text = "Sea 3"
sea3.BorderSizePixel = 1
sea3.BorderMode = Enum.BorderMode.Inset
sea3.TextColor3 = Color3.fromRGB(255, 255, 255)
sea3.TextSize = 25
sea3:SetAttribute("id", 1)

sea3Btn.Parent = sea3
sea3Btn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
sea3Btn.BackgroundTransparency = 1.000
sea3Btn.BorderColor3 = Color3.fromRGB(0, 0, 0)
sea3Btn.BorderSizePixel = 0
sea3Btn.Size = UDim2.new(1, 0, 1, 0)
sea3Btn.Font = Enum.Font.Roboto
sea3Btn.Text = ""
sea3Btn.TextColor3 = Color3.fromRGB(0, 0, 0)
sea3Btn.TextSize = 14

hopServer.Name = "hopServer"
hopServer.Parent = container
hopServer.BackgroundColor3 = Color3.fromRGB(85, 170, 0)
hopServer.BorderColor3 = Color3.fromRGB(255, 255, 0)
hopServer.BorderSizePixel = 1
hopServer.BorderMode = Enum.BorderMode.Inset
hopServer.Size = UDim2.new(1, 0, 0.1, 0)
hopServer.Font = Enum.Font.Roboto
hopServer.Text = "Hop Server"
hopServer.TextColor3 = Color3.fromRGB(255, 255, 255)
hopServer.TextSize = 25
hopServer:SetAttribute("id", 1)

hopServerBtn.Parent = hopServer
hopServerBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
hopServerBtn.BackgroundTransparency = 1
hopServerBtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
hopServerBtn.BorderSizePixel = 0
hopServerBtn.Size = UDim2.new(1, 0, 1, 0)
hopServerBtn.Font = Enum.Font.SourceSans
hopServerBtn.Text = ""
hopServerBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
hopServerBtn.TextSize = 14

hopLowServer.Name = "hopLowServer"
hopLowServer.Parent = container
hopLowServer.BackgroundColor3 = Color3.fromRGB(85, 170, 0)
hopLowServer.BorderColor3 = Color3.fromRGB(255, 255, 0)
hopLowServer.Size = UDim2.new(1, 0, 0.1, 0)
hopLowServer.Font = Enum.Font.Roboto
hopLowServer.BorderSizePixel = 1
hopLowServer.BorderMode = Enum.BorderMode.Inset
hopLowServer.Text = "Hop Server(low player)"
hopLowServer.TextColor3 = Color3.fromRGB(255, 255, 255)
hopLowServer.TextSize = 25
hopLowServer:SetAttribute("id", 1)

hopLowServerBtn.Parent = hopLowServer
hopLowServerBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
hopLowServerBtn.BackgroundTransparency = 1
hopLowServerBtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
hopLowServerBtn.BorderSizePixel = 0
hopLowServerBtn.Size = UDim2.new(1, 0, 1, 0)
hopLowServerBtn.Font = Enum.Font.SourceSans
hopLowServerBtn.Text = ""
hopLowServerBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
hopLowServerBtn.TextSize = 14

changeToPirate.Name = "changeToPirate"
changeToPirate.Parent = container
changeToPirate.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
changeToPirate.BorderColor3 = Color3.fromRGB(255, 255, 0)
changeToPirate.Size = UDim2.new(1, 0, 0.1, 0)
changeToPirate.Font = Enum.Font.Roboto
changeToPirate.Text = "Change to Pirate"
changeToPirate.BorderSizePixel = 1
changeToPirate.BorderMode = Enum.BorderMode.Inset
changeToPirate.TextColor3 = Color3.fromRGB(255, 255, 255)
changeToPirate.TextSize = 25
changeToPirate:SetAttribute("id", 1)

changeToPirateBtn.Parent = changeToPirate
changeToPirateBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
changeToPirateBtn.BackgroundTransparency = 1
changeToPirateBtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
changeToPirateBtn.BorderSizePixel = 0
changeToPirateBtn.Size = UDim2.new(1, 0, 1, 0)
changeToPirateBtn.Font = Enum.Font.Roboto
changeToPirateBtn.Text = ""
changeToPirateBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
changeToPirateBtn.TextSize = 14

changeToMarine.Name = "changeToMarine"
changeToMarine.Parent = container
changeToMarine.BackgroundColor3 = Color3.fromRGB(0, 0, 140)
changeToMarine.BorderColor3 = Color3.fromRGB(255, 255, 0)
changeToMarine.Size = UDim2.new(1, 0, 0.1, 0)
changeToMarine.Font = Enum.Font.Roboto
changeToMarine.Text = "Change to Marine"
changeToMarine.BorderSizePixel = 1
changeToMarine.BorderMode = Enum.BorderMode.Inset
changeToMarine.TextColor3 = Color3.fromRGB(255, 255, 255)
changeToMarine.TextSize = 25
changeToMarine:SetAttribute("id", 1)

changeToMarineBtn.Parent = changeToMarine
changeToMarineBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
changeToMarineBtn.BackgroundTransparency = 1
changeToMarineBtn.BorderColor3 = Color3.fromRGB(69, 69, 206)
changeToMarineBtn.BorderSizePixel = 0
changeToMarineBtn.Size = UDim2.new(1, 0, 1, 0)
changeToMarineBtn.Font = Enum.Font.Roboto
changeToMarineBtn.Text = ""
changeToMarineBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
changeToMarineBtn.TextSize = 14


pagination.Name = "pagination"
pagination.Parent = background
pagination.Active = true
pagination.BackgroundColor3 = Color3.fromRGB(113, 170, 109)
pagination.BorderColor3 = Color3.fromRGB(0, 0, 0)
pagination.BorderSizePixel = 0
pagination.Position = UDim2.new(-0.5, 0, 0.1, 0)
pagination.Size = UDim2.new(0.5, 0, 0.9, 0)
pagination.CanvasSize = UDim2.new(0, 0, 0, 0)
pagination.ScrollBarThickness = 5

UIListLayout_2.Parent = pagination
UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder

main.Name = "main"
main.Parent = pagination
main.BackgroundColor3 = Color3.fromRGB(113, 170, 109)
main.BorderColor3 = Color3.fromRGB(255, 255, 127)
main.Size = UDim2.new(1, 0, 0.1, 0)
main.Selected = true
main.Font = Enum.Font.Roboto
main.Text = "Main"
main.TextColor3 = Color3.fromRGB(255, 255, 127)
main.TextSize = 30
main.BorderSizePixel = 1
main.BorderMode = Enum.BorderMode.Inset
main.Selected = true
main:SetAttribute("id", 0)

localPlayer.Name = "localPlayer"
localPlayer.Parent = pagination
localPlayer.BackgroundColor3 = Color3.fromRGB(113, 170, 109)
localPlayer.BorderColor3 = Color3.fromRGB(255, 255, 127)
localPlayer.Size = UDim2.new(1, 0, 0.1, 0)
localPlayer.Selected = true
localPlayer.Font = Enum.Font.Roboto
localPlayer.Text = "Local Player"
localPlayer.TextColor3 = Color3.fromRGB(255, 255, 127)
localPlayer.TextSize = 30
localPlayer.BorderSizePixel = 1
localPlayer.BorderMode = Enum.BorderMode.Inset
localPlayer:SetAttribute("id", 1)

misc.Name = "misc"
misc.Parent = pagination
misc.BackgroundColor3 = Color3.fromRGB(113, 170, 109)
misc.BorderColor3 = Color3.fromRGB(255, 255, 127)
misc.Size = UDim2.new(1, 0, 0.1, 0)
misc.Selected = true
misc.Font = Enum.Font.Roboto
misc.Text = "Misc"
misc.TextColor3 = Color3.fromRGB(255, 255, 127)
misc.TextSize = 30
misc.BorderSizePixel = 1
misc.BorderMode = Enum.BorderMode.Inset
misc:SetAttribute("id", 2)

setting.Name = "setting"
setting.Parent = pagination
setting.BackgroundColor3 = Color3.fromRGB(113, 170, 109)
setting.BorderColor3 = Color3.fromRGB(255, 255, 127)
setting.Size = UDim2.new(1, 0, 0.1, 0)
setting.Selected = true
setting.Font = Enum.Font.Roboto
setting.Text = "Setting"
setting.TextColor3 = Color3.fromRGB(255, 255, 127)
setting.TextSize = 30
setting.BorderSizePixel = 1
setting.BorderMode = Enum.BorderMode.Inset
setting:SetAttribute("id", 3)

backgroundNotifier.Name = "backgroundNotifier"
backgroundNotifier.Parent = HBFruit
backgroundNotifier.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
backgroundNotifier.BorderColor3 = Color3.fromRGB(0, 0, 0)
backgroundNotifier.BorderSizePixel = 0
backgroundNotifier.BackgroundTransparency = 1
backgroundNotifier.Position = UDim2.new(1, 0, 1, 0)
backgroundNotifier.Size = UDim2.new(0, 320, 0, 120)
backgroundNotifier.ZIndex = 9999
backgroundNotifier.Image = "rbxassetid://14677721503"
backgroundNotifier.Visible = false

content.Name = "content"
content.Parent = backgroundNotifier
content.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
content.BackgroundTransparency = 1
content.BorderColor3 = Color3.fromRGB(0, 0, 0)
content.BorderSizePixel = 0
content.Position = UDim2.new(0.1, 0, 0.4, 0)
content.Size = UDim2.new(0, 250, 0, 70)
content.Font = Enum.Font.Roboto
content.Text = "Nothing to say"
content.TextColor3 = Color3.fromRGB(0, 0, 0)
content.TextScaled = true
content.TextSize = 30
content.TextWrapped = true
content.TextYAlignment = Enum.TextYAlignment.Top





local Connection = {}
Connection.Pagination = {}
Connection.Pagination.Main = main.Activated:Connect(function()toggle(main)end)
Connection.Pagination.LocalPlayer = localPlayer.Activated:Connect(function()toggle(localPlayer)end)
Connection.Pagination.Misc = misc.Activated:Connect(function()toggle(misc)end)
Connection.Pagination.Setting = setting.Activated:Connect(function()toggle(setting)end)

Connection.Container = {}
Connection.Container.FarmChest = farmChestBtn.Activated:Connect(function()toggle(farmChestBtn)end)
Connection.Container.FastMode = fastModeBtn.Activated:Connect(function()toggle(fastModeBtn)end)
Connection.Container.LockFPS = lockFPSBtn.Activated:Connect(function()toggle(lockFPSBtn)end)
Connection.Container.StopAtBeli = stopAtBeliTextBox.FocusLost:Connect(function(enter)
	if (enter) then
		pcall(processStopAtBeli)
	end
end)
Connection.Container.TPToSea1 = sea1Btn.Activated:Connect(function()
	if (_G.HBFruit.Variable.IsReady) then
		_G.HBFruit.Function:TPToSea(1)
	end
end)
Connection.Container.TPToSea2 = sea2Btn.Activated:Connect(function()
	if (_G.HBFruit.Variable.IsReady) then
		_G.HBFruit.Function:TPToSea(2)
	end
end)
Connection.Container.TPToSea3 = sea3Btn.Activated:Connect(function()
	if (_G.HBFruit.Variable.IsReady) then
		_G.HBFruit.Function:TPToSea(3)
	end
end)
Connection.Container.HopServer = hopServerBtn.Activated:Connect(function()
	if (_G.HBFruit.Variable.IsReady) then
		_G.HBFruit.Function:HopServer(false)
	end
end)
Connection.Container.HopLowServer = hopLowServerBtn.Activated:Connect(function()
	if (_G.HBFruit.Variable.IsReady) then
		_G.HBFruit.Function:HopServer(true)
	end
end)
Connection.Container.changeToPirate = changeToPirateBtn.Activated:Connect(function()
	if (_G.HBFruit.Variable.IsReady) then
		_G.HBFruit.Function:ChangeSide(1)
	end
end)
Connection.Container.changeToMarine = changeToMarineBtn.Activated:Connect(function()
	if (_G.HBFruit.Variable.IsReady) then
		_G.HBFruit.Function:ChangeSide(2)
	end
end)



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

UserInputService.InputBegan:Connect(function(input)
	if (input.KeyCode == Enum.KeyCode.RightControl) then
		HBFruit.Enabled = not HBFruit.Enabled
	end
end)



function updateStatusUI()
	local selectedBtn = nil
	for _,v in pairs(pagination:GetChildren()) do
		if v:IsA("TextButton") then
			if v.Selected then
				v.BackgroundColor3 = Color3.fromRGB(81, 122, 78)
				v.TextColor3 = Color3.fromRGB(0, 0, 127)
				for _,v1 in pairs(container:GetChildren()) do
					if v1:IsA("TextLabel") then
						if v1:GetAttribute("id") == v:GetAttribute("id") then
							v1.Visible = true
						else
							v1.Visible = false
						end
					end
				end
			else
				v.BackgroundColor3 = Color3.fromRGB(113, 170, 109)
				v.TextColor3 = Color3.fromRGB(255, 255, 127)
			end
		end
	end
	for _,v in pairs(container:GetDescendants()) do
		if v:IsA("ImageButton") then
			if v.Selected then
				v.Image = "rbxassetid://14655571847"
			else
				v.Image = "rbxassetid://14652140686"
			end
		end
	end
end

function toggle(instance)
	if (instance:FindFirstAncestor("pagination")) then
		for _,v in pairs(pagination:GetChildren()) do
		if v:IsA("TextButton") then
			if v == instance then
				v.Selected = true
			else
				v.Selected = false
			end
		end
		end
	elseif (instance:FindFirstAncestor("container")) then
		if instance:IsA("TextButton") or instance:IsA("ImageButton") then
			instance.Selected = not instance.Selected
		end
	end
	if _G.HBFruit.Variable.IsReady then
		local paginationI = 0
		for _,v in pairs(pagination:GetChildren()) do
			if v:IsA("TextButton") then
				if (v.Selected) then
					paginationI = v:GetAttribute("id")
					break
				end
			end
		end
		_G.HBFruit.Function:saveDataUI(paginationI, farmChestBtn.Selected, fastModeBtn.Selected, lockFPSBtn.Selected, tonumber(stopAtBeliTextBox.Text))
	end
	updateStatusUI()
end

function notify(text)
	coroutine.resume(coroutine.create(function()
		pcall(function()
			repeat task.wait() until not notifierBusy
			notifierBusy = true
			content.Text = text
			backgroundNotifier.Visible = true
			for i=0, -80, -1 do
				backgroundNotifier.Position = UDim2.new(1,i*4, 1,-120)
				task.wait(0.005)
			end
			for i=0, 100 do
				backgroundNotifier.ImageTransparency = i/100
				content.TextTransparency = i/100
				task.wait(0.05)
			end

			backgroundNotifier.ImageTransparency = 0
			content.TextTransparency = 0
			backgroundNotifier.Position = UDim2.new(1,0, 1,0)
			backgroundNotifier.Visible = false	
			notifierBusy = false
		end)
	end))
end

function loadUIWithArgs(isPagination, farmChest, fastMode, lockFPS, stopBeliAt)
	local isPagination = isPagination or 0
	local farmChest = farmChest or false
	local fastMode = fastMode or false
	local lockFPS = lockFPS or false
	local stopBeliAt = stopBeliAt or "-1"
	for _,v in pairs(pagination:GetChildren()) do
		if (v:GetAttribute("id") == isPagination) then
			toggle(v)
		end
	end	

	if (farmChest) then
		toggle(farmChestBtn)
	end
	if (fastMode) then
		toggle(fastModeBtn)
	end
	if (lockFPS) then
		toggle(lockFPSBtn)
	end
	stopAtBeliTextBox.Text = tostring(stopBeliAt)
	updateStatusUI()
end

function processStopAtBeli()
	local beli = tonumber(stopAtBeliTextBox.Text)
	if not (beli) then
		notify("Can't identify this number!")
		stopAtBeliTextBox.Text = "-1"
	else
		if (beli < 0) then
			if( beli==-1) then
				notify("Stop farm beli at: no limit")
			else
				notify("Negative number is invalid! Try set into -1?")
				stopAtBeliTextBox.Text = "-1"
			end
		else
			notify("Stop farm beli at: "..beli)
		end
	end
	toggle()
end

--Hello
notify("HBFruit welcome!")
repeat task.wait() until _G.HBFruit.Variable.IsReady
loadUIWithArgs(_G.HBFruit.Function:loadDataUI())



return true
