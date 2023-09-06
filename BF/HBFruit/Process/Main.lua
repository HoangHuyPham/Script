-- Version: 1.0(Beta)
repeat task.wait() until game:IsLoaded() and KRNL_LOADED and game.GameId == 994732206
task.wait(3)

if (_G.HBFruit) then return end
local initialTime = os.clock()
local delayTime = 0.5
local JSON = loadstring(game:HttpGet("https://raw.githubusercontent.com/HoangHuyPham/Script/master/jsonLib", true))()
local TeleportService = game:GetService("TeleportService")
local VirtualUser = game:GetService("VirtualUser")
local LocalPlayer = game:GetService("Players").LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local SCRIPT_ID = "HBFruit"
local UI = loadstring(game:HttpGet("https://raw.githubusercontent.com/HoangHuyPham/Script/testui/BF/HBFruit/UI/Main.lua", true))
delay(delayTime,function()
	UI()
end)
task.wait(delayTime)

if JSON and TeleportService and VirtualUser and LocalPlayer and UI then
	warn("Loading script successful!", os.clock()-initialTime.."s")
else
	warn("Can't load script!")
	return
end 


_G.HBFruit = {}
_G.HBFruit.Variable = {}
_G.HBFruit.Function = {}
_G.HBFruit.Coroutine = {}

_G.HBFruit.Variable.Enum = {}
_G.HBFruit.Variable.Enum.Sea1 = 2753915549
_G.HBFruit.Variable.Enum.Sea2 = 4442272183
_G.HBFruit.Variable.Enum.Sea3 = 7449423635
_G.HBFruit.Variable.Enum.Pirate = 1
_G.HBFruit.Variable.Enum.Marine = 2


_G.HBFruit.Variable.IsFastMode = false
_G.HBFruit.Variable.LootedChest = 0
_G.HBFruit.Variable.Update = {}
_G.HBFruit.Variable.Update.FarmChest = false
_G.HBFruit.Variable.Update.FastMode = false
_G.HBFruit.Variable.Update.LockFPS = false
_G.HBFruit.Variable.Update.StopAtBeli = -1
_G.HBFruit.Variable.Update.HopAtChest = 20
_G.HBFruit.Variable.Update.StopAtFist = false
_G.HBFruit.Variable.Update.StopAtChalice = false
_G.HBFruit.Variable.Update.Sea = -1
if (game.PlaceId == _G.HBFruit.Variable.Enum.Sea1) then
	_G.HBFruit.Variable.Update.Sea = 1
elseif(game.PlaceId == _G.HBFruit.Variable.Enum.Sea2) then
	_G.HBFruit.Variable.Update.Sea = 2
elseif(game.PlaceId == _G.HBFruit.Variable.Enum.Sea3) then
	_G.HBFruit.Variable.Update.Sea = 3
end
 

_G.HBFruit.Coroutine.AntiAFK = coroutine.create(function()
	while true do
		task.wait(60*5)
		VirtualUser:Button1Down(Vector2.new(0,0), game:GetService("Workspace").CurrentCamera.CFrame)
		VirtualUser:Button1Up(Vector2.new(0,0), game:GetService("Workspace").CurrentCamera.CFrame)
		warn("Anti AFK is activated!")
	end
end)

_G.HBFruit.Coroutine.UpdateVariable = coroutine.create(function()
	while true do
		pcall(function()
			task.wait(1)
			_G.HBFruit.Variable.Update.FarmChest = LocalPlayer.PlayerGui.HBFruit.background.container.farmChest.ImageButton.Selected
			_G.HBFruit.Variable.Update.FastMode = LocalPlayer.PlayerGui.HBFruit.background.container.fastMode.ImageButton.Selected
			_G.HBFruit.Variable.Update.LockFPS = LocalPlayer.PlayerGui.HBFruit.background.container.lockFPS.ImageButton.Selected
			_G.HBFruit.Variable.Update.StopAtFist = LocalPlayer.PlayerGui.HBFruit.background.container.stopAtFist.ImageButton.Selected
			_G.HBFruit.Variable.Update.StopAtChalice = LocalPlayer.PlayerGui.HBFruit.background.container.stopAtChalice.ImageButton.Selected
			local beli = tonumber(LocalPlayer.PlayerGui.HBFruit.background.container.stopAtBeli.TextBox.Text)
			local chest = tonumber(LocalPlayer.PlayerGui.HBFruit.background.container.hopAtChest.TextBox.Text)
			if (beli) then
				_G.HBFruit.Variable.Update.StopAtBeli = beli
			end
			if (chest) then
				_G.HBFruit.Variable.Update.HopAtChest = chest
			end
		end)
	end
end)

