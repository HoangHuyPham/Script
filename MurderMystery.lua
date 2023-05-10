repeat task.wait() until game:IsLoaded()
--ToolBox
local allVariable = {}
allVariable.Player = {}
allVariable.Player.LocalPlayer = game.Players.LocalPlayer or game:WaitForChild("Players").LocalPlayer
allVariable.Player.Character = allVariable.Player.LocalPlayer.CharacterAdded:Wait()
allVariable.Player.Humanoid =  allVariable.Player.Character:WaitForChild"Humanoid"
allVariable.Player.WalkSpeed = {}
allVariable.Player.WalkSpeed.First =  allVariable.Player.Humanoid.WalkSpeed or 0
allVariable.Player.WalkSpeed.Current =  allVariable.Player.WalkSpeed.First
allVariable.Player.JumpHeight = {}
allVariable.Player.JumpHeight.First = math.round(allVariable.Player.Humanoid.JumpHeight) or 0
allVariable.Player.JumpHeight.Current = allVariable.Player.JumpHeight.First
allVariable.Player.Position ={}
allVariable.Player.Position.CurrentY = 0
allVariable.Player.Murderer = {}
allVariable.Player.Murderer.Last = nil
allVariable.Player.Murderer.Current = nil
allVariable.Player.Sheriff = {}
allVariable.Player.Sheriff.Last = nil
allVariable.Player.Sheriff.Current = nil

allVariable.Environment = {}

allVariable.Environment.Part = {}
allVariable.Environment.Part.RoleSignal = {}
allVariable.Environment.Part.RoleSignal.Murderer = {} 
allVariable.Environment.Part.RoleSignal.Murderer.Instance = Instance.new("BillboardGui")
allVariable.Environment.Part.RoleSignal.Murderer.Name = "MurdererSignal"
allVariable.Environment.Part.RoleSignal.Murderer.AlwaysOnTop = true
allVariable.Environment.Part.RoleSignal.Murderer.Size = UDim2.new(1, 0, 1, 0)
allVariable.Environment.Part.RoleSignal.Murderer.ClipsDescendants = false
function allVariable.Environment.Part.RoleSignal.Murderer:Attach(player)
	self.Instance.Parent = player.Character:FindFirstChild"Head"
end
function allVariable.Environment.Part.RoleSignal.Murderer:Release(player)
	self.Instance.Parent = nil
end

allVariable.BillboardGuiFrame1 = Instance.new("Frame")
allVariable.BillboardGuiFrame1.Parent = allVariable.Environment.Part.RoleSignal.Murderer.Instance
allVariable.BillboardGuiFrame1.Name = "BillboardGuiFrame"
allVariable.BillboardGuiFrame1.Size = UDim2.new(4, 0,2, 0)
allVariable.BillboardGuiFrame1.Position = UDim2.new(-1.75, 0,-1.9, 0)
allVariable.BillboardGuiFrame1.BackgroundTransparency = 1

allVariable.BillboardGuiFrameTitle1 = Instance.new("TextLabel")
allVariable.BillboardGuiFrameTitle1.Parent = allVariable.BillboardGuiFrame1
allVariable.BillboardGuiFrameTitle1.Name = "BillboardGuiFrame"
allVariable.BillboardGuiFrameTitle1.Text = "MURDERER"
allVariable.BillboardGuiFrameTitle1.TextScaled = true
allVariable.BillboardGuiFrameTitle1.RichText = true
allVariable.BillboardGuiFrameTitle1.BackgroundTransparency = 1
allVariable.BillboardGuiFrameTitle1.TextColor3 = Color3.fromRGB(255, 0, 0)
allVariable.BillboardGuiFrameTitle1.TextYAlignment = Enum.TextYAlignment.Top
allVariable.BillboardGuiFrameTitle1.Size = UDim2.new(1, 0, 1, 0)


allVariable.Environment.Part.RoleSignal.Sheriff = {}
allVariable.Environment.Part.RoleSignal.Sheriff.Instance = Instance.new("BillboardGui")
allVariable.Environment.Part.RoleSignal.Sheriff.Name = "SheriffSignal"
allVariable.Environment.Part.RoleSignal.Sheriff.AlwaysOnTop = true
allVariable.Environment.Part.RoleSignal.Sheriff.Size = UDim2.new(1, 0, 1, 0)
allVariable.Environment.Part.RoleSignal.Sheriff.ClipsDescendants = false
function allVariable.Environment.Part.RoleSignal.Sheriff:Attach(player)
	self.Instance.Parent = player.Character:FindFirstChild"Head"
end
function allVariable.Environment.Part.RoleSignal.Sheriff:Release(player)
	self.Instance.Parent = nil
end


