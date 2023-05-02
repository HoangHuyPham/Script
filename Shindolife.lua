while not game:IsLoaded() do
    task.wait()
end
local TIME_OUT = 10
local UserInputService = game:GetService("UserInputService")
local isSpin = false
local ToolBoxGUI = nil
local gamepasses = nil
local statz = nil
local alljutsu = nil
local startevent = nil
local WIDTH_SLOT = 0.4
local HEIGHT_SLOT = 1
local setValues = nil
local getCurrentValues = nil
local WIDTH_SLOT = 0.4
local HEIGHT_SLOT = 1
local spin = nil
local isChosen = false
local spinned = 0
local initialSpin = {
    element = 0,
    bloodline = 0
}

local ToolBox = Instance.new("ScreenGui")
ToolBox.Name = "ToolBox"
ToolBox.Parent = game.Players.LocalPlayer.PlayerGui

local ToolBoxFrame = Instance.new("Frame")
ToolBoxFrame.Parent = ToolBox
ToolBoxFrame.Position = UDim2.new(0.3, 0, 0.01, 0)
ToolBoxFrame.Size = UDim2.new(0.3, 0, 0.4, 0)
ToolBoxFrame.BackgroundColor3 = Color3.new(0, 0, 0)
ToolBoxFrame.Transparency = 0.6

local MoveGUIBtn = Instance.new("TextButton")
MoveGUIBtn.Name = "MoveGUIBtn"
MoveGUIBtn.Parent = ToolBoxFrame
MoveGUIBtn.Text = ""
MoveGUIBtn.BackgroundColor3 = Color3.new(0, 0, 0)
MoveGUIBtn.Position = UDim2.new(0, 0, 0, 0)
MoveGUIBtn.Size = UDim2.new(0, 20, 0, 20)

local SpinnedLabel = Instance.new("TextLabel")
SpinnedLabel.Name = "SpinnedLabel"
SpinnedLabel.Parent = ToolBoxFrame
SpinnedLabel.Text = "Spinned: 0(0 bloodlines, 0 elements)"
SpinnedLabel.TextScaled = true
SpinnedLabel.TextColor3 = Color3.new(255, 255, 255)
SpinnedLabel.Position = UDim2.new(0.2, 0, 0.1, 0)
SpinnedLabel.TextWrapped = true
SpinnedLabel.Size = UDim2.new(0.6, 0, 0.1, 0)

local function createMenuList(name, value, parent)
    value = value or "null"
    parent = parent or nil
    local btn = Instance.new("TextButton")
    btn.Name = name
    btn.Text = value
    btn.Parent = parent
    btn.Position = UDim2.new(0, 0, 0, 0)
    btn.Size = UDim2.new(1, -parent.ScrollBarThickness, parent.Size.Y.Scale, 0)
    btn.TextColor3 = Color3.fromRGB(0, 0, 0)
    btn.BorderSizePixel = 0
    btn.BackgroundColor3 = Color3.fromRGB(85, 103, 112)
    btn:SetAttribute("checked", false)
    btn.TextScaled = true
    btn.Activated:Connect(function()
        btn:SetAttribute("checked", not btn:GetAttribute("checked"))
        if (btn:GetAttribute("checked")) then
            local count = 0
            for _, v in pairs(stop_spin_choose_scroll_frame:GetChildren()) do
                count = count + 1
            end
            if not (count > 20) then
                btn.TextColor3 = Color3.fromRGB(255, 0, 0)
                local btnClone = btn:Clone()
                btnClone.Size = UDim2.new(1 / 6, 0, 1, 0)
                btnClone.Activated:Connect(function()
                    btn.TextColor3 = Color3.fromRGB(0, 0, 0)
                    for _, v in pairs(stop_spin_choose_scroll_frame:GetChildren()) do
                        if (v.Name == btn.Name) then
                            stop_spin_choose_scroll_frame:FindFirstChild(v.Name):Remove()
                        end
                    end
                end)
                btnClone.Parent = stop_spin_choose_scroll_frame
            else
                btn:SetAttribute("checked", not btn:GetAttribute("checked"))
            end
        else
            btn.TextColor3 = Color3.fromRGB(0, 0, 0)
            for _, v in pairs(stop_spin_choose_scroll_frame:GetChildren()) do
                if (v.Name == btn.Name) then
                    stop_spin_choose_scroll_frame:FindFirstChild(v.Name):Remove()
                end
            end
        end
    end)
end

local Element1Frame = Instance.new("Frame")
Element1Frame.Name = "Element1Frame"
Element1Frame.Parent = ToolBoxFrame
Element1Frame.Position = UDim2.new(0.05, 0, 0.3, 0)
Element1Frame.Size = UDim2.new(WIDTH_SLOT, 0, 0.1, 0)
Element1Frame.InputBegan:Connect(function(input)
    if (input.UserInputType == Enum.UserInputType.MouseButton1) then
        if not (Element1Frame:FindFirstChild("Element1ValueLabel").Text == "Locked") then
            Element1Frame:FindFirstChild("Element1ValueLabel").Text = "Locked"
        else
            Element1Frame:FindFirstChild("Element1ValueLabel").Text = getCurrentValues().element[1]
        end

    end
end)

local Element1Label = Instance.new("TextLabel")
Element1Label.Name = "Element1Label"
Element1Label.Parent = Element1Frame
Element1Label.Text = "Element1: "
Element1Label.TextScaled = true
Element1Label.TextColor3 = Color3.fromRGB(255, 255, 255)
Element1Label.Position = UDim2.new(0, 0, 0, 0)
Element1Label.Size = UDim2.new(WIDTH_SLOT - 0.01, 0, HEIGHT_SLOT, 0)
Element1Label.TextWrapped = true
Element1Label.BackgroundTransparency = 1

