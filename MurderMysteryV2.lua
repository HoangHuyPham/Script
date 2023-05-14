repeat task.wait() until game:IsLoaded()
local Tool = {}
Tool.Part = {}
Tool.Player = {}
Tool.Gui = {}
Tool.Connection = {}
Tool.Connection.Instances = {}
Tool.Misc = {}
Tool.Misc.UserInputService = game:GetService("UserInputService")
Tool.Misc.gui = nil
Tool.Misc.dragging = nil
Tool.Misc.dragInput = nil
Tool.Misc.dragStart = nil
Tool.Misc.startPos = nil

Tool.Part.SignalPart = {}
Tool.Part.InvisiblePart = {}
Tool.Part.SignalPart.Instances = {}
Tool.Part.DisabledPart = {}
Tool.Part.DisabledPart.Instances = {}

Tool.Player.LocalPlayer = game.Players.LocalPlayer or game:GetService("Players").LocalPlayer
Tool.Player.Character = Tool.Player.LocalPlayer.Character or Tool.Player.LocalPlayer.CharacterAdded:Wait()
Tool.Player.Humanoid = Tool.Player.Character:FindFirstChild("Humanoid") or Tool.Player.Character:WaitForChild("Humanoid")
Tool.Player.HumanoidRootPart = Tool.Player.Humanoid.RootPart
Tool.Player.PlayerGui = Tool.Player.LocalPlayer:FindFirstChild("PlayerGui") or Tool.Player.LocalPlayer:WaitForChild("PlayerGui")
Tool.Player.Camera = workspace.Camera or workspace:WaitForChild("Camera")
Tool.Player.PosY = nil
Tool.Player.SpectatePlayer = nil

Tool.Part.InvisiblePart.Instance = Instance.new("Part")
Tool.Part.InvisiblePart.Instance.Name = "InvisiblePart"
Tool.Part.InvisiblePart.Instance.Parent = workspace or game:GetService("Workspace")
Tool.Part.InvisiblePart.Instance.Size = Vector3.new(5, 0.5, 5)
Tool.Part.InvisiblePart.Instance.Position =  Vector3.new(0,0,0)
Tool.Part.InvisiblePart.Instance.Anchored = true
Tool.Part.InvisiblePart.Instance.CanCollide = false
Tool.Part.InvisiblePart.Instance.Transparency = 1

Tool.Gui.Instance = Instance.new("ScreenGui")
Tool.Gui.Instance.Name = "ToolBox"
Tool.Gui.Instance.Parent = Tool.Player.PlayerGui
--Tool.Gui.Frame1
Tool.Gui.Frame1 = Instance.new("Frame")
Tool.Gui.Frame1.Name = "ToolBox_Frame1"
Tool.Gui.Frame1.Parent = Tool.Gui.Instance
Tool.Gui.Frame1.Position = UDim2.new(0.2, 0, 0, 0)
Tool.Gui.Frame1.Size = UDim2.new(0.5, 0, 0.6, 0)
Tool.Gui.Frame1.BackgroundTransparency = 1
Tool.Gui.Frame1.BackgroundColor3 = Color3.fromRGB(0,0,0)
Tool.Misc.gui = Tool.Gui.Frame1

Tool.Gui.Frame1_ShowGuiBtn = Instance.new("TextButton")
Tool.Gui.Frame1_ShowGuiBtn.Selected = false
Tool.Gui.Frame1_ShowGuiBtn.Name = "Frame1_ShowGuiBtn"
Tool.Gui.Frame1_ShowGuiBtn.Parent = Tool.Gui.Frame1
Tool.Gui.Frame1_ShowGuiBtn.Position = UDim2.new(0, 0, 0, 0)
Tool.Gui.Frame1_ShowGuiBtn.Size = UDim2.new(0.4, 0, 0.15, 0)
Tool.Gui.Frame1_ShowGuiBtn.Text = "Open"
Tool.Gui.Frame1_ShowGuiBtn.BorderSizePixel = 0
Tool.Gui.Frame1_ShowGuiBtn.TextScaled = true
Tool.Gui.Frame1_ShowGuiBtn.TextColor3 = Color3.fromRGB(255,0,0)
Tool.Gui.Frame1_ShowGuiBtn.BackgroundTransparency = 0.2
Tool.Gui.Frame1_ShowGuiBtn.BackgroundColor3 = Color3.fromRGB(0,0,0)