allVariable.BillboardGuiFrame2 = Instance.new("Frame")
allVariable.BillboardGuiFrame2.Parent = allVariable.Environment.Part.RoleSignal.Sheriff.Instance
allVariable.BillboardGuiFrame2.Name = "BillboardGuiFrame"
allVariable.BillboardGuiFrame2.Size = UDim2.new(4, 0,2, 0)
allVariable.BillboardGuiFrame2.Position = UDim2.new(-1.75, 0,-1.9, 0)
allVariable.BillboardGuiFrame2.BackgroundTransparency = 1

allVariable.BillboardGuiFrameTitle2 = Instance.new("TextLabel")
allVariable.BillboardGuiFrameTitle2.Parent = allVariable.BillboardGuiFrame2
allVariable.BillboardGuiFrameTitle2.Name = "BillboardGuiFrame"
allVariable.BillboardGuiFrameTitle2.Text = "SHERIFF"
allVariable.BillboardGuiFrameTitle2.TextScaled = true
allVariable.BillboardGuiFrameTitle2.RichText = true
allVariable.BillboardGuiFrameTitle2.BackgroundTransparency = 1
allVariable.BillboardGuiFrameTitle2.TextColor3 = Color3.fromRGB(0, 0, 255)
allVariable.BillboardGuiFrameTitle2.TextYAlignment = Enum.TextYAlignment.Top
allVariable.BillboardGuiFrameTitle2.Size = UDim2.new(1, 0, 1, 0)

allVariable.Environment.Part.InvisiblePart = Instance.new("Part")
allVariable.Environment.Part.InvisiblePart.Parent = workspace
allVariable.Environment.Part.InvisiblePart.Name = "InvisiblePart"
allVariable.Environment.Part.InvisiblePart.Size = Vector3.new(5,0.1,5)
allVariable.Environment.Part.InvisiblePart.Position = Vector3.new(0,0,0)
allVariable.Environment.Part.InvisiblePart.Anchored = true
allVariable.Environment.Part.InvisiblePart.CanCollide = false
allVariable.Environment.Part.InvisiblePart.Transparency = 1
function allVariable.Environment.Part:TeleportInvisiblePart()
	allVariable.Player.Position.CurrentY = allVariable.Player.Character.LeftFoot.Position.Y - 0.1
	allVariable.Environment.Part.InvisiblePart.CanCollide = true
	while allVariable.ToolBoxFrame_ScrollFrame_noClipBtn.Selected do
		allVariable.Environment.Part.InvisiblePart.Position = Vector3.new(allVariable.Player.Humanoid.RootPart.Position.X, allVariable.Player.Position.CurrentY,allVariable.Player.Humanoid.RootPart.Position.Z)
		task.wait(0.1)
	end
	allVariable.Environment.Part.InvisiblePart.CanCollide = false
end

allVariable.Environment.Part.DisabledPart = {}
function allVariable.Environment.Part.DisabledPart:Release()
	for k,v in pairs(self) do
		if (v.CanCollide ~= nil) then
			v.CanCollide = true
			table.remove(self, k)
		end
	end
end