local Element1ValueLabel = Instance.new("TextLabel")
Element1ValueLabel.Name = "Element1ValueLabel"
Element1ValueLabel.Parent = Element1Frame
Element1ValueLabel.Position = UDim2.new(WIDTH_SLOT, 0, 0, 0)
Element1ValueLabel.Size = UDim2.new(1 - WIDTH_SLOT, 0, HEIGHT_SLOT, 0)
Element1ValueLabel.BorderSizePixel = 0
Element1ValueLabel.Text = "No element!"
Element1ValueLabel.TextScaled = true
Element1ValueLabel.TextWrapped = true

local Element2Frame = Instance.new("Frame")
Element2Frame.Name = "Element2Frame"
Element2Frame.Parent = ToolBoxFrame
Element2Frame.Position = UDim2.new(Element1Frame.Position.X.Scale, 0,
    Element1Frame.Position.Y.Scale + Element1Frame.Size.Y.Scale, 0)
Element2Frame.Size = UDim2.new(WIDTH_SLOT, 0, 0.1, 0)
Element2Frame.InputBegan:Connect(function(input)
    if (input.UserInputType == Enum.UserInputType.MouseButton1) then
        if not (Element2Frame:FindFirstChild("Element2ValueLabel").Text == "Locked") then
            Element2Frame:FindFirstChild("Element2ValueLabel").Text = "Locked"
        else
            Element2Frame:FindFirstChild("Element2ValueLabel").Text = getCurrentValues().element[2]
        end

    end
end)

local Element2Label = Instance.new("TextLabel")
Element2Label.Name = "Element2Label"
Element2Label.Parent = Element2Frame
Element2Label.Text = "Element2: "
Element2Label.TextScaled = true
Element2Label.TextColor3 = Color3.fromRGB(255, 255, 255)
Element2Label.Position = UDim2.new(0, 0, 0, 0)
Element2Label.Size = UDim2.new(WIDTH_SLOT - 0.01, 0, HEIGHT_SLOT, 0)
Element2Label.TextWrapped = true
Element2Label.BackgroundTransparency = 1

local Element2ValueLabel = Instance.new("TextLabel")
Element2ValueLabel.Name = "Element2ValueLabel"
Element2ValueLabel.Parent = Element2Frame
Element2ValueLabel.Position = UDim2.new(WIDTH_SLOT, 0, 0, 0)
Element2ValueLabel.Size = UDim2.new(1 - WIDTH_SLOT, 0, HEIGHT_SLOT, 0)
Element2ValueLabel.BorderSizePixel = 0
Element2ValueLabel.Text = "No element!"
Element2ValueLabel.TextScaled = true
Element2ValueLabel.TextWrapped = true

local Element3Frame = Instance.new("Frame")
Element3Frame.Name = "Element3Frame"
Element3Frame.Parent = ToolBoxFrame
Element3Frame.Position = UDim2.new(Element2Frame.Position.X.Scale, 0,
    Element2Frame.Position.Y.Scale + Element2Frame.Size.Y.Scale, 0)
Element3Frame.Size = UDim2.new(WIDTH_SLOT, 0, 0.1, 0)
Element3Frame.InputBegan:Connect(function(input)
    if (input.UserInputType == Enum.UserInputType.MouseButton1) then
        if not (Element3Frame:FindFirstChild("Element3ValueLabel").Text == "Locked") then
            Element3Frame:FindFirstChild("Element3ValueLabel").Text = "Locked"
        else
            if (gamepasses.element3) then
                Element3Frame:FindFirstChild("Element3ValueLabel").Text = getCurrentValues().element[3]
            else
                Element3Frame:FindFirstChild("Element3ValueLabel").Text = "Not have this gamepass!"
            end

        end

    end
end)

local WIDTH_SLOT = 0.4
local HEIGHT_SLOT = 1
local Element3Label = Instance.new("TextLabel")
Element3Label.Name = "Element3Label"
Element3Label.Parent = Element3Frame
Element3Label.Text = "Element3: "
Element3Label.TextScaled = true
Element3Label.TextColor3 = Color3.fromRGB(255, 255, 255)
Element3Label.Position = UDim2.new(0, 0, 0, 0)
Element3Label.Size = UDim2.new(WIDTH_SLOT - 0.01, 0, HEIGHT_SLOT, 0)
Element3Label.TextWrapped = true
Element3Label.BackgroundTransparency = 1

local Element3ValueLabel = Instance.new("TextLabel")
Element3ValueLabel.Name = "Element3ValueLabel"
Element3ValueLabel.Parent = Element3Frame
Element3ValueLabel.Position = UDim2.new(WIDTH_SLOT, 0, 0, 0)
Element3ValueLabel.Size = UDim2.new(1 - WIDTH_SLOT, 0, HEIGHT_SLOT, 0)
Element3ValueLabel.BorderSizePixel = 0
Element3ValueLabel.Text = "No element!"
Element3ValueLabel.TextScaled = true
Element3ValueLabel.TextWrapped = true

local Element4Frame = Instance.new("Frame")
Element4Frame.Name = "Element4Frame"
Element4Frame.Parent = ToolBoxFrame
Element4Frame.Position = UDim2.new(Element3Frame.Position.X.Scale, 0,
    Element3Frame.Position.Y.Scale + Element3Frame.Size.Y.Scale, 0)