Tool.Gui.Frame1_MoveGuiBtn = Instance.new("TextButton")
Tool.Gui.Frame1_MoveGuiBtn.Name = "Frame1_MoveGuiBtn"
Tool.Gui.Frame1_MoveGuiBtn.Parent = Tool.Gui.Frame1
Tool.Gui.Frame1_MoveGuiBtn.Position = UDim2.new(Tool.Gui.Frame1_ShowGuiBtn.Size.X.Scale, 0, 0, 0)
Tool.Gui.Frame1_MoveGuiBtn.Size = UDim2.new(0.2, 0, 0.15, 0)
Tool.Gui.Frame1_MoveGuiBtn.Text = ""
Tool.Gui.Frame1_MoveGuiBtn.BorderSizePixel = 0
Tool.Gui.Frame1_MoveGuiBtn.TextScaled = true
Tool.Gui.Frame1_MoveGuiBtn.BackgroundTransparency = 0.2
Tool.Gui.Frame1_MoveGuiBtn.BackgroundColor3 = Color3.fromRGB(0,150,190)
--Tool.Gui.Frame2
Tool.Gui.Frame2 = Instance.new("ScrollingFrame")
Tool.Gui.Frame2.Name = "ToolBox_Frame2"
Tool.Gui.Frame2.Parent = Tool.Gui.Frame1
Tool.Gui.Frame2.Position = UDim2.new(0, 0, Tool.Gui.Frame1_ShowGuiBtn.Size.Y.Scale, 0)
Tool.Gui.Frame2.Size = UDim2.new(1, 0, 1- Tool.Gui.Frame1_ShowGuiBtn.Size.Y.Scale, 0)
Tool.Gui.Frame2.BackgroundTransparency = 0.2
Tool.Gui.Frame2.BackgroundColor3 = Color3.fromRGB(0,0,0)
Tool.Gui.Frame2.BorderSizePixel = 2
Tool.Gui.Frame2.BorderColor3 = Color3.fromRGB(0,255,0)
Tool.Gui.Frame2.ScrollBarThickness = 5
Tool.Gui.Frame2.CanvasSize = UDim2.new(0,0,0,0)
Tool.Gui.Frame2.AutomaticCanvasSize = Enum.AutomaticSize.Y
Tool.Gui.Frame2.Visible = false

Tool.Gui.Frame2_NoClipBtn = Instance.new("TextButton")
Tool.Gui.Frame2_NoClipBtn.Selected = false
Tool.Gui.Frame2_NoClipBtn.Name = "Frame2_NoClipBtn"
Tool.Gui.Frame2_NoClipBtn.Parent = Tool.Gui.Frame2
Tool.Gui.Frame2_NoClipBtn.Size = UDim2.new(1, -Tool.Gui.Frame2.ScrollBarThickness, 0.2, 0)
Tool.Gui.Frame2_NoClipBtn.Text = "No Clip"
Tool.Gui.Frame2_NoClipBtn.BorderSizePixel = 0
Tool.Gui.Frame2_NoClipBtn.TextScaled = true
Tool.Gui.Frame2_NoClipBtn.TextColor3 = Color3.fromRGB(255,0,0)
Tool.Gui.Frame2_NoClipBtn.BackgroundTransparency = 0.2
Tool.Gui.Frame2_NoClipBtn.BackgroundColor3 = Color3.fromRGB(0,30,0)

Tool.Gui.Frame2_ObservationBtn = Instance.new("TextButton")
Tool.Gui.Frame2_ObservationBtn.Selected = false
Tool.Gui.Frame2_ObservationBtn.Name = "Frame2_ObservationBtn"
Tool.Gui.Frame2_ObservationBtn.Parent = Tool.Gui.Frame2
Tool.Gui.Frame2_ObservationBtn.Size = UDim2.new(1, -Tool.Gui.Frame2.ScrollBarThickness, 0.2, 0)
Tool.Gui.Frame2_ObservationBtn.Text = "Observation"
Tool.Gui.Frame2_ObservationBtn.BorderSizePixel = 0
Tool.Gui.Frame2_ObservationBtn.TextScaled = true
Tool.Gui.Frame2_ObservationBtn.TextColor3 = Color3.fromRGB(255,0,0)
Tool.Gui.Frame2_ObservationBtn.BackgroundTransparency = 0.2
Tool.Gui.Frame2_ObservationBtn.BackgroundColor3 = Color3.fromRGB(0,0,0)

