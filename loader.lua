local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "NovaLinkHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = player:WaitForChild("PlayerGui")

-- Marco principal
local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 420, 0, 300)
Frame.Position = UDim2.new(0.5, -210, 0.5, -150)
Frame.BackgroundColor3 = Color3.fromRGB(18,18,28)
Frame.Parent = ScreenGui
Frame.Active = true
Frame.Draggable = true
Instance.new("UICorner", Frame).CornerRadius = UDim.new(0,18)

-- Título
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -40, 0, 50)
Title.Position = UDim2.new(0,20,0,15)
Title.BackgroundTransparency = 1
Title.Text = "NovaLink Hub"
Title.TextColor3 = Color3.fromRGB(0,170,255)
Title.TextScaled = true
Title.Font = Enum.Font.GothamBold
Title.Parent = Frame

-- Subtítulo
local Sub = Instance.new("TextLabel")
Sub.Size = UDim2.new(1, -40, 0, 40)
Sub.Position = UDim2.new(0,20,0,65)
Sub.BackgroundTransparency = 1
Sub.Text = "Free servidores privados\nCreated by Orion Devs"
Sub.TextColor3 = Color3.new(1,1,1)
Sub.TextScaled = true
Sub.Font = Enum.Font.Gotham
Sub.Parent = Frame

-- Función botones
local function createButton(text, link, yPos)

	local Button = Instance.new("TextButton")
	Button.Size = UDim2.new(0.85,0,0,50)
	Button.Position = UDim2.new(0.075,0,0,yPos)
	Button.BackgroundColor3 = Color3.fromRGB(0,140,255)
	Button.TextColor3 = Color3.new(1,1,1)
	Button.TextScaled = true
	Button.Font = Enum.Font.GothamBold
	Button.Text = text
	Button.Parent = Frame
	
	Instance.new("UICorner", Button).CornerRadius = UDim.new(0,14)

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

-- TUS LINKS
createButton(
	"Get Link 1",
	"https://roblox.com.ly/games/2753915549/Event-Blox-Fruits?privateServerLinkCode=36614867226193845417684496298532",
	130
)

createButton(
	"Get Link 2",
	"https://roblox.cd/games/2753915549/Event-Blox-Fruits?privateServerLinkCode=36614867226193845417684496298532",
	195
)

-- Botón cerrar
local Close = Instance.new("TextButton")
Close.Size = UDim2.new(0,32,0,32)
Close.Position = UDim2.new(1,-38,0,8)
Close.BackgroundColor3 = Color3.fromRGB(200,50,50)
Close.Text = "X"
Close.TextColor3 = Color3.new(1,1,1)
Close.TextScaled = true
Close.Parent = Frame
Instance.new("UICorner", Close).CornerRadius = UDim.new(1,0)

Close.MouseButton1Click:Connect(function()
	ScreenGui:Destroy()
end)