Element4Frame.Size = UDim2.new(WIDTH_SLOT, 0, 0.1, 0)
Element4Frame.InputBegan:Connect(function(input)
    if (input.UserInputType == Enum.UserInputType.MouseButton1) then
        if not (Element4Frame:FindFirstChild("Element4ValueLabel").Text == "Locked") then
            Element4Frame:FindFirstChild("Element4ValueLabel").Text = "Locked"
        else
            if (gamepasses.element4) then
                Element4Frame:FindFirstChild("Element4ValueLabel").Text = getCurrentValues().element[4]
            else
                Element4Frame:FindFirstChild("Element4ValueLabel").Text = "Not have this gamepass!"
            end

        end

    end
end)

local WIDTH_SLOT = 0.4
local HEIGHT_SLOT = 1
local Element4Label = Instance.new("TextLabel")
Element4Label.Name = "Element4Label"
Element4Label.Parent = Element4Frame
Element4Label.Text = "Element4: "
Element4Label.TextScaled = true
Element4Label.TextColor3 = Color3.fromRGB(255, 255, 255)
Element4Label.Position = UDim2.new(0, 0, 0, 0)
Element4Label.Size = UDim2.new(WIDTH_SLOT - 0.01, 0, HEIGHT_SLOT, 0)
Element4Label.TextWrapped = true
Element4Label.BackgroundTransparency = 1

local Element4ValueLabel = Instance.new("TextLabel")
Element4ValueLabel.Name = "Element4ValueLabel"
Element4ValueLabel.Parent = Element4Frame
Element4ValueLabel.Position = UDim2.new(WIDTH_SLOT, 0, 0, 0)
Element4ValueLabel.Size = UDim2.new(1 - WIDTH_SLOT, 0, HEIGHT_SLOT, 0)
Element4ValueLabel.BorderSizePixel = 0
Element4ValueLabel.Text = "No element!"
Element4ValueLabel.TextScaled = true
Element4ValueLabel.TextWrapped = true

local Bloodline1Frame = Instance.new("Frame")
Bloodline1Frame.Name = "Bloodline1Frame"
Bloodline1Frame.Parent = ToolBoxFrame
Bloodline1Frame.Position = UDim2.new(0.5, 0, 0.3, 0)
Bloodline1Frame.Size = UDim2.new(WIDTH_SLOT, 0, 0.1, 0)
Bloodline1Frame.InputBegan:Connect(function(input)
    if (input.UserInputType == Enum.UserInputType.MouseButton1) then
        if not (Bloodline1Frame:FindFirstChild("Bloodline1ValueLabel").Text == "Locked") then
            Bloodline1Frame:FindFirstChild("Bloodline1ValueLabel").Text = "Locked"
        else
            Bloodline1Frame:FindFirstChild("Bloodline1ValueLabel").Text = getCurrentValues().bloodline[1]
        end

    end
end)

local Bloodline1Label = Instance.new("TextLabel")
Bloodline1Label.Name = "Bloodline1Label"
Bloodline1Label.Parent = Bloodline1Frame
Bloodline1Label.Text = "Bloodline1: "
Bloodline1Label.TextScaled = true
Bloodline1Label.TextColor3 = Color3.fromRGB(255, 0, 0)
Bloodline1Label.Position = UDim2.new(0, 0, 0, 0)
Bloodline1Label.Size = UDim2.new(WIDTH_SLOT - 0.01, 0, HEIGHT_SLOT, 0)
Bloodline1Label.TextWrapped = true
Bloodline1Label.BackgroundTransparency = 1

local Bloodline1ValueLabel = Instance.new("TextLabel")
Bloodline1ValueLabel.Name = "Bloodline1ValueLabel"
Bloodline1ValueLabel.Parent = Bloodline1Frame
Bloodline1ValueLabel.Position = UDim2.new(WIDTH_SLOT, 0, 0, 0)
Bloodline1ValueLabel.Size = UDim2.new(1 - WIDTH_SLOT, 0, HEIGHT_SLOT, 0)
Bloodline1ValueLabel.BorderSizePixel = 0
Bloodline1ValueLabel.Text = "No element!"
Bloodline1ValueLabel.TextScaled = true
Bloodline1ValueLabel.TextWrapped = true

local Bloodline2Frame = Instance.new("Frame")
Bloodline2Frame.Name = "Bloodline2Frame"
Bloodline2Frame.Parent = ToolBoxFrame
Bloodline2Frame.Position = UDim2.new(Bloodline1Frame.Position.X.Scale, 0,
    Bloodline1Frame.Position.Y.Scale + Bloodline1Frame.Size.Y.Scale, 0)
Bloodline2Frame.Size = UDim2.new(WIDTH_SLOT, 0, 0.1, 0)
Bloodline2Frame.InputBegan:Connect(function(input)
    if (input.UserInputType == Enum.UserInputType.MouseButton1) then
        if not (Bloodline2Frame:FindFirstChild("Bloodline2ValueLabel").Text == "Locked") then
            Bloodline2Frame:FindFirstChild("Bloodline2ValueLabel").Text = "Locked"
        else
            Bloodline2Frame:FindFirstChild("Bloodline2ValueLabel").Text = getCurrentValues().bloodline[2]
        end

    end
end)