Tool.Gui.Frame2_ESPRoleBtn = Instance.new("TextButton")
Tool.Gui.Frame2_ESPRoleBtn.Selected = false
Tool.Gui.Frame2_ESPRoleBtn.Name = "Frame2_ESPRoleBtn"
Tool.Gui.Frame2_ESPRoleBtn.Parent = Tool.Gui.Frame2
Tool.Gui.Frame2_ESPRoleBtn.Size = UDim2.new(1, -Tool.Gui.Frame2.ScrollBarThickness, 0.2, 0)
Tool.Gui.Frame2_ESPRoleBtn.Text = "ESP Player (Role)"
Tool.Gui.Frame2_ESPRoleBtn.BorderSizePixel = 0
Tool.Gui.Frame2_ESPRoleBtn.TextScaled = true
Tool.Gui.Frame2_ESPRoleBtn.TextColor3 = Color3.fromRGB(255,0,0)
Tool.Gui.Frame2_ESPRoleBtn.BackgroundTransparency = 0.2
Tool.Gui.Frame2_ESPRoleBtn.BackgroundColor3 = Color3.fromRGB(0,30,0)

Tool.Gui.Frame2_ESPGunBtn = Instance.new("TextButton")
Tool.Gui.Frame2_ESPGunBtn.Selected = false
Tool.Gui.Frame2_ESPGunBtn.Name = "Frame2_ESPGunBtn"
Tool.Gui.Frame2_ESPGunBtn.Parent = Tool.Gui.Frame2
Tool.Gui.Frame2_ESPGunBtn.Size = UDim2.new(1, -Tool.Gui.Frame2.ScrollBarThickness, 0.2, 0)
Tool.Gui.Frame2_ESPGunBtn.Text = "ESP Dropped Gun"
Tool.Gui.Frame2_ESPGunBtn.BorderSizePixel = 0
Tool.Gui.Frame2_ESPGunBtn.TextScaled = true
Tool.Gui.Frame2_ESPGunBtn.TextColor3 = Color3.fromRGB(255,0,0)
Tool.Gui.Frame2_ESPGunBtn.BackgroundTransparency = 0.2
Tool.Gui.Frame2_ESPGunBtn.BackgroundColor3 = Color3.fromRGB(0,0,0)

Tool.Gui.Frame2_ESPCoinBtn = Instance.new("TextButton")
Tool.Gui.Frame2_ESPCoinBtn.Selected = false
Tool.Gui.Frame2_ESPCoinBtn.Name = "Frame2_ESPCoinBtn"
Tool.Gui.Frame2_ESPCoinBtn.Parent = Tool.Gui.Frame2
Tool.Gui.Frame2_ESPCoinBtn.Size = UDim2.new(1, -Tool.Gui.Frame2.ScrollBarThickness, 0.2, 0)
Tool.Gui.Frame2_ESPCoinBtn.Text = "ESP Coin"
Tool.Gui.Frame2_ESPCoinBtn.BorderSizePixel = 0
Tool.Gui.Frame2_ESPCoinBtn.TextScaled = true
Tool.Gui.Frame2_ESPCoinBtn.TextColor3 = Color3.fromRGB(255,0,0)
Tool.Gui.Frame2_ESPCoinBtn.BackgroundTransparency = 0.2
Tool.Gui.Frame2_ESPCoinBtn.BackgroundColor3 = Color3.fromRGB(0,30,0)
--
Tool.Gui.Frame2_SpectateBtn_Frame = Instance.new("ScrollingFrame")
Tool.Gui.Frame2_SpectateBtn_Frame.Name = "Frame2_SpectateBtn_Frame"
Tool.Gui.Frame2_SpectateBtn_Frame.Parent = Tool.Gui.Frame2
Tool.Gui.Frame2_SpectateBtn_Frame.Size = UDim2.new(1, -Tool.Gui.Frame2.ScrollBarThickness, 0.2, 0)
Tool.Gui.Frame2_SpectateBtn_Frame.BorderSizePixel = 0
Tool.Gui.Frame2_SpectateBtn_Frame.BackgroundTransparency = 0.2
Tool.Gui.Frame2_SpectateBtn_Frame.BackgroundColor3 = Color3.fromRGB(0,30,0)
Tool.Gui.Frame2_SpectateBtn_Frame.BorderColor3 = Color3.fromRGB(0,255,0)
Tool.Gui.Frame2_SpectateBtn_Frame.ScrollBarThickness = 5
Tool.Gui.Frame2_SpectateBtn_Frame.CanvasSize = UDim2.new(0,0,0,0)
Tool.Gui.Frame2_SpectateBtn_Frame.AutomaticCanvasSize = Enum.AutomaticSize.Y