allVariable.Connection ={}
----
allVariable.ToolBox = Instance.new("ScreenGui")
allVariable.ToolBox.Name = "ToolBox"
allVariable.ToolBox.Parent = game.Players.LocalPlayer.PlayerGui or game.Players.LocalPlayer:WaitForChild"PlayerGui"
allVariable.ToolBox.ZIndexBehavior = Enum.ZIndexBehavior.Global
--ToolBoxFrame
allVariable.ToolBoxFrame = Instance.new("Frame")
allVariable.ToolBoxFrame.Name = "ToolBoxFrame"
allVariable.ToolBoxFrame.Parent = allVariable.ToolBox
allVariable.ToolBoxFrame.ZIndex = 9999
allVariable.ToolBoxFrame.Position = UDim2.new(0.2, 0, 0, 0)
allVariable.ToolBoxFrame.Size = UDim2.new(0.4, 0, 0.5)
allVariable.ToolBoxFrame.BackgroundColor3 = Color3.fromRGB(0,0,0)
allVariable.ToolBoxFrame.Transparency = 1
allVariable.ToolBoxFrame.BorderSizePixel = 0
--ToolBoxFrame_showMenuBtn
allVariable.ToolBoxFrame_showMenuBtn = Instance.new("TextButton")
allVariable.ToolBoxFrame_showMenuBtn.Name = "ToolBoxFrame_showMenuBtn"
allVariable.ToolBoxFrame_showMenuBtn.Parent = allVariable.ToolBoxFrame
allVariable.ToolBoxFrame_showMenuBtn.Text = "Show"
allVariable.ToolBoxFrame_showMenuBtn.Position = UDim2.new(0.25, 0, 0, 0)
allVariable.ToolBoxFrame_showMenuBtn.Size = UDim2.new(0.3, 0, 0.2, 0)
allVariable.ToolBoxFrame_showMenuBtn.TextScaled = true
allVariable.ToolBoxFrame_showMenuBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
allVariable.ToolBoxFrame_showMenuBtn.Transparency = 0.5
allVariable.ToolBoxFrame_showMenuBtn.BorderSizePixel = 0
allVariable.ToolBoxFrame_showMenuBtn.Selected = false
--ToolBoxFrame_moveGuiBtn
allVariable.ToolBoxFrame_moveGuiBtn = Instance.new("TextButton")
allVariable.ToolBoxFrame_moveGuiBtn.Name = "ToolBoxFrame_moveGuiBtn"
allVariable.ToolBoxFrame_moveGuiBtn.Parent = allVariable.ToolBoxFrame
allVariable.ToolBoxFrame_moveGuiBtn.Text = ""
allVariable.ToolBoxFrame_moveGuiBtn.Position = UDim2.new(allVariable.ToolBoxFrame_showMenuBtn.Position.X.Scale + allVariable.ToolBoxFrame_showMenuBtn.Size.X.Scale, 0, 0, 0)
allVariable.ToolBoxFrame_moveGuiBtn.Size = UDim2.new(0.2, 0, 0.2, 0)
allVariable.ToolBoxFrame_moveGuiBtn.BackgroundColor3 = Color3.fromRGB(0,100,100)
allVariable.ToolBoxFrame_moveGuiBtn.Transparency = 0.5
allVariable.ToolBoxFrame_moveGuiBtn.BorderSizePixel = 0
--ToolBoxFrame_ScrollFrame
allVariable.ToolBoxFrame_ScrollFrame = Instance.new("ScrollingFrame")
allVariable.ToolBoxFrame_ScrollFrame.Name = "ToolBoxFrame_ScrollFrame"
allVariable.ToolBoxFrame_ScrollFrame.Parent = allVariable.ToolBoxFrame
allVariable.ToolBoxFrame_ScrollFrame.Position = UDim2.new(0, 0, allVariable.ToolBoxFrame_showMenuBtn.Size.Y.Scale, 0)
allVariable.ToolBoxFrame_ScrollFrame.Size = UDim2.new(1, 0, 1-allVariable.ToolBoxFrame_showMenuBtn.Size.Y.Scale, 0)
allVariable.ToolBoxFrame_ScrollFrame.Transparency = 0.5
allVariable.ToolBoxFrame_ScrollFrame.BorderSizePixel = 0
allVariable.ToolBoxFrame_ScrollFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
allVariable.ToolBoxFrame_ScrollFrame.CanvasSize = UDim2.new(0,0,0,0)
allVariable.ToolBoxFrame_ScrollFrame.ScrollBarThickness = 5
allVariable.ToolBoxFrame_ScrollFrame.Visible = false
Instance.new("UIListLayout").Parent = allVariable.ToolBoxFrame_ScrollFrame
allVariable.ToolBoxFrame_ScrollFrame.UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
--ToolBoxFrame_ScrollFrame_noClipBtn
allVariable.ToolBoxFrame_ScrollFrame_noClipBtn = Instance.new("TextButton")
allVariable.ToolBoxFrame_ScrollFrame_noClipBtn.Name = "ToolBoxFrame_ScrollFrame_noClipBtn"
allVariable.ToolBoxFrame_ScrollFrame_noClipBtn.Parent = allVariable.ToolBoxFrame_ScrollFrame
allVariable.ToolBoxFrame_ScrollFrame_noClipBtn.Text = "No clip: off"
allVariable.ToolBoxFrame_ScrollFrame_noClipBtn.Size = UDim2.new(1, -allVariable.ToolBoxFrame_ScrollFrame.ScrollBarThickness, 0.25, 0)
allVariable.ToolBoxFrame_ScrollFrame_noClipBtn.TextScaled = true
allVariable.ToolBoxFrame_ScrollFrame_noClipBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
allVariable.ToolBoxFrame_ScrollFrame_noClipBtn.BorderSizePixel = 0
allVariable.ToolBoxFrame_ScrollFrame_noClipBtn.Selected = false

--ToolBoxFrame_ScrollFrame_observationBtn
allVariable.ToolBoxFrame_ScrollFrame_observationBtn = Instance.new("TextButton")
allVariable.ToolBoxFrame_ScrollFrame_observationBtn.Name = "ToolBoxFrame_ScrollFrame_observationBtn"
allVariable.ToolBoxFrame_ScrollFrame_observationBtn.Parent = allVariable.ToolBoxFrame_ScrollFrame
allVariable.ToolBoxFrame_ScrollFrame_observationBtn.Text = "Obsavation: off"
allVariable.ToolBoxFrame_ScrollFrame_observationBtn.Size = UDim2.new(1, -allVariable.ToolBoxFrame_ScrollFrame.ScrollBarThickness, 0.25, 0)
allVariable.ToolBoxFrame_ScrollFrame_observationBtn.TextScaled = true
allVariable.ToolBoxFrame_ScrollFrame_observationBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
allVariable.ToolBoxFrame_ScrollFrame_observationBtn.BorderSizePixel = 0
allVariable.ToolBoxFrame_ScrollFrame_observationBtn.Selected = false

