repeat task.wait() until game:IsLoaded()

--ToolBox
local allVariable = {}
allVariable.Player = {}
allVariable.Player.LocalPlayer = game.Players.LocalPlayer or game:WaitForChild("Players").LocalPlayer
allVariable.Player.Character = allVariable.Player.LocalPlayer.Character or allVariable.Player.LocalPlayer.CharacterAdded:Wait()
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
allVariable.Player.Hero = {}
allVariable.Player.Hero.Last = nil
allVariable.Player.Hero.Current = nil

allVariable.Environment = {}

allVariable.Environment.Part = {}
allVariable.Environment.Part.RoleSignal = {}
allVariable.Environment.Part.RoleSignal.Murderer = {}
allVariable.Environment.Part.RoleSignal.Murderer.Instance = Instance.new("BillboardGui")
allVariable.Environment.Part.RoleSignal.Murderer.Instance.Name = "MurdererSignal"
allVariable.Environment.Part.RoleSignal.Murderer.Instance.AlwaysOnTop = true
allVariable.Environment.Part.RoleSignal.Murderer.Instance.Size = UDim2.new(1, 0, 1, 0)
allVariable.Environment.Part.RoleSignal.Murderer.Instance.ClipsDescendants = false
function allVariable.Environment.Part.RoleSignal.Murderer:Attach(player)
	self.Instance.Parent = player.Character:FindFirstChild"Head" or player.Character:FindFirstChild"Torso"
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
allVariable.Environment.Part.RoleSignal.Sheriff.Instance.Name = "SheriffSignal"
allVariable.Environment.Part.RoleSignal.Sheriff.Instance.AlwaysOnTop = true
allVariable.Environment.Part.RoleSignal.Sheriff.Instance.Size = UDim2.new(1, 0, 1, 0)
allVariable.Environment.Part.RoleSignal.Sheriff.Instance.ClipsDescendants = false
function allVariable.Environment.Part.RoleSignal.Sheriff:Attach(player)
	self.Instance.Parent = player.Character:FindFirstChild"Head" or player.Character:FindFirstChild"Torso"
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

allVariable.Environment.Part.RoleSignal.Hero = {}
allVariable.Environment.Part.RoleSignal.Hero.Instance = Instance.new("BillboardGui")
allVariable.Environment.Part.RoleSignal.Hero.Instance.Name = "HeroSignal"
allVariable.Environment.Part.RoleSignal.Hero.Instance.AlwaysOnTop = true
allVariable.Environment.Part.RoleSignal.Hero.Instance.Size = UDim2.new(1, 2, 1, 1)
allVariable.Environment.Part.RoleSignal.Hero.Instance.ClipsDescendants = false
function allVariable.Environment.Part.RoleSignal.Hero:Attach(gunPart)
	self.Instance.Parent = gunPart
end
function allVariable.Environment.Part.RoleSignal.Hero:Release(gunPart)
	self.Instance.Parent = nil
end


allVariable.BillboardGuiFrame3 = Instance.new("Frame")
allVariable.BillboardGuiFrame3.Parent = allVariable.Environment.Part.RoleSignal.Hero.Instance
allVariable.BillboardGuiFrame3.Name = "BillboardGuiFrame"
allVariable.BillboardGuiFrame3.Size = UDim2.new(4, 2,2, 1)
allVariable.BillboardGuiFrame3.Position = UDim2.new(-1.75, 0,-1.9, 0)
allVariable.BillboardGuiFrame3.BackgroundTransparency = 1

allVariable.BillboardGuiFrameTitle3 = Instance.new("TextLabel")
allVariable.BillboardGuiFrameTitle3.Parent = allVariable.BillboardGuiFrame3
allVariable.BillboardGuiFrameTitle3.Name = "BillboardGuiFrame"
allVariable.BillboardGuiFrameTitle3.Text = "Drop gun"
allVariable.BillboardGuiFrameTitle3.TextScaled = true
allVariable.BillboardGuiFrameTitle3.RichText = true
allVariable.BillboardGuiFrameTitle3.BackgroundTransparency = 1
allVariable.BillboardGuiFrameTitle3.TextColor3 = Color3.fromRGB(255, 255, 0)
allVariable.BillboardGuiFrameTitle3.TextYAlignment = Enum.TextYAlignment.Top
allVariable.BillboardGuiFrameTitle3.Size = UDim2.new(1, 0, 1, 0)



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
allVariable.ToolBoxFrame_ScrollFrame_displayRoleBtn.Text = "Display role & dropped gun: off"
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
allVariable.UserInputService = game:GetService("UserInputService")
allVariable.gui = allVariable.ToolBoxFrame
allVariable.dragging = nil
allVariable.dragInput = nil
allVariable.dragStart = nil
allVariable.startPos = nil