local WIDTH_SLOT = 0.4
local HEIGHT_SLOT = 1
local Bloodline2Label = Instance.new("TextLabel")
Bloodline2Label.Name = "Bloodline2Label"
Bloodline2Label.Parent = Bloodline2Frame
Bloodline2Label.Text = "Bloodline2: "
Bloodline2Label.TextScaled = true
Bloodline2Label.TextColor3 = Color3.fromRGB(255, 0, 0)
Bloodline2Label.Position = UDim2.new(0, 0, 0, 0)
Bloodline2Label.Size = UDim2.new(WIDTH_SLOT - 0.01, 0, HEIGHT_SLOT, 0)
Bloodline2Label.TextWrapped = true
Bloodline2Label.BackgroundTransparency = 1

local Bloodline2ValueLabel = Instance.new("TextLabel")
Bloodline2ValueLabel.Name = "Bloodline2ValueLabel"
Bloodline2ValueLabel.Parent = Bloodline2Frame
Bloodline2ValueLabel.Position = UDim2.new(WIDTH_SLOT, 0, 0, 0)
Bloodline2ValueLabel.Size = UDim2.new(1 - WIDTH_SLOT, 0, HEIGHT_SLOT, 0)
Bloodline2ValueLabel.BorderSizePixel = 0
Bloodline2ValueLabel.Text = "No element!"
Bloodline2ValueLabel.TextScaled = true
Bloodline2ValueLabel.TextWrapped = true

local Bloodline3Frame = Instance.new("Frame")
Bloodline3Frame.Name = "Bloodline3Frame"
Bloodline3Frame.Parent = ToolBoxFrame
Bloodline3Frame.Position = UDim2.new(Bloodline2Frame.Position.X.Scale, 0,
    Bloodline2Frame.Position.Y.Scale + Bloodline2Frame.Size.Y.Scale, 0)
Bloodline3Frame.Size = UDim2.new(WIDTH_SLOT, 0, 0.1, 0)
Bloodline3Frame.InputBegan:Connect(function(input)
    if (input.UserInputType == Enum.UserInputType.MouseButton1) then
        if not (Bloodline3Frame:FindFirstChild("Bloodline3ValueLabel").Text == "Locked") then
            Bloodline3Frame:FindFirstChild("Bloodline3ValueLabel").Text = "Locked"
        else
            if (gamepasses.genkai3) then
                Bloodline3Frame:FindFirstChild("Bloodline3ValueLabel").Text = getCurrentValues().bloodline[3]
            else
                Bloodline3Frame:FindFirstChild("Bloodline3ValueLabel").Text = "Not have this gamepass!"
            end

        end

    end
end)

local WIDTH_SLOT = 0.4
local HEIGHT_SLOT = 1
local Bloodline3Label = Instance.new("TextLabel")
Bloodline3Label.Name = "Bloodline3Label"
Bloodline3Label.Parent = Bloodline3Frame
Bloodline3Label.Text = "Bloodline3: "
Bloodline3Label.TextScaled = true
Bloodline3Label.TextColor3 = Color3.fromRGB(255, 0, 0)
Bloodline3Label.Position = UDim2.new(0, 0, 0, 0)
Bloodline3Label.Size = UDim2.new(WIDTH_SLOT - 0.01, 0, HEIGHT_SLOT, 0)
Bloodline3Label.TextWrapped = true
Bloodline3Label.BackgroundTransparency = 1

local Bloodline3ValueLabel = Instance.new("TextLabel")
Bloodline3ValueLabel.Name = "Bloodline3ValueLabel"
Bloodline3ValueLabel.Parent = Bloodline3Frame
Bloodline3ValueLabel.Position = UDim2.new(WIDTH_SLOT, 0, 0, 0)
Bloodline3ValueLabel.Size = UDim2.new(1 - WIDTH_SLOT, 0, HEIGHT_SLOT, 0)
Bloodline3ValueLabel.BorderSizePixel = 0
Bloodline3ValueLabel.Text = "No element!"
Bloodline3ValueLabel.TextScaled = true
Bloodline3ValueLabel.TextWrapped = true

local Bloodline4Frame = Instance.new("Frame")
Bloodline4Frame.Name = "Bloodline4Frame"
Bloodline4Frame.Parent = ToolBoxFrame
Bloodline4Frame.Position = UDim2.new(Bloodline3Frame.Position.X.Scale, 0,
    Bloodline3Frame.Position.Y.Scale + Bloodline3Frame.Size.Y.Scale, 0)
Bloodline4Frame.Size = UDim2.new(WIDTH_SLOT, 0, 0.1, 0)
Bloodline4Frame.InputBegan:Connect(function(input)
    if (input.UserInputType == Enum.UserInputType.MouseButton1) then
        if not (Bloodline4Frame:FindFirstChild("Bloodline4ValueLabel").Text == "Locked") then
            Bloodline4Frame:FindFirstChild("Bloodline4ValueLabel").Text = "Locked"
        else
            if (gamepasses.genkai4) then
                Bloodline4Frame:FindFirstChild("Bloodline4ValueLabel").Text = getCurrentValues().bloodline[4]
            else
                Bloodline4Frame:FindFirstChild("Bloodline4ValueLabel").Text = "Not have this gamepass!"
            end

        end

    end
end)

local WIDTH_SLOT = 0.4
local HEIGHT_SLOT = 1
local Bloodline4Label = Instance.new("TextLabel")
Bloodline4Label.Name = "Bloodline4Label"
Bloodline4Label.Parent = Bloodline4Frame
Bloodline4Label.Text = "Bloodline4: "
Bloodline4Label.TextScaled = true
Bloodline4Label.TextColor3 = Color3.fromRGB(255, 0, 0)
Bloodline4Label.Position = UDim2.new(0, 0, 0, 0)
Bloodline4Label.Size = UDim2.new(WIDTH_SLOT - 0.01, 0, HEIGHT_SLOT, 0)
Bloodline4Label.TextWrapped = true
Bloodline4Label.BackgroundTransparency = 1

