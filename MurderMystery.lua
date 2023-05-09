-- name = text will be displayed on target
-- target = head of model(character)
repeat task.wait() until game:IsLoaded()

local LocalPlayer = game.Players.LocalPlayer
local PlayerGUI = LocalPlayer.PlayerGui
local ToolBox = nil
local ToolBoxFrame = nil
local NoClipBtn = nil
local DisplayRoleBtn = nil
local noClip = false
local parts = {}
local roleparts = {}
local releasePart = nil
local displayRole = nil
local createBillboard = nil
local invisiblePart = Instance.new("Part")
invisiblePart.Name = "invisiblePart"
invisiblePart.Parent = LocalPlayer.Character
invisiblePart.Material = Enum.Material.Plastic
invisiblePart.Transparency = 1
invisiblePart.Size = Vector3.new(10,0.05, 10)
invisiblePart.Anchored = true
invisiblePart.CanCollide = true
invisiblePart.CollisionGroup = "invisiblePart"
LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CollisionGroup = "invisiblePart"

local anchoredPosY = nil

ToolBox = Instance.new("ScreenGui")
ToolBox.Name = "ToolBox"
ToolBox.Parent = PlayerGUI

ToolBoxFrame = Instance.new("Frame")
ToolBoxFrame.Parent = ToolBox
ToolBoxFrame.Name = "ToolBoxFrame"
ToolBoxFrame.Position = UDim2.new(0.7, 0, 0.2, 0)
ToolBoxFrame.Size = UDim2.new(0.15, 0, 0.1, 0)

NoClipBtn = Instance.new("TextButton")
NoClipBtn.Parent = ToolBoxFrame
NoClipBtn.Name = "NoClipBtn"
NoClipBtn.Text = "No clip: off"
NoClipBtn.TextScaled = true
NoClipBtn.BackgroundColor3 = Color3.fromRGB(255,0,0)
NoClipBtn.Position = UDim2.new(0, 0, 0, 0)
NoClipBtn.Size = UDim2.new(1, 0, 0.5, 0)
NoClipBtn.Selected = false
NoClipBtn.Activated:Connect(
	function()
		NoClipBtn.Selected = not NoClipBtn.Selected
		noClip = not noClip
		if (NoClipBtn.Selected) then
			NoClipBtn.BackgroundColor3 = Color3.fromRGB(0,255,0)
			NoClipBtn.Text = "No clip: on"
			invisiblePart.CanCollide = true
			anchoredPosY = LocalPlayer.Character:FindFirstChild("RightFoot").Position.Y
			repeat 
				invisiblePart.Position = Vector3.new(LocalPlayer.Character:FindFirstChild("RightFoot").Position.X, anchoredPosY, LocalPlayer.Character:FindFirstChild("RightFoot").Position.Z)
				task.wait(0.2)
			until not noClip
		else
			if not noClip then
				releasePart(parts)
			end
			invisiblePart.CanCollide = false
			NoClipBtn.BackgroundColor3 = Color3.fromRGB(255,0,0)
			NoClipBtn.Text = "No clip: off"
		end
	end
)