Tool.Gui.Frame2_SpectateBtn = Instance.new("TextButton")
Tool.Gui.Frame2_SpectateBtn.Selected = false
Tool.Gui.Frame2_SpectateBtn.Name = "Frame2_SpectateBtn"
Tool.Gui.Frame2_SpectateBtn.Parent = Tool.Gui.Frame2_SpectateBtn_Frame
Tool.Gui.Frame2_SpectateBtn.Size = UDim2.new(1, -Tool.Gui.Frame2.ScrollBarThickness, 1, 0)
Tool.Gui.Frame2_SpectateBtn.Text = "Spectate: No one*"
Tool.Gui.Frame2_SpectateBtn.BorderSizePixel = 0
Tool.Gui.Frame2_SpectateBtn.TextScaled = true
Tool.Gui.Frame2_SpectateBtn.TextColor3 = Color3.fromRGB(255,0,0)
Tool.Gui.Frame2_SpectateBtn.BackgroundTransparency = 0.2
Tool.Gui.Frame2_SpectateBtn.BackgroundColor3 = Color3.fromRGB(0,30,0)

Tool.Gui.Frame2_SpectateCancelBtn = Instance.new("TextButton")
Tool.Gui.Frame2_SpectateCancelBtn.Selected = false
Tool.Gui.Frame2_SpectateCancelBtn.Name = "Frame2_SpectateCancelBtn"
Tool.Gui.Frame2_SpectateCancelBtn.Parent = Tool.Gui.Frame2_SpectateBtn_Frame
Tool.Gui.Frame2_SpectateCancelBtn.Size = UDim2.new(1, -Tool.Gui.Frame2.ScrollBarThickness, 1/3, 0)
Tool.Gui.Frame2_SpectateCancelBtn.Text = "Cancel"
Tool.Gui.Frame2_SpectateCancelBtn.BorderSizePixel = 0
Tool.Gui.Frame2_SpectateCancelBtn.TextScaled = true
Tool.Gui.Frame2_SpectateCancelBtn.TextColor3 = Color3.fromRGB(0,0,255)
Tool.Gui.Frame2_SpectateCancelBtn.BackgroundTransparency = 0.2
Tool.Gui.Frame2_SpectateCancelBtn.BackgroundColor3 = Color3.fromRGB(0,30,0)
Tool.Gui.Frame2_SpectateCancelBtn.Visible = false

local UI_List1 = Instance.new("UIListLayout")
UI_List1.SortOrder = Enum.SortOrder.LayoutOrder
UI_List1.Parent = Tool.Gui.Frame2_SpectateBtn_Frame

local UI_List = Instance.new("UIListLayout")
UI_List.SortOrder = Enum.SortOrder.LayoutOrder
UI_List.Parent = Tool.Gui.Frame2


Tool.Connection.Instances.ShowGuiBtnC1 = Tool.Gui.Frame1_ShowGuiBtn.Activated:Connect(
	function()
		Tool.Gui.Frame1_ShowGuiBtn.Selected = not Tool.Gui.Frame1_ShowGuiBtn.Selected
		if (Tool.Gui.Frame1_ShowGuiBtn.Selected) then
			Tool.Gui.Frame1_ShowGuiBtn.TextColor3 = Color3.fromRGB(0,255,0)
			Tool.Gui.Frame2.Visible = true
		else
			Tool.Gui.Frame1_ShowGuiBtn.TextColor3 = Color3.fromRGB(255,0,0)
			Tool.Gui.Frame2.Visible = false
		end
	end
)

