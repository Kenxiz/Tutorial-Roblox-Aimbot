--// Variables //--
local GetKey = script.Parent.GetKey
local CheckKey = script.Parent.KeyCheck
local KeyInput = script.Parent.KeyInput
local Key = "k4WjaMwd3dC64sm8cTYkmaq2"
local KeySystem = script.Parent

--// Check Key System //--
function DestroyLogin()
	script.Parent:Destroy()
end

CheckKey.MouseButton1Click:Connect(function()
	if KeyInput.Text == Key then
		DestroyLogin()
		wait(0.5)
		-- Load Menu
	end
end)

--// Get Key System //--
GetKey.MouseButton1Click:Connect(function()
	game.StarterGui:SetCore("SendNotification", {Title = "Copied!", Text = "Link Successfully Copied!", Icon = "", Duration = 5})
	wait(0.3)
	setclipboard("") -- Link / Most executors have a built-in variable for it
end)
