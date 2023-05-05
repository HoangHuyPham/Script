local Utilities = {lookAt = 0, tweenTo = 0}

setmetatable(Utilities, {__index = function(t, k)
	return "Oops! out of bound (index: "..k..")"
end,})

Utilities.lookAt = function(targetPostion, eyePostion)
	local forwardVector = (targetPostion - eyePostion).Unit
	local upVector = Vector3.new(0, 1, 0)
	local rightVector = forwardVector:Cross(upVector)
	local upVector2 = rightVector:Cross(forwardVector)
	return CFrame.fromMatrix(eyePostion, rightVector, upVector2)
end

Utilities.tweenTo = function(HumanoidRootPart, goalInstance, Y, speed)
	local TweenService = game:GetService("TweenService")
	local distance = math.sqrt(math.pow(HumanoidRootPart.CFrame.Position.X - goalInstance.CFrame.Position.X, 2)+
		math.pow((HumanoidRootPart.CFrame.Position.Y+Y) - goalInstance.CFrame.Position.Y, 2)+
		math.pow(HumanoidRootPart.CFrame.Position.Z - goalInstance.CFrame.Position.Z, 2)
	)
	local time = distance/speed
	local TweenInfo1 = TweenInfo.new(time, Enum.EasingStyle.Linear, Enum.EasingDirection.In)
	local Position = {}
	Position.CFrame = CFrame.new(Vector3.new(goalInstance.CFrame.Position.X, goalInstance.CFrame.Position.Y + Y, goalInstance.CFrame.Position.Z))
	HumanoidRootPart.Anchored = true
	TweenService:Create(HumanoidRootPart, TweenInfo1, Position):Play()
	HumanoidRootPart.CFrame = Utilities.lookAt(goalInstance.Position, HumanoidRootPart.Position)
	task.wait(time)
	HumanoidRootPart.Anchored = false
end

return Utilities
