local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- GUI principal
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "NovaLinkHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = player:WaitForChild("PlayerGui")

-- Frame principal
local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 400, 0, 260)
Frame.Position = UDim2.new(0.5, -200, 0.5, -130)
Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
Frame.Parent = ScreenGui
Frame.Active = true
Frame.Draggable = true

Instance.new("UICorner", Frame).CornerRadius = UDim.new(0,16)

-- Título
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -40, 0, 50)
Title.Position = UDim2.new(0,20,0,10)
Title.BackgroundTransparency = 1
Title.Text = "NovaLink Hub"
Title.TextColor3 = Color3.fromRGB(0,170,255)
Title.TextScaled = true
Title.Font = Enum.Font.GothamBold
Title.Parent = Frame

-- Subtítulo
local Sub = Instance.new("TextLabel")
Sub.Size = UDim2.new(1, -40, 0, 40)
Sub.Position = UDim2.new(0,20,0,55)
Sub.BackgroundTransparency = 1
Sub.Text = "Free servidores privados\nCreated by Orion Devs"
Sub.TextColor3 = Color3.new(1,1,1)
Sub.TextScaled = true
Sub.Font = Enum.Font.Gotham
Sub.Parent = Frame

-- Función para crear botones
local function createButton(text, link, yPos)

	local Button = Instance.new("TextButton")
	Button.Size = UDim2.new(0.85,0,0,45)
	Button.Position = UDim2.new(0.075,0,0,yPos)
	Button.BackgroundColor3 = Color3.fromRGB(0,120,255)
	Button.TextColor3 = Color3.new(1,1,1)
	Button.TextScaled = true
	Button.Font = Enum.Font.GothamBold
	Button.Text = text
	Button.Parent = Frame
	
	Instance.new("UICorner", Button).CornerRadius = UDim.new(0,12)

	Button.MouseButton1Click:Connect(function()
		Button.Text = "Copiando..."
		task.wait(3)
		
		if setclipboard then
			setclipboard(link)
			Button.Text = "Copiado. Pega en el navegador"
		else
			Button.Text = "No soportado"
		end
	end)
end

-- Botones
createButton("https://roblox.com.ly/games/2753915549/Event-Blox-Fruits?privateServerLinkCode=36614867226193845417684496298532"", "https://roblox.com.ly/games/2753915549/Event-Blox-Fruits?privateServerLinkCode=36614867226193845417684496298532", 120)
createButton("https://roblox.cd/games/2753915549/Event-Blox-Fruits?privateServerLinkCode=36614867226193845417684496298532", "https://roblox.cd/games/2753915549/Event-Blox-Fruits?privateServerLinkCode=36614867226193845417684496298532", 175)

-- Botón cerrar
local Close = Instance.new("TextButton")
Close.Size = UDim2.new(0,30,0,30)
Close.Position = UDim2.new(1,-35,0,5)
Close.BackgroundColor3 = Color3.fromRGB(200,50,50)
Close.Text = "X"
Close.TextColor3 = Color3.new(1,1,1)
Close.TextScaled = true
Close.Parent = Frame

Instance.new("UICorner", Close).CornerRadius = UDim.new(1,0)

Close.MouseButton1Click:Connect(function()
	ScreenGui:Destroy()
end)
