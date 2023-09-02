repeat task.wait() until game:IsLoaded() and KRNL_LOADED and game.GameId == 994732206
task.wait(3)
loadstring(game:HttpGet("https://raw.githubusercontent.com/HoangHuyPham/Script/master/BloxFruit/HBFruit/UI/UI.lua", true))()
if not (game.Players.LocalPlayer.PlayerGui:FindFirstChild("HBFruit")) then
	repeat task.wait(1) until game.Players.LocalPlayer.PlayerGui:FindFirstChild("HBFruit")
	task.wait(3)
end
--Declare functions
local preWriteOrRead = function() end

--Declare variables 
local HBFruit = game.Players.LocalPlayer.PlayerGui:FindFirstChild("HBFruit")
local ErrorTitle = game.CoreGui:FindFirstChild("ErrorTitle", true)
local FarmChestBtn = HBFruit.background.container.farmChest.ImageButton
local FastModeBtn = HBFruit.background.container.fastMode.ImageButton
local VirtualUser = game:GetService("VirtualUser")
local TeleportService = game:GetService("TeleportService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local JSON = loadstring(game:HttpGet("https://raw.githubusercontent.com/HoangHuyPham/Script/master/jsonLib", true))()
repeat task.wait() until JSON
local Worlds = {}
Worlds.Sea1 = "Main"
Worlds.Sea2 = "Dressrosa"
Worlds.Sea3 = "Zou"

if _G.HBFruit then
	_G.HBFruit.Connection:DisconnectAll()
	table.clear(_G.HBFruit)
	_G.HBFruit = nil
end

_G.HBFruit = {}
_G.HBFruit.Function = {}
function _G.HBFruit.Function:saveAs()
	local HBFruit = {
		Data = {
			UI = {
				Misc = {farmChest=FarmChestBtn.Selected, fastMode=FastModeBtn.Selected, beliStop=HBFruit.background.container.stopAtBeli.TextBox.Text}
			},
			ServerJoined = {}
		}
	}
	preWriteOrRead()
	writefile("HBFruit/"..LocalPlayer.Name.."/data.json", JSON.encode(HBFruit))
end
_G.HBFruit.Connection = {}
_G.HBFruit.Connection.Reconnect = ErrorTitle.Changed:Connect(function(property)
	if (string.find(string.upper(ErrorTitle.Text), "DISCONNECT", 1, true)) then
		TeleportService:Teleport(game.PlaceId, LocalPlayer)
	end
end)
_G.HBFruit.Connection.AntiAFK = LocalPlayer.Idled:Connect(function(time)
	VirtualUser:Button1Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
	VirtualUser:Button1Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
end)

_G.HBFruit.Connection.TeleportFailed = TeleportService.TeleportInitFailed:Connect(
	function()
		TeleportService:Teleport(game.PlaceId, LocalPlayer)
	end
)

function _G.HBFruit.Connection:DisconnectAll()
	for _,v in pairs(self) do
		v:Disconnect()
	end
end


function preWriteOrRead()
	local HBFruitDefault = {
		Data = {
			UI = {
				Misc = {farmChest=false, fastMode=false, beliStop="-1"}
			},
			ServerJoined = {}
		}
	}
	if (isfolder("HBFruit")) then
		if (isfolder(LocalPlayer.Name)) then
			return
		end
	end
	writefile("HBFruit/"..LocalPlayer.Name.."/data.json", JSON.encode(HBFruitDefault))
	makefolder("HBFruit/"..LocalPlayer.Name)
	
end


--local args = {
--	[1] = "TravelMain",
--}

--game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