--ToolBoxFrame_ScrollFrame_displayRoleBtn
allVariable.ToolBoxFrame_ScrollFrame_displayRoleBtn = Instance.new("TextButton")
allVariable.ToolBoxFrame_ScrollFrame_displayRoleBtn.Name = "ToolBoxFrame_ScrollFrame_displayRoleBtn"
allVariable.ToolBoxFrame_ScrollFrame_displayRoleBtn.Parent = allVariable.ToolBoxFrame_ScrollFrame
allVariable.ToolBoxFrame_ScrollFrame_displayRoleBtn.Text = "Display role: off"
allVariable.ToolBoxFrame_ScrollFrame_displayRoleBtn.Size = UDim2.new(1, -allVariable.ToolBoxFrame_ScrollFrame.ScrollBarThickness, 0.25, 0)
allVariable.ToolBoxFrame_ScrollFrame_displayRoleBtn.TextScaled = true
allVariable.ToolBoxFrame_ScrollFrame_displayRoleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
allVariable.ToolBoxFrame_ScrollFrame_displayRoleBtn.BorderSizePixel = 0
allVariable.ToolBoxFrame_ScrollFrame_displayRoleBtn.Selected = false

--ToolBoxFrame_ScrollFrame_speedControlBtnFrame
allVariable.ToolBoxFrame_ScrollFrame_speedControlBtnFrame = Instance.new("Frame")
allVariable.ToolBoxFrame_ScrollFrame_speedControlBtnFrame.Name = "ToolBoxFrame_ScrollFrame_speedControlBtnFrame"
allVariable.ToolBoxFrame_ScrollFrame_speedControlBtnFrame.Parent = allVariable.ToolBoxFrame_ScrollFrame
allVariable.ToolBoxFrame_ScrollFrame_speedControlBtnFrame.Size = UDim2.new(1, -allVariable.ToolBoxFrame_ScrollFrame.ScrollBarThickness, 0.25, 0)
allVariable.ToolBoxFrame_ScrollFrame_speedControlBtnFrame.BorderSizePixel = 0
allVariable.ToolBoxFrame_ScrollFrame_speedControlBtnFrame.Transparency = 1
local ui_layout = Instance.new("UIListLayout")
ui_layout.FillDirection = Enum.FillDirection.Horizontal
ui_layout.Parent = allVariable.ToolBoxFrame_ScrollFrame_speedControlBtnFrame

--ToolBoxFrame_ScrollFrame_decreaseSpeedBtn
allVariable.ToolBoxFrame_ScrollFrame_decreaseSpeedBtn = Instance.new("TextButton")
allVariable.ToolBoxFrame_ScrollFrame_decreaseSpeedBtn.Name = "ToolBoxFrame_ScrollFrame_decreaseSpeedBtn"
allVariable.ToolBoxFrame_ScrollFrame_decreaseSpeedBtn.Parent = allVariable.ToolBoxFrame_ScrollFrame_speedControlBtnFrame
allVariable.ToolBoxFrame_ScrollFrame_decreaseSpeedBtn.Text = "<<<"
allVariable.ToolBoxFrame_ScrollFrame_decreaseSpeedBtn.Size = UDim2.new(1/3, 0, 1, 0)
allVariable.ToolBoxFrame_ScrollFrame_decreaseSpeedBtn.TextScaled = true
allVariable.ToolBoxFrame_ScrollFrame_decreaseSpeedBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
allVariable.ToolBoxFrame_ScrollFrame_decreaseSpeedBtn.BorderSizePixel = 0
allVariable.ToolBoxFrame_ScrollFrame_decreaseSpeedBtn.Selected = false

--ToolBoxFrame_ScrollFrame_defaultSpeedBtn
allVariable.ToolBoxFrame_ScrollFrame_defaultSpeedBtn = Instance.new("TextButton")
allVariable.ToolBoxFrame_ScrollFrame_defaultSpeedBtn.Name = "ToolBoxFrame_ScrollFrame_defaultSpeedBtn"
allVariable.ToolBoxFrame_ScrollFrame_defaultSpeedBtn.Parent = allVariable.ToolBoxFrame_ScrollFrame_speedControlBtnFrame
allVariable.ToolBoxFrame_ScrollFrame_defaultSpeedBtn.Text = "Walk speed: "..allVariable.Player.WalkSpeed.First
allVariable.ToolBoxFrame_ScrollFrame_defaultSpeedBtn.Size = UDim2.new(1/3, 0, 1, 0)
allVariable.ToolBoxFrame_ScrollFrame_defaultSpeedBtn.TextScaled = true
allVariable.ToolBoxFrame_ScrollFrame_defaultSpeedBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
allVariable.ToolBoxFrame_ScrollFrame_defaultSpeedBtn.BorderSizePixel = 0
allVariable.ToolBoxFrame_ScrollFrame_defaultSpeedBtn.Selected = false