Tool.Connection.Instances.NoClipBtnC1 = Tool.Gui.Frame2_NoClipBtn.Activated:Connect(
	function()
		Tool.Gui.Frame2_NoClipBtn.Selected = not Tool.Gui.Frame2_NoClipBtn.Selected
		if (Tool.Gui.Frame2_NoClipBtn.Selected) then
			Tool.Gui.Frame2_NoClipBtn.TextColor3 = Color3.fromRGB(0,255,0)
			Tool.Part.InvisiblePart.Instance.CanCollide = true
			Tool:OnNoClip()
		else
			Tool.Gui.Frame2_NoClipBtn.TextColor3 = Color3.fromRGB(255,0,0)
			Tool.Part.InvisiblePart.Instance.CanCollide = false
			Tool.Part.DisabledPart:Release()
		end
	end
)

Tool.Connection.Instances.ObservationBtnC1 = Tool.Gui.Frame2_ObservationBtn.Activated:Connect(
	function()
		Tool.Gui.Frame2_ObservationBtn.Selected = not Tool.Gui.Frame2_ObservationBtn.Selected
		if (Tool.Gui.Frame2_ObservationBtn.Selected) then
			Tool.Gui.Frame2_ObservationBtn.TextColor3 = Color3.fromRGB(0,255,0)
		else
			Tool.Gui.Frame2_ObservationBtn.TextColor3 = Color3.fromRGB(255,0,0)
		end
	end
)

Tool.Connection.Instances.ESPRoleBtnC1 = Tool.Gui.Frame2_ESPRoleBtn.Activated:Connect(
	function()
		Tool.Gui.Frame2_ESPRoleBtn.Selected = not Tool.Gui.Frame2_ESPRoleBtn.Selected
		if (Tool.Gui.Frame2_ESPRoleBtn.Selected) then
			Tool.Gui.Frame2_ESPRoleBtn.TextColor3 = Color3.fromRGB(0,255,0)
		else
			Tool.Gui.Frame2_ESPRoleBtn.TextColor3 = Color3.fromRGB(255,0,0)
		end
	end
)

Tool.Connection.Instances.ESPGunBtnC1 = Tool.Gui.Frame2_ESPGunBtn.Activated:Connect(
	function()
		Tool.Gui.Frame2_ESPGunBtn.Selected = not Tool.Gui.Frame2_ESPGunBtn.Selected
		if (Tool.Gui.Frame2_ESPGunBtn.Selected) then
			Tool.Gui.Frame2_ESPGunBtn.TextColor3 = Color3.fromRGB(0,255,0)
		else
			Tool.Gui.Frame2_ESPGunBtn.TextColor3 = Color3.fromRGB(255,0,0)
		end
	end
)

Tool.Connection.Instances.ESPCoinBtnC1 = Tool.Gui.Frame2_ESPCoinBtn.Activated:Connect(
	function()
		Tool.Gui.Frame2_ESPCoinBtn.Selected = not Tool.Gui.Frame2_ESPCoinBtn.Selected
		if (Tool.Gui.Frame2_ESPCoinBtn.Selected) then
			Tool.Gui.Frame2_ESPCoinBtn.TextColor3 = Color3.fromRGB(0,255,0)
		else
			Tool.Gui.Frame2_ESPCoinBtn.TextColor3 = Color3.fromRGB(255,0,0)
		end
	end
)

Tool.Connection.Instances.MoveGuiBtnC1 = Tool.Gui.Frame1_MoveGuiBtn.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		Tool.Misc.dragging = true
		Tool.Misc.dragStart = input.Position
		Tool.Misc.startPos = Tool.Misc.gui.Position

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				Tool.Misc.dragging = false
			end
		end)
	end
end)

Tool.Connection.Instances.MoveGuiBtnC2 = Tool.Gui.Frame1_MoveGuiBtn.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		Tool.Misc.dragInput = input
	end
end)

Tool.Connection.Instances.MoveGuiBtnC3 = Tool.Misc.UserInputService.InputChanged:Connect(function(input)
	if input == Tool.Misc.dragInput and Tool.Misc.dragging then
		Tool.Misc:update(input)
	end
end)

Tool.Connection.Instances.SpectateBtnC1 = Tool.Gui.Frame2_SpectateBtn.Activated:Connect(
	function ()
		Tool.Gui.Frame2_SpectateBtn.Visible = false
		Tool.Gui.Frame2_SpectateBtn_Frame.Size = UDim2.new(1, -Tool.Gui.Frame2.ScrollBarThickness, 0.6, 0)
		Tool:LoadPlayerTo(Tool.Gui.Frame2_SpectateBtn_Frame)
		Tool.Gui.Frame2_SpectateCancelBtn.Visible = true
		Tool.Player.Camera.CameraSubject = Tool.Player.Humanoid
	end
)