_G.HBFruit.Coroutine.LockFPS = coroutine.create(function()
	while true do
		pcall(function()
			repeat task.wait(8) if (not LocalPlayer.PlayerGui.HBFruit.background.container.lockFPS.ImageButton.Selected) then setfpscap(240) end until LocalPlayer.PlayerGui.HBFruit.background.container.lockFPS.ImageButton.Selected
			setfpscap(30)
		end)
	end
end)

_G.HBFruit.Coroutine.FastMode = coroutine.create(function()
	while true do
		pcall(function()
			repeat task.wait(8) until _G.HBFruit.Variable.Update.FastMode and not _G.HBFruit.Variable.IsFastMode
			for _,v in pairs(game:GetService("Workspace"):GetDescendants()) do
				if (v:IsA("Part") or v:IsA("UnionOperation")) and not (v:FindFirstAncestor(LocalPlayer.Name) or v:FindFirstAncestor(LocalPlayer.DisplayName)) then
					v.Material = Enum.Material.SmoothPlastic
				elseif v:IsA("Texture") then
					v:Destroy()	
				end
			end
			warn("Fast mode is active!(HBFruit)")
			_G.HBFruit.Variable.IsFastMode = true
		end)
	end
end)

_G.HBFruit.Coroutine.FarmChest = coroutine.create(function()
	local Chest = nil
	while true do
		repeat task.wait(0.05) if(_G.HBFruit.Variable.Update.FarmChest) then Chest = _G.HBFruit.Function:GetChestSub() end until Chest and _G.HBFruit.Variable.Update.FarmChest
		if not (_G.HBFruit.Function:checkBeforeLootChest()) then
			continue
		end
		_G.HBFruit.Function:LootChestSub(Chest.Position)
		if not (Chest == _G.HBFruit.Function:GetChestSub()) then
			_G.HBFruit.Variable.LootedChest+=1
		end
		if (_G.HBFruit.Variable.LootedChest%5 ==0) then
			LocalPlayer.Character.Humanoid.RigType = Enum.HumanoidRigType.R6
			LocalPlayer.CharacterAdded:Wait()
			task.wait(1)
		end
	end
end)

function _G.HBFruit.Coroutine:Release()
	for _,v in pairs(self) do
		if (typeof(v)=="thread") then
			repeat task.wait(1) until coroutine.close(v)
		end
	end
end

function _G.HBFruit.Function:checkBeforeLootChest()
	if (_G.HBFruit.Variable.Update.HopAtChest ~= -1) then
		if (_G.HBFruit.Variable.LootedChest >= _G.HBFruit.Variable.Update.HopAtChest) then
			_G.HBFruit.Function:HopServer(true)
		end
	end

	if (_G.HBFruit.Variable.Update.StopAtBeli ~= -1) then
		if (LocalPlayer:WaitForChild("Data", 3):FindFirstChild("Beli").Value >= _G.HBFruit.Variable.Update.StopAtBeli) then
			pcall(function()
				_G.HBFruit.Function:notify(string.format("Beli is enough: %d!", LocalPlayer:WaitForChild("Data", 3):FindFirstChild("Beli").Value))
			end)
			task.wait(3)
			return false
		end
	end
	if (_G.HBFruit.Variable.Update.StopAtFist) then
		for _,v in pairs(LocalPlayer.Backpack:GetDescendants()) do
			if (v:IsA("Tool")) then
				if (string.find(string.upper(v.Name), "FIST", 1, false)) then
					pcall(function()
						_G.HBFruit.Function:notify("Found fist of darkness!")
					end)
					task.wait(3)
					return false
				end
			end
		end
	end
	if (_G.HBFruit.Variable.Update.StopAtChalice) then
		for _,v in pairs(LocalPlayer.Backpack:GetDescendants()) do
			if (v:IsA("Tool")) then
				if (string.find(string.upper(v.Name), "CHALICE", 1, false)) then
					pcall(function()
						_G.HBFruit.Function:notify("Found god chalice!")
					end)
					task.wait(3)
					return false
				end
			end
		end
	end
	
	return true
end