createBillboard = function(name, target, RGBColor)
	if not (target:isA("MeshPart") and target.Name == "Head") then
		return false
	end
	local BillboardGui = Instance.new("BillboardGui")
	BillboardGui.Parent = target
	BillboardGui.Name = name
	BillboardGui.AlwaysOnTop = true
	BillboardGui.Size = UDim2.new(1, 0, 1, 0)
	BillboardGui.ClipsDescendants = false

	local BillboardGuiFrame = Instance.new("Frame")
	BillboardGuiFrame.Parent = BillboardGui
	BillboardGuiFrame.Name = "BillboardGuiFrame"
	BillboardGuiFrame.Size = UDim2.new(4, 0,2, 0)
	BillboardGuiFrame.Position = UDim2.new(-1.75, 0,-1.9, 0)
	BillboardGuiFrame.BackgroundTransparency = 1

	local BillboardGuiFrameTitle = Instance.new("TextLabel")
	BillboardGuiFrameTitle.Parent = BillboardGuiFrame
	BillboardGuiFrameTitle.Name = "BillboardGuiFrame"
	BillboardGuiFrameTitle.Text = name
	BillboardGuiFrameTitle.TextScaled = true
	BillboardGuiFrameTitle.RichText = true
	BillboardGuiFrameTitle.BackgroundTransparency = 1
	BillboardGuiFrameTitle.TextColor3 = RGBColor
	BillboardGuiFrameTitle.TextYAlignment = Enum.TextYAlignment.Top
	BillboardGuiFrameTitle.Size = UDim2.new(1, 0, 1, 0)


	table.insert(roleparts, BillboardGui)
	return BillboardGui
end


DisplayRoleBtn = Instance.new("TextButton")
DisplayRoleBtn.Parent = ToolBoxFrame
DisplayRoleBtn.Name = "DisplayRoleBtn"
DisplayRoleBtn.Text = "Display role: off"
DisplayRoleBtn.TextScaled = true
DisplayRoleBtn.BackgroundColor3 = Color3.fromRGB(255,0,0)
DisplayRoleBtn.Position = UDim2.new(0, 0, 0.5, 0)
DisplayRoleBtn.Size = UDim2.new(1, 0, 0.5, 0)
DisplayRoleBtn.Selected = false
DisplayRoleBtn.Activated:Connect(
	function()
		DisplayRoleBtn.Selected = not DisplayRoleBtn.Selected
		if DisplayRoleBtn.Selected then
			DisplayRoleBtn.BackgroundColor3 = Color3.fromRGB(0,255,0)
			DisplayRoleBtn.Text = "Display role: on"
			displayRole()
		else
			if not DisplayRoleBtn.Selected then
				releasePart(parts, true)
			end
			DisplayRoleBtn.BackgroundColor3 = Color3.fromRGB(255,0,0)
			DisplayRoleBtn.Text = "Display role: off"
		end
	end
)

displayRole = function()
	local murdererCharacter = nil
	local sheriffCharacter = nil
	for _,v in pairs(game.Players:GetChildren()) do
		for _,v1 in pairs(v.Character:GetChildren()) do
			local str = string.upper(v1.Name)
			if (str == 'KNIFE') then
				murdererCharacter = v.Character 
			end
			if (str == 'GUN') then
				sheriffCharacter = v.Character 
			end
		end
	end
	if (murdererCharacter ~= nil) then
		table.insert(roleparts, createBillboard("MURDERER", murdererCharacter:FindFirstChild"Head", Color3.fromRGB(255,0,0)))
	end
	if (sheriffCharacter ~= nil) then
		table.insert(roleparts, createBillboard("SHERIFF", sheriffCharacter:FindFirstChild"Head", Color3.fromRGB(0,0,255)))
	end
end


releasePart = function(parts, isRole)
	if isRole then
		for k, v in pairs(roleparts) do
			v:Destroy()
			parts[k] = nil
		end
	end
	for k, v in pairs(parts) do
		v.CanCollide = true
		parts[k] = nil
	end
end


game.Players.LocalPlayer.Character.Humanoid.Touched:Connect(function(part, pos)
	if (pos.Name=="UpperTorso" or pos.Name=="Head") and noClip then
		if (table.find(parts, part, 1) == nil) then
			part.CanCollide = false
			table.insert(parts, part)
		end
	end
end)

game.Players.LocalPlayer.Character.Humanoid.Jumping:Connect(function()
	anchoredPosY = anchoredPosY+ 0.05
end)


game.Players.LocalPlayer.Character.DescendantRemoving:Connect(
	function()
		loadstring(game:HttpGet"https://raw.githubusercontent.com/HoangHuyPham/Script/master/MurderMystery.lua")()
	end
)