--ToolBoxFrame_ScrollFrame_increaseSpeedBtn
allVariable.ToolBoxFrame_ScrollFrame_increaseSpeedBtn = Instance.new("TextButton")
allVariable.ToolBoxFrame_ScrollFrame_increaseSpeedBtn.Name = "ToolBoxFrame_ScrollFrame_increaseSpeedBtn"
allVariable.ToolBoxFrame_ScrollFrame_increaseSpeedBtn.Parent = allVariable.ToolBoxFrame_ScrollFrame_speedControlBtnFrame
allVariable.ToolBoxFrame_ScrollFrame_increaseSpeedBtn.Text = ">>>"
allVariable.ToolBoxFrame_ScrollFrame_increaseSpeedBtn.Size = UDim2.new(1/3, 0, 1, 0)
allVariable.ToolBoxFrame_ScrollFrame_increaseSpeedBtn.TextScaled = true
allVariable.ToolBoxFrame_ScrollFrame_increaseSpeedBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
allVariable.ToolBoxFrame_ScrollFrame_increaseSpeedBtn.BorderSizePixel = 0
allVariable.ToolBoxFrame_ScrollFrame_increaseSpeedBtn.Selected = false

--ToolBoxFrame_ScrollFrame_jumpHeightControlBtnFrame
allVariable.ToolBoxFrame_ScrollFrame_jumpHeightControlBtnFrame = Instance.new("Frame")
allVariable.ToolBoxFrame_ScrollFrame_jumpHeightControlBtnFrame.Name = "ToolBoxFrame_ScrollFrame_jumpHeightControlBtnFrame"
allVariable.ToolBoxFrame_ScrollFrame_jumpHeightControlBtnFrame.Parent = allVariable.ToolBoxFrame_ScrollFrame
allVariable.ToolBoxFrame_ScrollFrame_jumpHeightControlBtnFrame.Size = UDim2.new(1, -allVariable.ToolBoxFrame_ScrollFrame.ScrollBarThickness, 0.25, 0)
allVariable.ToolBoxFrame_ScrollFrame_jumpHeightControlBtnFrame.BorderSizePixel = 0
allVariable.ToolBoxFrame_ScrollFrame_jumpHeightControlBtnFrame.Transparency = 1
local ui_layout = Instance.new("UIListLayout")
ui_layout.FillDirection = Enum.FillDirection.Horizontal
ui_layout.Parent = allVariable.ToolBoxFrame_ScrollFrame_jumpHeightControlBtnFrame

--ToolBoxFrame_ScrollFrame_decreaseJumpHeightBtn
allVariable.ToolBoxFrame_ScrollFrame_decreaseJumpHeightBtn = Instance.new("TextButton")
allVariable.ToolBoxFrame_ScrollFrame_decreaseJumpHeightBtn.Name = "ToolBoxFrame_ScrollFrame_decreaseJumpHeightBtn"
allVariable.ToolBoxFrame_ScrollFrame_decreaseJumpHeightBtn.Parent = allVariable.ToolBoxFrame_ScrollFrame_jumpHeightControlBtnFrame
allVariable.ToolBoxFrame_ScrollFrame_decreaseJumpHeightBtn.Text = "<<<"
allVariable.ToolBoxFrame_ScrollFrame_decreaseJumpHeightBtn.Size = UDim2.new(1/3, 0, 1, 0)
allVariable.ToolBoxFrame_ScrollFrame_decreaseJumpHeightBtn.TextScaled = true
allVariable.ToolBoxFrame_ScrollFrame_decreaseJumpHeightBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
allVariable.ToolBoxFrame_ScrollFrame_decreaseJumpHeightBtn.BorderSizePixel = 0
allVariable.ToolBoxFrame_ScrollFrame_decreaseJumpHeightBtn.Selected = false

--ToolBoxFrame_ScrollFrame_defaultJumpHeightBtn
allVariable.ToolBoxFrame_ScrollFrame_defaultJumpHeightBtn = Instance.new("TextButton")
allVariable.ToolBoxFrame_ScrollFrame_defaultJumpHeightBtn.Name = "ToolBoxFrame_ScrollFrame_defaultJumpHeightBtn"
allVariable.ToolBoxFrame_ScrollFrame_defaultJumpHeightBtn.Parent = allVariable.ToolBoxFrame_ScrollFrame_jumpHeightControlBtnFrame
allVariable.ToolBoxFrame_ScrollFrame_defaultJumpHeightBtn.Text = "Jump height: "..allVariable.Player.JumpHeight.First
allVariable.ToolBoxFrame_ScrollFrame_defaultJumpHeightBtn.Size = UDim2.new(1/3, 0, 1, 0)
allVariable.ToolBoxFrame_ScrollFrame_defaultJumpHeightBtn.TextScaled = true
allVariable.ToolBoxFrame_ScrollFrame_defaultJumpHeightBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
allVariable.ToolBoxFrame_ScrollFrame_defaultJumpHeightBtn.BorderSizePixel = 0
allVariable.ToolBoxFrame_ScrollFrame_defaultJumpHeightBtn.Selected = false