Tool.Connection.Instances.SpectateCancelBtnC1 = Tool.Gui.Frame2_SpectateCancelBtn.Activated:Connect(
	function ()
		Tool.Gui.Frame2_SpectateBtn.Visible = true
		Tool.Gui.Frame2_SpectateBtn_Frame.Size = UDim2.new(1, -Tool.Gui.Frame2.ScrollBarThickness, 0.2, 0)
		Tool:RemovePlayerBtn(Tool.Gui.Frame2_SpectateBtn_Frame, true)
		Tool.Gui.Frame2_SpectateCancelBtn.Visible = false
		Tool.Gui.Frame2_SpectateBtn.Text = "Spectate: No one*"
	end
)


Tool.Connection.TouchedPartDetector = Tool.Player.Humanoid.Touched:Connect(
	function(input, part)
		if (part.Name == "UpperTorso" or part.Name == "LowerTorso" or part.Name == "Head") then
			Tool:NoClip(input)
		end
	end
)

Tool.Connection.JumpingDetector = Tool.Player.Humanoid.Jumping:Connect(
	function()
		Tool.Player.PosY += 1
	end
)
Tool.Connection.CharacterResetDetector = Tool.Player.LocalPlayer.CharacterAdded:Connect(
	function ()
		Tool:Release()
	end
)


function Tool.Part.InvisiblePart:SetPosition()
	local foot = Tool.Player.Character:FindFirstChild("RightFoot") or Tool.Player.Character:FindFirstChild("LeftFoot")
	local pos = CFrame.new(Vector3.new(foot.CFrame.Position.X,Tool.Player.PosY,foot.CFrame.Position.Z))
	Tool.Part.InvisiblePart.Instance.CFrame = pos + Vector3.new(0,-0.5,0)
end

function Tool.Part.InvisiblePart:Release()
	self.Instance:Destroy()
end

function Tool.Part.SignalPart:Create(adornee, text, color3)
	text = text or "noname"
	local SignalPart = Instance.new("BillboardGui")
	SignalPart.Parent = adornee
	SignalPart.Adornee = adornee
	SignalPart.AlwaysOnTop = true
	SignalPart.ZIndexBehavior = Enum.ZIndexBehavior.Global
	SignalPart.Size = UDim2.new(3, 0, 1.5, 0)
	
	if (adornee:isA("Part") and adornee.Name ~= "HumanoidRootPart") then
		SignalPart.ExtentsOffset = Vector3.new(0, 2, 0)
		SignalPart.Name = adornee.Name
	elseif (adornee:isA("Part") and adornee.Name == "HumanoidRootPart") then
		SignalPart.ExtentsOffset = Vector3.new(0, 3, 0)
		SignalPart.Name = adornee.Parent.Name
	end
	
	local SignalPart_Text = Instance.new("TextLabel")
	SignalPart_Text.Parent = SignalPart
	SignalPart_Text.Name = "SignalPart_Text"
	SignalPart_Text.Text = string.upper(text)
	SignalPart_Text.BackgroundTransparency = 1
	SignalPart_Text.TextColor3 = color3
	SignalPart_Text.TextScaled = true
	SignalPart_Text.Size = UDim2.new(1, 0, 1, 0)
	SignalPart_Text.BorderSizePixel = 0
	table.insert(self.Instances, SignalPart)
end

function Tool.Part.SignalPart:Release(SignalPartName)
	if not SignalPartName then
		for k,v in pairs(Tool.Part.SignalPart.Instances) do
			v:Destroy()
		end
		table.clear(Tool.Part.SignalPart.Instances)
		return
	end
	for k,v in pairs(Tool.Part.SignalPart.Instances) do
		if (v.Name == SignalPartName) then
			v:Destroy()
			table.remove(Tool.Part.SignalPart.Instances, k)
		end
	end
end

function Tool.Connection:Release()
	for k,v in pairs(self.Instances) do
		v:Disconnect()
	end
end


function Tool.Misc:update(input)
	local delta = input.Position - Tool.Misc.dragStart
	Tool.Misc.gui.Position = UDim2.new(Tool.Misc.startPos.X.Scale, Tool.Misc.startPos.X.Offset + delta.X, Tool.Misc.startPos.Y.Scale, Tool.Misc.startPos.Y.Offset + delta.Y)