local Bloodline4ValueLabel = Instance.new("TextLabel")
Bloodline4ValueLabel.Name = "Bloodline4ValueLabel"
Bloodline4ValueLabel.Parent = Bloodline4Frame
Bloodline4ValueLabel.Position = UDim2.new(WIDTH_SLOT, 0, 0, 0)
Bloodline4ValueLabel.Size = UDim2.new(1 - WIDTH_SLOT, 0, HEIGHT_SLOT, 0)
Bloodline4ValueLabel.BorderSizePixel = 0
Bloodline4ValueLabel.Text = "No element!"
Bloodline4ValueLabel.TextScaled = true
Bloodline4ValueLabel.TextWrapped = true

local StopSpinFrame = Instance.new("Frame")
StopSpinFrame.Name = "StopSpinFrame"
StopSpinFrame.Parent = ToolBoxFrame
StopSpinFrame.Position = UDim2.new(0.1, 0, 0.75, 0)
StopSpinFrame.Size = UDim2.new(WIDTH_SLOT + 0.2, 0, 0.15, 0)
StopSpinFrame.BorderSizePixel = 0

local StopSpinLabel = Instance.new("TextLabel")
StopSpinLabel.Name = "StopSpinLabel"
StopSpinLabel.Parent = StopSpinFrame
StopSpinLabel.Position = UDim2.new(0, 0, 0, 0)
StopSpinLabel.Size = UDim2.new(0.3, 0, 1, 0)
StopSpinLabel.BorderSizePixel = 0
StopSpinLabel.Text = "Stop at:"
StopSpinLabel.TextScaled = true
StopSpinLabel.TextWrapped = true

local StopSpinScrollFrame = Instance.new("ScrollingFrame")
StopSpinScrollFrame.Name = "StopSpinScrollFrame"
StopSpinScrollFrame.Parent = StopSpinFrame
StopSpinScrollFrame.Position = UDim2.new(StopSpinLabel.Size.X.Scale, 0, 0, 0)
StopSpinScrollFrame.Size = UDim2.new(1 - StopSpinLabel.Size.X.Scale, 0, 1, 0)
StopSpinScrollFrame.BorderSizePixel = 0
StopSpinScrollFrame.TopImage = "rbxassetid://12943960083"
StopSpinScrollFrame.MidImage = "rbxassetid://12943960083"
StopSpinScrollFrame.BottomImage = "rbxassetid://12943960083"
StopSpinScrollFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
StopSpinScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
StopSpinScrollFrame.ScrollBarThickness = 10
Instance.new("UIListLayout").Parent = StopSpinScrollFrame

local SpinBtn = Instance.new("TextButton")
SpinBtn.Name = "SpinBtn"
SpinBtn.Parent = ToolBoxFrame
SpinBtn.Text = "Spin"
SpinBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SpinBtn.Position = UDim2.new(WIDTH_SLOT + StopSpinFrame.Position.X.Scale + 0.2, 0, StopSpinFrame.Position.Y.Scale, 0)
SpinBtn.Size = UDim2.new(0.2, 0, StopSpinFrame.Size.Y.Scale, 0)
SpinBtn.BorderSizePixel = 0
SpinBtn.TextScaled = true
SpinBtn.TextWrapped = true
SpinBtn.Activated:Connect(function()
    SpinBtn.Selected = not SpinBtn.Selected
    if (SpinBtn.Selected) then
        SpinBtn.Text = "Spinning..."
        SpinBtn.TextColor3 = Color3.fromRGB(100, 255, 0)
        isSpin = true
        spin()
    else
        SpinBtn.Text = "Spin"
        SpinBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        isSpin = false
    end
end)

stop_spin_choose_scroll_frame = Instance.new("ScrollingFrame")
stop_spin_choose_scroll_frame.Name = "stop_spin_choose_scroll_frame"
stop_spin_choose_scroll_frame.Parent = ToolBoxFrame
stop_spin_choose_scroll_frame.Position = UDim2.new(0.1, 0, SpinBtn.Position.Y.Scale + SpinBtn.Size.Y.Scale, 0)
stop_spin_choose_scroll_frame.Size = UDim2.new(0.8, 0, 0.1, 0)
stop_spin_choose_scroll_frame.BorderSizePixel = 0
stop_spin_choose_scroll_frame.BackgroundColor3 = Color3.fromRGB(88, 80, 80)
stop_spin_choose_scroll_frame.TopImage = "rbxassetid://12943960083"
stop_spin_choose_scroll_frame.MidImage = "rbxassetid://12943960083"
stop_spin_choose_scroll_frame.BottomImage = "rbxassetid://12943960083"
stop_spin_choose_scroll_frame.AutomaticCanvasSize = Enum.AutomaticSize.X
stop_spin_choose_scroll_frame.CanvasSize = UDim2.new(0, 0, 0, 0)
stop_spin_choose_scroll_frame.ScrollBarThickness = 2
local a = Instance.new("UIListLayout")
a.Parent = stop_spin_choose_scroll_frame
a.FillDirection = Enum.FillDirection.Horizontal

local GUI = ToolBoxFrame
local dragging = nil
local dragInput = nil
local dragStart = nil
local startPos = nil

local function update(input)
    local delta = input.Position - dragStart
    GUI.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale,
        startPos.Y.Offset + delta.Y)
end

MoveGUIBtn.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = GUI.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

MoveGUIBtn.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