--ToolBoxFrame_ScrollFrame_increaseJumpHeightBtn
allVariable.ToolBoxFrame_ScrollFrame_increaseJumpHeightBtn = Instance.new("TextButton")
allVariable.ToolBoxFrame_ScrollFrame_increaseJumpHeightBtn.Name = "ToolBoxFrame_ScrollFrame_increaseJumpHeightBtn"
allVariable.ToolBoxFrame_ScrollFrame_increaseJumpHeightBtn.Parent = allVariable.ToolBoxFrame_ScrollFrame_jumpHeightControlBtnFrame
allVariable.ToolBoxFrame_ScrollFrame_increaseJumpHeightBtn.Text = ">>>"
allVariable.ToolBoxFrame_ScrollFrame_increaseJumpHeightBtn.Size = UDim2.new(1/3, 0, 1, 0)
allVariable.ToolBoxFrame_ScrollFrame_increaseJumpHeightBtn.TextScaled = true
allVariable.ToolBoxFrame_ScrollFrame_increaseJumpHeightBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
allVariable.ToolBoxFrame_ScrollFrame_increaseJumpHeightBtn.BorderSizePixel = 0
allVariable.ToolBoxFrame_ScrollFrame_increaseJumpHeightBtn.Selected = false



--variableMoveGui
local UserInputService = game:GetService("UserInputService")
local gui = allVariable.ToolBoxFrame
local dragging = nil
local dragInput = nil
local dragStart = nil
local startPos = nil

function allVariable:ToolBoxFrame_moveGuiBtnUpdate(input)
	local delta = input.Position - dragStart
	gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

function allVariable:NoClip(part)
	if (allVariable.ToolBoxFrame_ScrollFrame_noClipBtn.Selected) then
		if not (table.find(allVariable.Environment.Part.DisabledPart, part, 1)) then
			part.CanCollide = false
			table.insert(allVariable.Environment.Part.DisabledPart, part)
		end	
	end
end

function allVariable:Observation(length)
	while (allVariable.ToolBoxFrame_ScrollFrame_observationBtn.Selected) do
		local RayCastConfig = RaycastParams.new()
		RayCastConfig.FilterDescendantsInstances = allVariable.Player.Character:GetChildren()
		length = length or 50
		local RayCast = workspace:Raycast(allVariable.Player.Humanoid.RootPart.CFrame.Position, allVariable.Player.Humanoid.RootPart.CFrame.LookVector * length, RayCastConfig)
		local CurrentTrans = 0
		if (RayCast ~= nil and RayCast.Instance ~= nil) then
			if (RayCast.Instance.Transparency ~= nil)  then
				CurrentTrans = RayCast.Instance.Transparency
				RayCast.Instance.Transparency = 0.7
				task.wait(0.5)
				RayCast.Instance.Transparency = CurrentTrans
			end
		else
			task.wait(0.1)
		end
		
	end
end

function allVariable:DisplayRole()
	while (allVariable.ToolBoxFrame_ScrollFrame_displayRoleBtn.Selected) do
		local murderer = allVariable.Player.Murderer.Current or allVariable.Player.Murderer.Last
		local sheriff = allVariable.Player.Sheriff.Current or allVariable.Player.Sheriff.Last 
		allVariable.Environment.Part.RoleSignal.Murderer:Attach(murderer)
		allVariable.Environment.Part.RoleSignal.Sheriff:Attach(sheriff)
		task.wait(0.3)
	end
end

function allVariable:checkRoleScheduler()
	for _,v in pairs(game.Players:GetChildren()) do
		for _,v1 in pairs(v.Character:GetChildren()) do
			local str = string.upper(v1.Name)
			if (str == 'KNIFE') then
				allVariable.Player.Murderer.Current = v
				if (allVariable.Player.Murderer.Current ~= allVariable.Player.Murderer.Last and allVariable.Player.Murderer.Current ~= nil) then
					allVariable.Player.Murderer.Last = allVariable.Player.Murderer.Current
				end
			elseif (str == 'GUN') then
				allVariable.Player.Sheriff.Current = v
				if (allVariable.Player.Sheriff.Current ~= allVariable.Player.Sheriff.Last and allVariable.Player.Sheriff.Current ~= nil) then
					allVariable.Player.Sheriff.Last = allVariable.Player.Sheriff.Current
				end
			end
		end
	end
	task.wait(0.1)