function allVariable:ToolBoxFrame_moveGuiBtnUpdate(input)
	local delta = input.Position - allVariable.dragStart
	allVariable.gui.Position = UDim2.new(allVariable.startPos.X.Scale, allVariable.startPos.X.Offset + delta.X, allVariable.startPos.Y.Scale, allVariable.startPos.Y.Offset + delta.Y)
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
		length = length or 100
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
		local gunPart = allVariable.Player.Hero.Current or allVariable.Player.Hero.Last
		if (murderer) then
			allVariable.Environment.Part.RoleSignal.Murderer:Attach(murderer)
		elseif (sheriff) then
			allVariable.Environment.Part.RoleSignal.Sheriff:Attach(sheriff)
		elseif (gunPart) then
			allVariable.Environment.Part.RoleSignal.Hero:Attach(gunPart)
		end
		task.wait(0.3)
	end
end

function allVariable:checkRoleScheduler()
	while true do
		local Players = game.Players or game:GetService("Players")
		local Workspace = game.Workspace or game:GetService("Workspace")
		local PlayersChild = Players:GetChildren()
		local WorkspaceChild = Workspace:GetChildren()
		for _,v in pairs(PlayersChild) do
			if (not v.Character) then 
				continue
			end
			local CharacterChild = v.Character:GetChildren()
			for _,v1 in pairs(CharacterChild) do
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

		for k, v in pairs(WorkspaceChild) do
			local str = string.upper(v.Name)
			if (str == 'GUNDROP') then
				allVariable.Player.Hero.Current = v
				if (allVariable.Player.Hero.Current ~= allVariable.Player.Hero.Last and allVariable.Player.Hero.Current ~= nil) then
					allVariable.Player.Hero.Last = allVariable.Player.Hero.Current
				end
			end
		end


		task.wait(0.1)
	end
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
			allVariable.dragging = true
			allVariable.dragStart = input.Position
			allVariable.startPos = allVariable.gui.Position
			input.Changed:Connect(
				function()
					if input.UserInputState == Enum.UserInputState.End then
						allVariable.dragging = false
					end
				end
			)
		end
	end
)

allVariable.Connection.ToolBoxFrame_moveGuiBtnC2 = allVariable.ToolBoxFrame_moveGuiBtn.InputChanged:Connect(
	function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			allVariable.dragInput = input
		end
	end
)

allVariable.Connection.ToolBoxFrame_moveGuiBtnC3 = allVariable.UserInputService.InputChanged:Connect(
	function(input)
		if input == allVariable.dragInput and allVariable.dragging then
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
			allVariable.ToolBoxFrame_ScrollFrame_displayRoleBtn.Text = "Display role & gun drop: on"
			allVariable.ToolBoxFrame_ScrollFrame_displayRoleBtn.TextColor3 = Color3.fromRGB(0, 255, 0)
			allVariable:DisplayRole()
		else
			allVariable.ToolBoxFrame_ScrollFrame_displayRoleBtn.Text = "Display role & gun drop: off"
			allVariable.ToolBoxFrame_ScrollFrame_displayRoleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
			allVariable.Environment.Part.RoleSignal.Murderer:Release()
			allVariable.Environment.Part.RoleSignal.Sheriff:Release()
			allVariable.Environment.Part.RoleSignal.Hero:Release()
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
		allVariable.Player.JumpHeight.Current = allVariable.Player.JumpHeight.Current + 2
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
		allVariable.Environment.Part.InvisiblePart:Destroy()
		allVariable.Environment.Part.RoleSignal.Murderer.Instance:Destroy()
		allVariable.Environment.Part.RoleSignal.Sheriff.Instance:Destroy()
		allVariable.Environment.Part.RoleSignal.Hero.Instance:Destroy()
		allVariable:Release()
		script:Destroy()
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