local function getAllValues(alljutsu)
    local result = {}
    local resultDisplay = {}
    local currentIndex = #result + 1
    for _, v in pairs(alljutsu:GetChildren()) do
        if v:FindFirstChild(string.upper("kg")) then
            resultDisplay[currentIndex] = v:FindFirstChild(string.upper("realname")).Value
            result[currentIndex] = v.Name
            currentIndex = currentIndex + 1
        end
        if v:FindFirstChild(string.upper("element")) then
            resultDisplay[currentIndex] = v:FindFirstChild(string.upper("realname")).Value
            result[currentIndex] = v.Name
            currentIndex = currentIndex + 1
        end
    end
    return result, resultDisplay
end

local function getDisplayName(name)
    local data, dataDisplay = getAllValues(alljutsu)
    for k, v in pairs(data) do
        if (string.upper(v) == string.upper(name)) then
            return dataDisplay[k]
        end
    end
end

local function getName(displayname)
    local data, dataDisplay = getAllValues(alljutsu)
    for k, v in pairs(dataDisplay) do
        if (string.upper(v) == string.upper(displayname)) then
            return data[k]
        end
    end
end

function getCurrentValues()
    local main = statz:FindFirstChild("main")
    local e1, e2, e3, e4
    local b1, b2, b3, b4
    e1 = getDisplayName(main:FindFirstChild("element1").Value)
    e2 = getDisplayName(main:FindFirstChild("element2").Value)
    if (gamepasses.element3) then
        e3 = getDisplayName(main:FindFirstChild("element3").Value)
        if (gamepasses.element4) then
            e4 = getDisplayName(main:FindFirstChild("element4").Value)
        end
    end

    b1 = getDisplayName(main:FindFirstChild("kg1").Value)
    b2 = getDisplayName(main:FindFirstChild("kg2").Value)
    if (gamepasses.genkai3) then
        b3 = getDisplayName(main:FindFirstChild("kg3").Value)
        if (gamepasses.genkai4) then
            b4 = getDisplayName(main:FindFirstChild("kg4").Value)
        end
    end
    return {
        element = {e1, e2, e3, e4},
        bloodline = {b1, b2, b3, b4}
    }
end

function setValues(currentValues)
    currentValues = currentValues or getCurrentValues()
    -- Element loop
    local element = currentValues.element
    local bloodline = currentValues.bloodline
    for i = 1, 4 do
        if (element[i]) then
            if (ToolBoxGUI.Frame:WaitForChild("Element" .. i .. "Frame", TIME_OUT):WaitForChild("Element" .. i ..
                                                                                                    "ValueLabel",
                TIME_OUT).Text ~= "Locked") then
                ToolBoxGUI.Frame:WaitForChild("Element" .. i .. "Frame", TIME_OUT):WaitForChild("Element" .. i ..
                                                                                                    "ValueLabel",
                    TIME_OUT).Text = element[i]
            end
        end
    end
    for i = 1, 4 do
        if (bloodline[i]) then
            if (ToolBoxGUI.Frame:WaitForChild("Bloodline" .. i .. "Frame", TIME_OUT):WaitForChild("Bloodline" .. i ..
                                                                                                      "ValueLabel",
                TIME_OUT).Text ~= "Locked") then
                ToolBoxGUI.Frame:WaitForChild("Bloodline" .. i .. "Frame", TIME_OUT):WaitForChild("Bloodline" .. i ..
                                                                                                      "ValueLabel",
                    TIME_OUT).Text = bloodline[i]
            end
        end
    end
end

local function initValues(currentValues)
    if (not gamepasses.genkai4) then
        if (not gamepasses.genkai3) then
            ToolBoxGUI.Frame.Bloodline4Frame.Bloodline4ValueLabel.Text = "Not have this gamepass!"
            ToolBoxGUI.Frame.Bloodline4Frame.Active = false
            ToolBoxGUI.Frame.Bloodline3Frame.Bloodline3ValueLabel.Text = "Not have this gamepass!"
            ToolBoxGUI.Frame.Bloodline3Frame.Active = false

        else
            ToolBoxGUI.Frame.Bloodline4Frame.Bloodline4ValueLabel.Text = "Not have this gamepass!"
            ToolBoxGUI.Frame.Bloodline4Frame.Active = false
        end
    end
    if (not gamepasses.element4) then
        if (not gamepasses.element4) then
            ToolBoxGUI.Frame.Element4Frame.Element4ValueLabel.Text = "Not have this gamepass!"
            ToolBoxGUI.Frame.Element4Frame.Active = false
            ToolBoxGUI.Frame.Element3Frame.Element3ValueLabel.Text = "Not have this gamepass!"
            ToolBoxGUI.Frame.Element3Frame.Active = false

        else
            ToolBoxGUI.Frame.Element4Frame.Element4ValueLabel.Text = "Not have this gamepass!"
            ToolBoxGUI.Frame.Element4Frame.Active = false
        end
    end
    setValues(currentValues)
    local _, dataDisplay = getAllValues(alljutsu)
    for k, v in pairs(dataDisplay) do
        createMenuList("btn" .. tostring(k), v, StopSpinScrollFrame)
    end
end

function startSpinSupport(name, chosenItems)
    local result = false
    for _, v in pairs(chosenItems) do
        if (v.Name ~= "UIListLayout") then
            if (name == v.Text) then
                result = true
            end
        end
    end
    return result
end