end

function Tool:NoClip(input)
	if (Tool.Gui.Frame2_NoClipBtn.Selected) then
		if not (table.find(Tool.Part.DisabledPart.Instances, input, 1)) then
			input.CanCollide = false
			table.insert(Tool.Part.DisabledPart.Instances, input)
		end
	end
end


function Tool:OnNoClip()
	local foot = Tool.Player.Character:FindFirstChild("RightFoot") or Tool.Player.Character:FindFirstChild("LeftFoot")
	Tool.Player.PosY = foot.CFrame.Position.Y
	while (Tool.Gui.Frame2_NoClipBtn.Selected) do
		Tool.Part.InvisiblePart.SetPosition()
		task.wait(0.1)
	end
end

function Tool.Part.DisabledPart:Release()
	for k,v in pairs(self.Instances) do
		if (not v.CanCollide) then
			v.CanCollide = true
			table.remove(self.Instances, k)
		end
	end
end

function Tool:Release()
	Tool.Gui.Frame1_ShowGuiBtn.Selected = false
	Tool.Gui.Frame1_MoveGuiBtn.Selected = false
	Tool.Gui.Frame2_NoClipBtn.Selected = false
	Tool.Gui.Frame2_ESPGunBtn.Selected = false
	Tool.Gui.Frame2_ObservationBtn.Selected = false
	Tool.Gui.Frame2_ESPCoinBtn.Selected = false
	task.wait(0.25)
	Tool.Connection:Release()
	Tool.Part.SignalPart:Release()
	Tool.Part.InvisiblePart:Release()
	Tool.Part.DisabledPart:Release()
	Tool:Release()
	table:clear(self)
end

function Tool:CreateBtn(text, player)
	text = text or "noname"
	local Button = Instance.new("TextButton")
	Button.Name = text
	Button.Text = text	
	Button.Selected = false
	Button.Size = UDim2.new(1, -Tool.Gui.Frame2.ScrollBarThickness, 1/3, 0)
	Button.BorderSizePixel = 0
	Button.TextScaled = true
	Button.TextColor3 = Color3.fromRGB(0,255,0)
	Button.BackgroundTransparency = 0.2
	Button.BackgroundColor3 = Color3.fromRGB(0,30,0)
	Tool.Connection.Instances[text] = Button.Activated:Connect(
		function ()
			Tool.Player.SpectatePlayer = player
			Tool.Gui.Frame2_SpectateBtn.Text = "Spectate: "..player.Name
			Tool.Gui.Frame2_SpectateBtn.Visible = true
			Tool.Gui.Frame2_SpectateBtn_Frame.Size = UDim2.new(1, -Tool.Gui.Frame2.ScrollBarThickness, 0.2, 0)
			Tool:RemovePlayerBtn(Tool.Gui.Frame2_SpectateBtn_Frame)
			Tool.Gui.Frame2_SpectateCancelBtn.Visible = false
			Tool:Spectate()
		end
	)
	return Button
end

function Tool:LoadPlayerTo(scrollframe)
	if scrollframe == nil then
		return
	end
	Tool:RemovePlayerBtn(scrollframe, true)
	local players = game:FindFirstChild("Players") or game:GetService("Players")
	for k,v in pairs(players:GetChildren()) do
		local Button = Tool:CreateBtn(v.Name, v)
		Button.Parent = scrollframe
	end
	
end

function Tool:RemovePlayerBtn(scrollframe, isRemoveData)
	if scrollframe == nil then
		return
	end
	for k,v in pairs(scrollframe:GetChildren()) do
		if (v:IsA("TextButton") and v ~= Tool.Gui.Frame2_SpectateBtn and v ~= Tool.Gui.Frame2_SpectateCancelBtn) then
			v:Destroy()
		end
	end
	if (isRemoveData) then
		Tool.Player.SpectatePlayer = nil
	end
end

function Tool:Spectate()
	while Tool.Gui.Frame2_SpectateBtn do
		if Tool.Player.Camera.CameraSubject ~= Tool.Player.SpectatePlayer.Character:FindFirstChild"Humanoid" then
			Tool.Player.Camera.CameraSubject = Tool.Player.SpectatePlayer.Character:FindFirstChild"Humanoid"
		end
		task.wait(1)
	end
end

