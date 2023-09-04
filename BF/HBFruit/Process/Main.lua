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
local SCRIPT_ID = "HBFruit"
local UI = nil
coroutine.resume(coroutine.create(function()
	UI = loadstring(game:HttpGet("https://raw.githubusercontent.com/HoangHuyPham/Script/testui/BF/HBFruit/UI/Main.lua", true))()
end))
task.wait(1)

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
_G.HBFruit.Variable.Enum.Sea1 = 1
_G.HBFruit.Variable.Enum.Sea2 = 2
_G.HBFruit.Variable.Enum.Sea3 = 3

_G.HBFruit.Coroutine.AntiAFK = coroutine.create(function()
	while true do
		task.wait(60*5)
		VirtualUser:Button1Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
		VirtualUser:Button1Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
		warn("Anti AFK is activated!")
	end
end)

function _G.HBFruit.Coroutine:Release()
	for _,v in pairs(self) do
		if (typeof(v)=="thread") then
			repeat task.wait(1) until coroutine.close(v)
		end
	end
end

function _G.HBFruit.Function:saveDataUI(pagination, farmChest, fastMode, lockFPS, stopBeliAt)
	_G.HBFruit.Function:preProcessData()
	local custom = {
		ui = {
			container = {
				farmChest = farmChest or false,
				fastMode = fastMode or false,
				lockFPS = lockFPS or false,
				stopAtBeli = stopBeliAt or -1
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
		[5] = data.ui.container.stopAtBeli
	}
	return unpack(args)
end

function _G.HBFruit.Function:preProcessData()
	if (isfile(SCRIPT_ID.."/"..LocalPlayer.Name.."/data.json")) then
		return
	else
		local default = {
			ui = {
				container = {
					farmChest = false,
					fastMode = false,
					lockFPS = false,
					stopAtBeli = -1
				},
				pagination = 0
			}
		}
		makefolder(SCRIPT_ID.."/"..LocalPlayer.Name)
		writefile(SCRIPT_ID.."/"..LocalPlayer.Name.."/data.json", JSON.encode(default))
	end
end

function _G.HBFruit.Function:TPToSea(sea)
	local args = {}
	if (sea == _G.HBFruit.Variable.Enum.Sea1) then
		args[1] = "TravelMain"
	elseif (sea == _G.HBFruit.Variable.Enum.Sea2) then
		args[1] = "TravelDressrosa"
	elseif (sea == _G.HBFruit.Variable.Enum.Sea3) then
		args[1] = "TravelZou"
	end
	game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
end


_G.HBFruit.IsReady = true
coroutine.resume(_G.HBFruit.Coroutine.AntiAFK)