function startSpin(chosenItems)
    local isE1 = false
    local isE2 = false
    local isE3 = false
    local isE4 = false
    local isB1 = false
    local isB2 = false
    local isB3 = false
    local isB4 = false
    if Element1ValueLabel.Text ~= "Locked" and isSpin then
        if (chosenItems) then
            if not startSpinSupport(Element1ValueLabel.Text, chosenItems) then
                isE1 = true
            end
        else
            isE1 = true
        end
    end

    if Element2ValueLabel.Text ~= "Locked" and isSpin then
        if (chosenItems) then
            if not startSpinSupport(Element2ValueLabel.Text, chosenItems) then
                isE2 = true
            end
        else
            isE2 = true
        end

    end
    if Element3ValueLabel.Text ~= "Locked" and gamepasses.element3 and isSpin then
        if (chosenItems) then
            if not startSpinSupport(Element3ValueLabel.Text, chosenItems) then
                isE3 = true
            end
        else
            isE3 = true
        end

    end
    if Element4ValueLabel.Text ~= "Locked" and gamepasses.element4 and isSpin then
        if (chosenItems) then
            if not startSpinSupport(Element4ValueLabel.Text, chosenItems) then
                isE4 = true
            end
        else
            isE4 = true
        end

    end
    if Bloodline1ValueLabel.Text ~= "Locked" and isSpin then
        if (chosenItems) then
            if not startSpinSupport(Bloodline1ValueLabel.Text, chosenItems) then
                isB1 = true
            end
        else
            isB1 = true
        end

    end
    if Bloodline2ValueLabel.Text ~= "Locked" and isSpin then
        if (chosenItems) then
            if not startSpinSupport(Bloodline2ValueLabel.Text, chosenItems) then
                isB2 = true
            end
        else
            isB2 = true
        end

    end
    if Bloodline3ValueLabel.Text ~= "Locked" and gamepasses.genkai3 and isSpin then
        if (chosenItems) then
            if not startSpinSupport(Bloodline3ValueLabel.Text, chosenItems) then
                isB3 = true
            end
        else
            isB3 = true
        end

    end
    if Bloodline4ValueLabel.Text ~= "Locked" and gamepasses.genkai4 and isSpin then
        if (chosenItems) then
            if not startSpinSupport(Bloodline4ValueLabel.Text, chosenItems) then
                isB4 = true
            end
        else
            isB4 = true
        end

    end

    if (statz:FindFirstChild("spins").Value > 0) then
        if isE1 or isE2 or isE3 or isE4 or isB1 or isB2 or isB3 or isB4 then

            if (isE1 and not statz:FindFirstChild("main"):FindFirstChild("element1"):FindFirstChild("dontspin")) then
                startevent:FireServer("spin", "element1")
            end
            if (isE2 and not statz:FindFirstChild("main"):FindFirstChild("element2"):FindFirstChild("dontspin")) then
                startevent:FireServer("spin", "element2")
            end
            if (isE3 and not statz:FindFirstChild("main"):FindFirstChild("element3"):FindFirstChild("dontspin")) then
                startevent:FireServer("spin", "element3")
            end
            if (isE4 and not statz:FindFirstChild("main"):FindFirstChild("element4"):FindFirstChild("dontspin")) then
                startevent:FireServer("spin", "element4")
            end

            if (isB1 and not statz:FindFirstChild("main"):FindFirstChild("kg1"):FindFirstChild("dontspin")) then
                startevent:FireServer("spin", "kg1")
            end
            if (isB2 and not statz:FindFirstChild("main"):FindFirstChild("kg2"):FindFirstChild("dontspin")) then
                startevent:FireServer("spin", "kg2")
            end
            if (isB3 and not statz:FindFirstChild("main"):FindFirstChild("kg3"):FindFirstChild("dontspin")) then
                startevent:FireServer("spin", "kg3")
            end
            if (isB4 and not statz:FindFirstChild("main"):FindFirstChild("kg4"):FindFirstChild("dontspin")) then
                startevent:FireServer("spin", "kg4")
            end
        else
            SpinBtn.Selected = not SpinBtn.Selected
            if (SpinBtn.Selected) then
                SpinBtn.Text = "Spinning..."
                SpinBtn.TextColor3 = Color3.fromRGB(100, 255, 0)
                isSpin = true
            else
                SpinBtn.Text = "Spin"
                SpinBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
                isSpin = false
            end
        end
    else
        SpinBtn.Selected = not SpinBtn.Selected
        if (SpinBtn.Selected) then
            SpinBtn.Text = "Spinning..."
            SpinBtn.TextColor3 = Color3.fromRGB(100, 255, 0)
            isSpin = true
        else
            SpinBtn.Text = "Spin"
            SpinBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
            isSpin = false
        end
    end

end

