local Toggle = script.Parent.Toggle
local Camera = game.Workspace.CurrentCamera
local localPlayer = game:GetService("Players").LocalPlayer
_G.Aimbot = false

Toggle.MouseButton1Click:Connect(function()
	if _G.Aimbot == false then
		_G.Aimbot = true
		Toggle.TextColor3 = Color3.fromRGB(0, 255, 0)
		Toggle.Text = "Aimbot: On"
		function closestPlayer()
			local dist = math.huge
			local target = nil
			for i,v in pairs(game:GetService("Players"):GetPlayers()) do
				if v ~= localPlayer then
					if v.Character and v.Character:FindFirstChild("Head") and v.TeamColor ~= localPlayer.TeamColor and _G.Aimbot then
						local magnitude = (v.Character.Head.Position - localPlayer.Character.Head.Position).magntiude
						if magnitude < dist then
							dist = magnitude
							target = v
						end
					end
				end
			end
			return target
		end
	else
		_G.Aimbot = false
		Toggle.TextColor3 = Color3.fromRGB(255, 0, 0)
		Toggle.Text = "Aimbot: Off"
	end
end)

local settings = {
	keybind = Enum.UserInputType.MouseButton2
}

local UIS = game:GetService("UserInputService")
local aiming = false

UIS.InputBegan:Connect(function(inp)
	if inp.UserInputType == settings.keybind then
		aiming = true
	end
end)

UIS.InputEnded:Connect(function(inp)
	if inp.UserInputType == settings.keybind then
		aiming = false
	end
end)

game:GetService("RunService").RenderStepped:Connect(function()
	if aiming then
		Camera.CFrame = CFrame.new(Camera.CFrame.Position, closestPlayer().Character.Head.Position)
	end
end)