function _G.HBFruit.Function:saveDataUI(pagination, farmChest, fastMode, lockFPS, stopBeliAt, hopChestAt, stopAtFist, stopAtChalice)
	_G.HBFruit.Function:preProcessData()
	local custom = {
		ui = {
			container = {
				farmChest = farmChest or false,
				fastMode = fastMode or false,
				lockFPS = lockFPS or false,
				stopAtBeli = stopBeliAt or -1,
				hopChestAt = hopChestAt or -1,
				stopAtFist = stopAtFist or true,
				stopAtChalice = stopAtChalice or true
			},
			pagination = pagination
		}
	}
	writefile(SCRIPT_ID.."/"..LocalPlayer.Name.."/data.json", JSON.encode(custom))
end

function _G.HBFruit.Function:loadDataUI()
	_G.HBFruit.Function:preProcessData()
	local data = JSON.decode(readfile(SCRIPT_ID.."/"..LocalPlayer.Name.."/data.json"))
	local args = {
		[1] = data.ui.pagination,
		[2] = data.ui.container.farmChest,
		[3] = data.ui.container.fastMode,
		[4] = data.ui.container.lockFPS,
		[5] = data.ui.container.stopAtBeli,
		[6] = data.ui.container.hopChestAt,
		[7] = data.ui.container.stopAtFist,
		[8] = data.ui.container.stopAtChalice
	}
	return unpack(args)
end

function _G.HBFruit.Function:preProcessData()
	if (isfile(SCRIPT_ID.."/"..LocalPlayer.Name.."/data.json") and isfile(SCRIPT_ID.."/"..LocalPlayer.Name.."/hopservers.temp")) then
		return
	else
		local default = {
			ui = {
				container = {
					farmChest = false,
					fastMode = false,
					lockFPS = false,
					stopAtBeli = -1,
					hopChestAt = -1,
					stopAtFist = true,
					stopAtChalice = true
				},
				pagination = 0
			}
		}
		makefolder(SCRIPT_ID.."/"..LocalPlayer.Name)
		writefile(SCRIPT_ID.."/"..LocalPlayer.Name.."/hopservers.temp", _G.HBFruit.Function:Stringify({}))
		writefile(SCRIPT_ID.."/"..LocalPlayer.Name.."/data.json", JSON.encode(default))
	end
end

function _G.HBFruit.Function:TPToSea(sea)
	local args = {}
	if (sea == 1) then
		args[1] = "TravelMain"
	elseif (sea == 2) then
		args[1] = "TravelDressrosa"
	elseif (sea == 3) then
		args[1] = "TravelZou"
	end
	game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
end