local function spinWithChosen(chosenItems)
    local element = getCurrentValues().element
    local bloodline = getCurrentValues().bloodline
    for i = 1, 4 do
        if (element[i]) then
            if (ToolBoxGUI.Frame:WaitForChild("Element" .. i .. "Frame", TIME_OUT):WaitForChild("Element" .. i ..
                                                                                                    "ValueLabel",
                TIME_OUT).Text ~= "Locked") then
                for _, v in pairs(chosenItems) do
                    if (v.Name ~= "UIListLayout") then
                        if (v.Text == element[i]) then
                            v:Remove()
                            for k1, v1 in pairs(StopSpinScrollFrame:GetChildren()) do
                                if (v1.Name ~= "UIListLayout") then
                                    if (v1.Text == element[i]) then
                                        v1.TextColor3 = Color3.fromRGB(50, 0, 255)
                                        v1:SetAttribute("checked", not v:GetAttribute("checked"))
                                        ToolBoxGUI.Frame:WaitForChild("Element" .. i .. "Frame", TIME_OUT):WaitForChild(
                                            "Element" .. i .. "ValueLabel", TIME_OUT).Text = "Locked"
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    for i = 1, 4 do
        if (bloodline[i]) then
            if (ToolBoxGUI.Frame:WaitForChild("Bloodline" .. i .. "Frame", TIME_OUT):WaitForChild("Bloodline" .. i ..
                                                                                                      "ValueLabel",
                TIME_OUT).Text ~= "Locked") then
                for _, v in pairs(chosenItems) do
                    if (v.Name ~= "UIListLayout") then
                        if (v.Text == bloodline[i]) then
                            v:Remove()
                            for k1, v1 in pairs(StopSpinScrollFrame:GetChildren()) do
                                if (v1.Name ~= "UIListLayout") then
                                    if (v1.Text == bloodline[i]) then
                                        v1.TextColor3 = Color3.fromRGB(50, 0, 255)
                                        v1:SetAttribute("checked", not v:GetAttribute("checked"))
                                        ToolBoxGUI.Frame:WaitForChild("Bloodline" .. i .. "Frame", TIME_OUT)
                                            :WaitForChild("Bloodline" .. i .. "ValueLabel", TIME_OUT).Text = "Locked"
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    local count = -1
    chosenItems = stop_spin_choose_scroll_frame:GetChildren()
    for k, v in pairs(chosenItems) do
        if v.Name then
            count = count + 1
        end

    end

    if count == 0 then
        SpinBtn.Text = "Spin"
        SpinBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        isSpin = false
        isChosen = false
    end
end

local function spinDefault()
    startSpin()
end

function spin()
    while (isSpin) do
        local count = -1
        local choosenItems = stop_spin_choose_scroll_frame:GetChildren()
        for k, v in pairs(choosenItems) do
            if v.Name then
                count = count + 1
            end

        end

        if count > 0 then
            spinWithChosen(choosenItems)
            startSpin(choosenItems)
            isChosen = true
        else
            if (not isChosen) then
                spinDefault()
            else
                SpinBtn.Text = "Spin"
                SpinBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
                isSpin = false
                isChosen = false
            end
        end

        task.wait(0.2)
    end
end

local LocalPlayer = game.Players.LocalPlayer
local main = LocalPlayer.PlayerGui:WaitForChild("Main", TIME_OUT)
statz = LocalPlayer:WaitForChild("statz", TIME_OUT)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
alljutsu = ReplicatedStorage:WaitForChild("alljutsu", TIME_OUT)
startevent = LocalPlayer:WaitForChild("startevent", TIME_OUT)
ToolBoxGUI = LocalPlayer.PlayerGui:WaitForChild("ToolBox", TIME_OUT)

gamepasses = {
    genkai3 = LocalPlayer:WaitForChild("gamepasses", TIME_OUT):FindFirstChild("genkai3"),
    genkai4 = LocalPlayer:WaitForChild("gamepasses", TIME_OUT):FindFirstChild("genkai4"),
    element3 = LocalPlayer:WaitForChild("gamepasses", TIME_OUT):FindFirstChild("element3"),
    element4 = LocalPlayer:WaitForChild("gamepasses", TIME_OUT):FindFirstChild("element4")
}
local stop_spin_data = getAllValues(alljutsu)

local function setSpinnedLabel()
    local text = "Spinned: " .. (initialSpin.bloodline + initialSpin.element) .. "(" .. (initialSpin.bloodline) ..
                     " bloodlines, " .. (initialSpin.element) .. " elements)"
    SpinnedLabel.Text = text
end
local function initConnection()
    statz:FindFirstChild("main"):FindFirstChild("kg1").Changed:Connect(function()
        setValues()
        initialSpin.bloodline = initialSpin.bloodline + 1
        setSpinnedLabel()
    end)
    statz:FindFirstChild("main"):FindFirstChild("kg2").Changed:Connect(function()
        setValues()
        initialSpin.bloodline = initialSpin.bloodline + 1
        setSpinnedLabel()
    end)
    if (gamepasses.genkai3) then
        statz:FindFirstChild("main"):FindFirstChild("kg3").Changed:Connect(function()
            setValues()
            initialSpin.bloodline = initialSpin.bloodline + 1
            setSpinnedLabel()
        end)
        if (gamepasses.genkai4) then
            statz:FindFirstChild("main"):FindFirstChild("kg4").Changed:Connect(function()
                setValues()
                initialSpin.bloodline = initialSpin.bloodline + 1
                setSpinnedLabel()
            end)
        end
    end

    statz:FindFirstChild("main"):FindFirstChild("element1").Changed:Connect(function()
        setValues()
        initialSpin.element = initialSpin.element + 1
        setSpinnedLabel()
    end)
    statz:FindFirstChild("main"):FindFirstChild("element2").Changed:Connect(function()
        setValues()
        initialSpin.element = initialSpin.element + 1
        setSpinnedLabel()
    end)
    if (gamepasses.element3) then
        statz:FindFirstChild("main"):FindFirstChild("element3").Changed:Connect(function()
            setValues()
            initialSpin.element = initialSpin.element + 1
            setSpinnedLabel()
        end)
        if (gamepasses.element4) then
            statz:FindFirstChild("main"):FindFirstChild("element4").Changed:Connect(function()
                setValues()
                initialSpin.element = initialSpin.element + 1
                setSpinnedLabel()
            end)
        end
    end

end
local function InitGUI(gamepasses)
    initValues(getCurrentValues())
    initConnection()

end

InitGUI(gamepasses)