end


function allVariable:Release()
	table.clear(self)
end


--Connection
allVariable.Connection.ToolBoxFrame_showMenuBtnC1 = allVariable.ToolBoxFrame_showMenuBtn.Activated:Connect(
	function()
		allVariable.ToolBoxFrame_showMenuBtn.Selected = not allVariable.ToolBoxFrame_showMenuBtn.Selected
		if allVariable.ToolBoxFrame_showMenuBtn.Selected then
			allVariable.ToolBoxFrame_showMenuBtn.Text = "Hide"
			allVariable.ToolBoxFrame_ScrollFrame.Visible = true
		else
			allVariable.ToolBoxFrame_showMenuBtn.Text = "Show"
			allVariable.ToolBoxFrame_ScrollFrame.Visible = false
		end
	end
)
allVariable.Connection.ToolBoxFrame_moveGuiBtnC1 = allVariable.ToolBoxFrame_moveGuiBtn.InputBegan:Connect(
	function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position
			input.Changed:Connect(
				function()
					if input.UserInputState == Enum.UserInputState.End then
						dragging = false
					end
				end
			)
		end
	end
)

allVariable.Connection.ToolBoxFrame_moveGuiBtnC2 = allVariable.ToolBoxFrame_moveGuiBtn.InputChanged:Connect(
	function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end
)

allVariable.Connection.ToolBoxFrame_moveGuiBtnC3 = UserInputService.InputChanged:Connect(
	function(input)
		if input == dragInput and dragging then
			allVariable:ToolBoxFrame_moveGuiBtnUpdate(input)
		end
	end
)

allVariable.Connection.ToolBoxFrame_ScrollFrame_noClipBtnC1 = allVariable.ToolBoxFrame_ScrollFrame_noClipBtn.Activated:Connect(
	function()
		allVariable.ToolBoxFrame_ScrollFrame_noClipBtn.Selected = not allVariable.ToolBoxFrame_ScrollFrame_noClipBtn.Selected
		if allVariable.ToolBoxFrame_ScrollFrame_noClipBtn.Selected then
			allVariable.ToolBoxFrame_ScrollFrame_noClipBtn.Text = "No clip: on"
			allVariable.ToolBoxFrame_ScrollFrame_noClipBtn.TextColor3 = Color3.fromRGB(0, 255, 0)
			allVariable.Environment.Part:TeleportInvisiblePart()
		else
			allVariable.ToolBoxFrame_ScrollFrame_noClipBtn.Text = "No clip: off"
			allVariable.ToolBoxFrame_ScrollFrame_noClipBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
			allVariable.Environment.Part.DisabledPart:Release()
		end
	end
)

allVariable.Connection.ToolBoxFrame_ScrollFrame_observationBtnC1 = allVariable.ToolBoxFrame_ScrollFrame_observationBtn.Activated:Connect(
	function()
		allVariable.ToolBoxFrame_ScrollFrame_observationBtn.Selected = not allVariable.ToolBoxFrame_ScrollFrame_observationBtn.Selected
		if allVariable.ToolBoxFrame_ScrollFrame_observationBtn.Selected then
			allVariable.ToolBoxFrame_ScrollFrame_observationBtn.Text = "Observation: on"
			allVariable.ToolBoxFrame_ScrollFrame_observationBtn.TextColor3 = Color3.fromRGB(0, 255, 0)
			allVariable:Observation()
		else
			allVariable.ToolBoxFrame_ScrollFrame_observationBtn.Text = "Observation: off"
			allVariable.ToolBoxFrame_ScrollFrame_observationBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
		end
	end
)

allVariable.Connection.ToolBoxFrame_ScrollFrame_displayRoleBtnC1 = allVariable.ToolBoxFrame_ScrollFrame_displayRoleBtn.Activated:Connect(
	function()
		allVariable.ToolBoxFrame_ScrollFrame_displayRoleBtn.Selected = not allVariable.ToolBoxFrame_ScrollFrame_displayRoleBtn.Selected
		if allVariable.ToolBoxFrame_ScrollFrame_displayRoleBtn.Selected then
			allVariable.ToolBoxFrame_ScrollFrame_displayRoleBtn.Text = "Display role: on"
			allVariable.ToolBoxFrame_ScrollFrame_displayRoleBtn.TextColor3 = Color3.fromRGB(0, 255, 0)
			allVariable:DisplayRole()
		else
			allVariable.ToolBoxFrame_ScrollFrame_displayRoleBtn.Text = "Display role: off"
			allVariable.ToolBoxFrame_ScrollFrame_displayRoleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
			allVariable.Environment.Part.RoleSignal.Murderer:Release()
			allVariable.Environment.Part.RoleSignal.Sheriff:Release()
		end
	end
)