function _G.HBFruit.Function:HopServer(isLow)
	_G.HBFruit.Function:preProcessData()
	local data = loadfile(SCRIPT_ID.."/"..LocalPlayer.Name.."/hopservers.temp")()

	if (#data >= 20) then
		writefile(SCRIPT_ID.."/"..LocalPlayer.Name.."/hopservers.temp", _G.HBFruit.Function:Stringify({}))
		local server = nil
		repeat server = _G.HBFruit.Function:GetBestServer(isLow) task.wait(1) until server and not table.find(data,server.id, 1)
		table.insert(data, server.id)
		writefile(SCRIPT_ID.."/"..LocalPlayer.Name.."/hopservers.temp", _G.HBFruit.Function:Stringify(data))
		warn(server.id, "ping: "..server.ping)
		local TeleportService = game:GetService("TeleportService")
		TeleportService:TeleportToPlaceInstance(game.PlaceId, server.id, game.Players.LocalPlayer)
	else
		local server = nil
		repeat server = _G.HBFruit.Function:GetBestServer(isLow) task.wait(1) until server and not table.find(data,server.id, 1) 
		table.insert(data, server.id)
		writefile(SCRIPT_ID.."/"..LocalPlayer.Name.."/hopservers.temp", _G.HBFruit.Function:Stringify(data))
		warn(server.id, "ping: "..server.ping)
		local TeleportService = game:GetService("TeleportService")
		TeleportService:TeleportToPlaceInstance(game.PlaceId, server.id, game.Players.LocalPlayer)
	end	
end

function _G.HBFruit.Function:Stringify(tableA)
	local res = "return {"
	for k,v in ipairs(tableA) do
		if (k<#tableA) then
			res = res .. "\"" .. tableA[k].. "\"" .. ","
		else
			res = res .. "\"" .. tableA[k].. "\""
		end
	end
	res = res.."}"
	return res
end

function _G.HBFruit.Function:GetBestServer(isLow)
	local requestURL = nil
	if (isLow) then
		requestURL = JSON.decode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?cursor=".."".."&sortOrder=Asc&excludeFullGames=true",true))
	else
		requestURL = JSON.decode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?cursor=".."".."&sortOrder=Desc&excludeFullGames=true",true))
	end
	local bestServer = requestURL.data[1]
	for _,v in pairs(requestURL.data) do
		if (v.ping < bestServer.ping) then
			bestServer = v
		end
	end	
	return bestServer
end

function _G.HBFruit.Function:ChangeSide(side)
	local args={
		[1] = "SetTeam"
	}
	if (LocalPlayer.PlayerGui:FindFirstChild("ChooseTeam", true)) then
		LocalPlayer.PlayerGui:FindFirstChild("ChooseTeam", true):Destroy()
		LocalPlayer.PlayerGui:WaitForChild("Main"):FindFirstChild("Code").Visible = true
		LocalPlayer.PlayerGui:WaitForChild("Main"):FindFirstChild("HomeButton").Visible = true
		LocalPlayer.PlayerGui:WaitForChild("Main"):FindFirstChild("Mute").Visible = true
		LocalPlayer.PlayerGui:WaitForChild("Main"):FindFirstChild("Settings").Visible = true
		LocalPlayer.PlayerGui:WaitForChild("Main"):FindFirstChild("AlliesButton").Visible = true
		LocalPlayer.PlayerGui:WaitForChild("Main"):FindFirstChild("Beli").Visible = true
		LocalPlayer.PlayerGui:WaitForChild("Main"):FindFirstChild("Fragments").Visible = true
		LocalPlayer.PlayerGui:WaitForChild("Main"):FindFirstChild("Level").Visible = true
		LocalPlayer.PlayerGui:WaitForChild("Main"):FindFirstChild("HP").Visible = true
		LocalPlayer.PlayerGui:WaitForChild("Main"):FindFirstChild("Energy").Visible = true
		LocalPlayer.PlayerGui:WaitForChild("Main"):FindFirstChild("MenuButton").Visible = true
		LocalPlayer.PlayerGui:WaitForChild("Main"):FindFirstChild("Compass").Visible = true

		game:GetService("Workspace").CurrentCamera.CameraType = Enum.CameraType.Custom
	end
	if (side==1) then
		args[2] = "Pirates"
	elseif (side==2) then
		args[2] = "Marines"
	end
	game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
end

function _G.HBFruit.Function:LootChestSub(position, isChalice, isFist)
	if not position or isChalice or isFist then
		return false
	end
	for i=1, 3,0.6 do
		task.wait(0.025)
		game:GetService("Players").LocalPlayer.Character:PivotTo(CFrame.new()+position+Vector3.new(0,i,0))
	end
	for i=3, 1, -0.6 do
		task.wait(0.025)
		game:GetService("Players").LocalPlayer.Character:PivotTo(CFrame.new()+position+Vector3.new(0,i,0))
	end
	task.wait(0.25)
	return true
end

function _G.HBFruit.Function:GetChestSub()
	for _,v in pairs(game:GetService("Workspace"):GetDescendants()) do
		if (v:IsA("Part") and string.find(string.upper(v.Name), "CHEST[2-3]", 1, false)) then
			return v
		end
	end
	for _,v in pairs(ReplicatedStorage:GetDescendants()) do
		if (v:IsA("Part") and string.find(string.upper(v.Name), "CHEST[2-3]", 1, false)) then
			return v
		end
	end
	return nil
end




_G.HBFruit.Variable.IsReady = true
coroutine.resume(_G.HBFruit.Coroutine.AntiAFK)
coroutine.resume(_G.HBFruit.Coroutine.LockFPS)
coroutine.resume(_G.HBFruit.Coroutine.FastMode)
coroutine.resume(_G.HBFruit.Coroutine.FarmChest)
coroutine.resume(_G.HBFruit.Coroutine.UpdateVariable)

delay(delayTime, function()
	if (LocalPlayer.PlayerGui:FindFirstChild("ChooseTeam", true)) then
		if (_G.Side == "Pirates") then
			_G.HBFruit.Function:ChangeSide(1)
		else
			_G.HBFruit.Function:ChangeSide(2)
		end
	end
end)


--local RS = game:GetService("RunService")
--local Frames = 0
--RS.RenderStepped:Connect(function()
--	Frames += 1
--end)
--while true do
--	task.wait(1)
--	print("FPS: "..Frames)
--	Frames = 0
--end

--local args = {}
--args[1] = "Cousin"
--args[2] = "Buy"
--args[2] = "Check"

--game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