allVariable.Connection.ToolBoxFrame_ScrollFrame_decreaseSpeedBtnC1 = allVariable.ToolBoxFrame_ScrollFrame_decreaseSpeedBtn.Activated:Connect(
	function()
		allVariable.Player.WalkSpeed.Current = allVariable.Player.WalkSpeed.Current - 1
		allVariable.ToolBoxFrame_ScrollFrame_defaultSpeedBtn.Text = "Walk speed: "..allVariable.Player.WalkSpeed.Current
		allVariable.Player.Humanoid.WalkSpeed = allVariable.Player.WalkSpeed.Current
	end
)

allVariable.Connection.ToolBoxFrame_ScrollFrame_increaseSpeedBtnC1 = allVariable.ToolBoxFrame_ScrollFrame_increaseSpeedBtn.Activated:Connect(
	function()
		allVariable.Player.WalkSpeed.Current = allVariable.Player.WalkSpeed.Current + 1
		allVariable.ToolBoxFrame_ScrollFrame_defaultSpeedBtn.Text = "Walk speed: "..allVariable.Player.WalkSpeed.Current
		allVariable.Player.Humanoid.WalkSpeed = allVariable.Player.WalkSpeed.Current
	end
)

allVariable.Connection.ToolBoxFrame_ScrollFrame_defaultSpeedBtnC1 = allVariable.ToolBoxFrame_ScrollFrame_defaultSpeedBtn.Activated:Connect(
	function()
		allVariable.Player.WalkSpeed.Current = allVariable.Player.WalkSpeed.First
		allVariable.ToolBoxFrame_ScrollFrame_defaultSpeedBtn.Text = "Walk speed: "..allVariable.Player.WalkSpeed.Current
		allVariable.Player.Humanoid.WalkSpeed = allVariable.Player.WalkSpeed.Current
	end
)

allVariable.Connection.ToolBoxFrame_ScrollFrame_decreaseJumpHeightBtnC1 = allVariable.ToolBoxFrame_ScrollFrame_decreaseJumpHeightBtn.Activated:Connect(
	function()
		allVariable.Player.JumpHeight.Current = allVariable.Player.JumpHeight.Current - 1
		allVariable.ToolBoxFrame_ScrollFrame_defaultJumpHeightBtn.Text = "Jump height: "..allVariable.Player.JumpHeight.Current
		allVariable.Player.Humanoid.JumpHeight = allVariable.Player.JumpHeight.Current
	end
)

allVariable.Connection.ToolBoxFrame_ScrollFrame_increaseJumpHeightBtnC1 = allVariable.ToolBoxFrame_ScrollFrame_increaseJumpHeightBtn.Activated:Connect(
	function()
		allVariable.Player.JumpHeight.Current = allVariable.Player.JumpHeight.Current + 1
		allVariable.ToolBoxFrame_ScrollFrame_defaultJumpHeightBtn.Text = "Jump height: "..allVariable.Player.JumpHeight.Current
		allVariable.Player.Humanoid.JumpHeight = allVariable.Player.JumpHeight.Current
	end
)

allVariable.Connection.ToolBoxFrame_ScrollFrame_defaultJumpHeightBtnC1 = allVariable.ToolBoxFrame_ScrollFrame_defaultJumpHeightBtn.Activated:Connect(
	function()
		allVariable.Player.JumpHeight.Current = allVariable.Player.JumpHeight.First
		allVariable.ToolBoxFrame_ScrollFrame_defaultJumpHeightBtn.Text = "Jump height: "..allVariable.Player.JumpHeight.Current
		allVariable.Player.Humanoid.JumpHeight = allVariable.Player.JumpHeight.Current
	end
)

allVariable.Connection.TouchedPartDetector = allVariable.Player.Humanoid.Touched:Connect(
	function(input, part)
			if (part.Name == "UpperTorso" or part.Name == "LowerTorso" or part.Name == "Head") then
				allVariable:NoClip(input)
			end
	end
)

allVariable.Connection.JumpingNoclipDetector = allVariable.Player.Humanoid.Jumping:Connect(
	function()
		if (allVariable.ToolBoxFrame_ScrollFrame_noClipBtn.Selected) then
			allVariable.Player.Position.CurrentY += 1
		end
	end
)

allVariable.Connection.RemoveCharacterDetector = game.Players.LocalPlayer.CharacterAdded:Connect(
	function()
		allVariable.Connection:Release()
		allVariable:Release()
		task.wait(5)
		loadstring(game:HttpGet"https://raw.githubusercontent.com/HoangHuyPham/Script/master/MurderMystery.lua")()
	end
)

function allVariable.Connection:Release()
	for _,v in pairs(self) do
		if (typeof(v) == "RBXScriptConnection") then
			v:Disconnect()
		end
	end
end

allVariable:checkRoleScheduler()



