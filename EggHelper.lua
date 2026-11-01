-- EggHelper
-- Steal an Egg | Delta

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local oldGui = playerGui:FindFirstChild("EggHelper")
if oldGui then
    oldGui:Destroy()
end

local gui = Instance.new("ScreenGui")
gui.Name = "EggHelper"
gui.ResetOnSpawn = false
gui.Parent = playerGui

local main = Instance.new("Frame")
main.Name = "Main"
main.Size = UDim2.new(0, 350, 0, 335)
main.Position = UDim2.new(0.5, -175, 0.5, -135)
main.BackgroundColor3 = Color3.fromRGB(35, 25, 65)
main.BorderSizePixel = 0
main.Active = true
main.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 14)
corner.Parent = main

local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(95, 45, 180)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(35, 100, 200))
})
gradient.Rotation = 35
gradient.Parent = main

local scale = Instance.new("UIScale")
scale.Scale = 0.65
scale.Parent = main

-- Паучок спускается на нити с верхнего угла окна
local spiderThread = Instance.new("Frame")
spiderThread.Name = "SpiderThread"
spiderThread.AnchorPoint = Vector2.new(0.5, 0)
spiderThread.Position = UDim2.new(1, -30, 0, 0)
spiderThread.Size = UDim2.new(0, 2, 0, 0)
spiderThread.BackgroundColor3 = Color3.fromRGB(225, 220, 255)
spiderThread.BackgroundTransparency = 0.15
spiderThread.BorderSizePixel = 0
spiderThread.ZIndex = 25
spiderThread.Parent = main

local spider = Instance.new("TextLabel")
spider.Name = "HalloweenSpider"
spider.AnchorPoint = Vector2.new(0.5, 0)
spider.Position = UDim2.new(1, -30, 0, -2)
spider.Size = UDim2.new(0, 30, 0, 30)
spider.BackgroundTransparency = 1
spider.Text = "🕷️"
spider.TextSize = 24
spider.ZIndex = 26
spider.Parent = main


-- Короткая Halloween-заставка при открытии окна
local halloweenBanner = Instance.new("TextLabel")
halloweenBanner.Name = "HalloweenIntro"
halloweenBanner.AnchorPoint = Vector2.new(0.5, 1)
halloweenBanner.Position = UDim2.new(0.5, 0, 0, -12)
halloweenBanner.Size = UDim2.new(1, -12, 0, 52)
halloweenBanner.BackgroundTransparency = 1
halloweenBanner.Text = "🎃 HAPPY HALLOWEEN 👻"
halloweenBanner.TextColor3 = Color3.fromRGB(255, 145, 40)
halloweenBanner.TextStrokeColor3 = Color3.fromRGB(150, 35, 255)
halloweenBanner.TextStrokeTransparency = 1
halloweenBanner.TextTransparency = 1
halloweenBanner.TextScaled = true
halloweenBanner.Font = Enum.Font.GothamBlack
halloweenBanner.ZIndex = 20
halloweenBanner.Parent = main

local bannerStroke = Instance.new("UIStroke")
bannerStroke.Color = Color3.fromRGB(175, 55, 255)
bannerStroke.Thickness = 1.5
bannerStroke.Transparency = 1
bannerStroke.Parent = halloweenBanner



local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 48)
header.BackgroundColor3 = Color3.fromRGB(30, 20, 55)
header.BackgroundTransparency = 0.15
header.BorderSizePixel = 0
header.Parent = main

local headerCorner = Instance.new("UICorner")
headerCorner.CornerRadius = UDim.new(0, 14)
headerCorner.Parent = header

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -100, 1, 0)
title.Position = UDim2.new(0, 15, 0, 0)
title.BackgroundTransparency = 1
title.Text = "jamie😋"
title.TextColor3 = Color3.new(1, 1, 1)
title.TextSize = 22
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = header

local collapse = Instance.new("TextButton")
collapse.Size = UDim2.new(0, 35, 0, 32)
collapse.Position = UDim2.new(1, -82, 0, 8)
collapse.BackgroundColor3 = Color3.fromRGB(100, 65, 180)
collapse.Text = "−"
collapse.TextColor3 = Color3.new(1, 1, 1)
collapse.TextSize = 23
collapse.Font = Enum.Font.GothamBold
collapse.Parent = header

local collapseCorner = Instance.new("UICorner")
collapseCorner.CornerRadius = UDim.new(0, 8)
collapseCorner.Parent = collapse

local close = Instance.new("TextButton")
close.Size = UDim2.new(0, 35, 0, 32)
close.Position = UDim2.new(1, -42, 0, 8)
close.BackgroundColor3 = Color3.fromRGB(180, 55, 85)
close.Text = "×"
close.TextColor3 = Color3.new(1, 1, 1)
close.TextSize = 23
close.Font = Enum.Font.GothamBold
close.Parent = header

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 8)
closeCorner.Parent = close

local dragging = false
local dragStart
local startPosition

header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
    or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPosition = main.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and (
        input.UserInputType == Enum.UserInputType.MouseMovement
        or input.UserInputType == Enum.UserInputType.Touch
    ) then
        local delta = input.Position - dragStart
        main.Position = UDim2.new(
            startPosition.X.Scale,
            startPosition.X.Offset + delta.X,
            startPosition.Y.Scale,
            startPosition.Y.Offset + delta.Y
        )
    end
end)

local tabBar = Instance.new("Frame")
tabBar.Size = UDim2.new(1, -20, 0, 42)
tabBar.Position = UDim2.new(0, 10, 0, 57)
tabBar.BackgroundTransparency = 1
tabBar.Parent = main

local eggTab = Instance.new("TextButton")
eggTab.Size = UDim2.new(0.5, -5, 1, 0)
eggTab.Position = UDim2.new(0, 0, 0, 0)
eggTab.BackgroundColor3 = Color3.fromRGB(115, 75, 190)
eggTab.Text = "🥚 EGG"
eggTab.TextColor3 = Color3.new(1, 1, 1)
eggTab.TextSize = 16
eggTab.Font = Enum.Font.GothamBold
eggTab.Parent = tabBar

local eggCorner = Instance.new("UICorner")
eggCorner.CornerRadius = UDim.new(0, 9)
eggCorner.Parent = eggTab

local menuTab = Instance.new("TextButton")
menuTab.Size = UDim2.new(0.5, -5, 1, 0)
menuTab.Position = UDim2.new(0.5, 5, 0, 0)
menuTab.BackgroundColor3 = Color3.fromRGB(65, 55, 125)
menuTab.Text = "⚙️ MENU"
menuTab.TextColor3 = Color3.new(1, 1, 1)
menuTab.TextSize = 16
menuTab.Font = Enum.Font.GothamBold
menuTab.Parent = tabBar

local menuCorner = Instance.new("UICorner")
menuCorner.CornerRadius = UDim.new(0, 9)
menuCorner.Parent = menuTab

local eggPage = Instance.new("Frame")
eggPage.Size = UDim2.new(1, -20, 0, 220)
eggPage.Position = UDim2.new(0, 10, 0, 107)
eggPage.BackgroundColor3 = Color3.fromRGB(30, 25, 60)
eggPage.BackgroundTransparency = 0.2
eggPage.BorderSizePixel = 0
eggPage.Parent = main

local eggPageCorner = Instance.new("UICorner")
eggPageCorner.CornerRadius = UDim.new(0, 10)
eggPageCorner.Parent = eggPage

local eggText = Instance.new("TextLabel")
eggText.Size = UDim2.new(1, -20, 1, 0)
eggText.Position = UDim2.new(0, 10, 0, 0)
eggText.BackgroundTransparency = 1
eggText.Text = "🥚 Egg features coming soon..."
eggText.TextColor3 = Color3.new(1, 1, 1)
eggText.TextSize = 16
eggText.Font = Enum.Font.Gotham
eggText.Parent = eggPage

local menuPage = Instance.new("Frame")
menuPage.Size = UDim2.new(1, -20, 0, 220)
menuPage.Position = UDim2.new(0, 10, 0, 107)
menuPage.BackgroundColor3 = Color3.fromRGB(30, 25, 60)
menuPage.BackgroundTransparency = 0.2
menuPage.BorderSizePixel = 0
menuPage.Visible = false
menuPage.Parent = main

local menuPageCorner = Instance.new("UICorner")
menuPageCorner.CornerRadius = UDim.new(0, 10)
menuPageCorner.Parent = menuPage

local function showTab(tab)
    local isEgg = tab == "EGG"

    eggPage.Visible = isEgg
    menuPage.Visible = not isEgg

    eggTab.BackgroundColor3 = isEgg
        and Color3.fromRGB(115, 75, 190)
        or Color3.fromRGB(65, 55, 125)

    menuTab.BackgroundColor3 = not isEgg
        and Color3.fromRGB(115, 75, 190)
        or Color3.fromRGB(65, 55, 125)
end

eggTab.MouseButton1Click:Connect(function()
    showTab("EGG")
end)

menuTab.MouseButton1Click:Connect(function()
    showTab("MENU")
end)

local function createToggle(parent, text, y, callback)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, -20, 0, 55)
    button.Position = UDim2.new(0, 10, 0, y)
    button.BackgroundColor3 = Color3.fromRGB(65, 55, 125)
    button.Text = text .. " : OFF"
    button.TextColor3 = Color3.new(1, 1, 1)
    button.TextSize = 16
    button.Font = Enum.Font.GothamBold
    button.Parent = parent

    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 9)
    buttonCorner.Parent = button

    local enabled = false

    button.MouseButton1Click:Connect(function()
        enabled = not enabled

        button.Text = text .. (enabled and " : ON" or " : OFF")
        button.BackgroundColor3 = enabled
            and Color3.fromRGB(100, 75, 190)
            or Color3.fromRGB(65, 55, 125)

        callback(enabled)
    end)

    return button
end

local espObjects = {}

local function removeESP(character)
    local folder = espObjects[character]
    if folder then
        folder:Destroy()
        espObjects[character] = nil
    end
end

local function addESP(character)
    if not character or not character:FindFirstChildOfClass("Humanoid") then
        return
    end

    removeESP(character)

    local folder = Instance.new("Folder")
    folder.Name = "EggHelperESP"
    folder.Parent = character
    espObjects[character] = folder

    local bodyNames = {
        "Head", "HumanoidRootPart", "Torso", "UpperTorso", "LowerTorso",
        "Left Arm", "Right Arm", "Left Leg", "Right Leg",
        "LeftUpperArm", "RightUpperArm", "LeftLowerArm", "RightLowerArm",
        "LeftHand", "RightHand", "LeftUpperLeg", "RightUpperLeg",
        "LeftLowerLeg", "RightLowerLeg", "LeftFoot", "RightFoot"
    }

    for _, name in ipairs(bodyNames) do
        local part = character:FindFirstChild(name)
        if part and part:IsA("BasePart") then
            local highlight = Instance.new("Highlight")
            highlight.Adornee = part
            highlight.FillColor = Color3.fromRGB(150, 70, 255)
            highlight.OutlineColor = Color3.fromRGB(80, 180, 255)
            highlight.FillTransparency = 0.45
            highlight.OutlineTransparency = 0
            highlight.Parent = folder
        end
    end
end

local espEnabled = false

local function updateESP()
    for _, otherPlayer in ipairs(Players:GetPlayers()) do
        if otherPlayer ~= player and otherPlayer.Character then
            if espEnabled then
                addESP(otherPlayer.Character)
            else
                removeESP(otherPlayer.Character)
            end
        end
    end
end

local function connectPlayer(otherPlayer)
    if otherPlayer == player then
        return
    end

    otherPlayer.CharacterAdded:Connect(function(character)
        task.wait(1)
        if espEnabled then
            addESP(character)
        end
    end)
end

Players.PlayerAdded:Connect(connectPlayer)

for _, otherPlayer in ipairs(Players:GetPlayers()) do
    connectPlayer(otherPlayer)
end

Players.PlayerRemoving:Connect(function(otherPlayer)
    if otherPlayer.Character then
        removeESP(otherPlayer.Character)
    end
end)

local farmEnabled = false

local function findNearbyTreadmill()
    local character = player.Character
    local root = character and character:FindFirstChild("HumanoidRootPart")

    if not root then
        return nil
    end

    local bestPart
    local bestDistance = 500

    for _, object in ipairs(workspace:GetDescendants()) do
        if object:IsA("BasePart") then
            local name = object.Name:lower()

            if string.find(name, "treadmill") or string.find(name, "step") then
                local distance = (object.Position - root.Position).Magnitude

                if distance < bestDistance then
                    bestDistance = distance
                    bestPart = object
                end
            end
        end
    end

    return bestPart
end

task.spawn(function()
    while gui.Parent do
        if farmEnabled then
            local character = player.Character
            local humanoid = character and character:FindFirstChildOfClass("Humanoid")
            local target = findNearbyTreadmill()

            if humanoid and target then
                humanoid:MoveTo(target.Position)
            end
        end

        task.wait(1)
    end
end)

createToggle(menuPage, "ESP PLAYERS 😎", 8, function(enabled)
    espEnabled = enabled
    updateESP()
end)

createToggle(menuPage, "FARM SPEED 🏃", 73, function(enabled)
    farmEnabled = enabled
end)


-- FLY: управление направлением через джойстик/ WASD, вверх через прыжок, вниз через Ctrl
local RunService = game:GetService("RunService")
local flyEnabled = false
local flySpeed = 60
local flyVelocity
local flyGyro
local flyConnection

local flyButton = Instance.new("TextButton")
flyButton.Size = UDim2.new(1, -20, 0, 48)
flyButton.Position = UDim2.new(0, 10, 0, 138)
flyButton.BackgroundColor3 = Color3.fromRGB(65, 55, 125)
flyButton.Text = "🪽 FLY : OFF"
flyButton.TextColor3 = Color3.new(1, 1, 1)
flyButton.TextSize = 16
flyButton.Font = Enum.Font.GothamBold
flyButton.Parent = menuPage
Instance.new("UICorner", flyButton).CornerRadius = UDim.new(0, 9)

local speedLabel = Instance.new("TextLabel")
speedLabel.Size = UDim2.new(1, -75, 0, 30)
speedLabel.Position = UDim2.new(0, 12, 0, 188)
speedLabel.BackgroundTransparency = 1
speedLabel.Text = "Fly speed: " .. flySpeed
speedLabel.TextColor3 = Color3.new(1, 1, 1)
speedLabel.TextSize = 15
speedLabel.Font = Enum.Font.GothamBold
speedLabel.TextXAlignment = Enum.TextXAlignment.Left
speedLabel.Parent = menuPage

local speedPlus = Instance.new("TextButton")
speedPlus.Size = UDim2.new(0, 42, 0, 30)
speedPlus.Position = UDim2.new(1, -54, 0, 188)
speedPlus.BackgroundColor3 = Color3.fromRGB(115, 75, 190)
speedPlus.Text = "+"
speedPlus.TextColor3 = Color3.new(1, 1, 1)
speedPlus.TextSize = 22
speedPlus.Font = Enum.Font.GothamBold
speedPlus.Parent = menuPage
Instance.new("UICorner", speedPlus).CornerRadius = UDim.new(0, 8)

-- Отдельное небольшое окно настройки скорости
local speedWindow = Instance.new("Frame")
speedWindow.Name = "FlySpeedWindow"
speedWindow.Size = UDim2.new(0, 220, 0, 125)
speedWindow.Position = UDim2.new(0.5, -110, 0.5, -62)
speedWindow.BackgroundColor3 = Color3.fromRGB(35, 25, 65)
speedWindow.BorderSizePixel = 0
speedWindow.Visible = false
speedWindow.ZIndex = 40
speedWindow.Parent = gui
Instance.new("UICorner", speedWindow).CornerRadius = UDim.new(0, 12)

local speedTitle = Instance.new("TextLabel")
speedTitle.Size = UDim2.new(1, -35, 0, 30)
speedTitle.Position = UDim2.new(0, 10, 0, 5)
speedTitle.BackgroundTransparency = 1
speedTitle.Text = "FLY SPEED"
speedTitle.TextColor3 = Color3.new(1, 1, 1)
speedTitle.Font = Enum.Font.GothamBold
speedTitle.TextSize = 16
speedTitle.ZIndex = 41
speedTitle.Parent = speedWindow

local speedClose = Instance.new("TextButton")
speedClose.Size = UDim2.new(0, 28, 0, 28)
speedClose.Position = UDim2.new(1, -33, 0, 5)
speedClose.BackgroundColor3 = Color3.fromRGB(180, 55, 85)
speedClose.Text = "×"
speedClose.TextColor3 = Color3.new(1, 1, 1)
speedClose.TextSize = 20
speedClose.ZIndex = 41
speedClose.Parent = speedWindow
Instance.new("UICorner", speedClose).CornerRadius = UDim.new(0, 7)

local speedValue = Instance.new("TextLabel")
speedValue.Size = UDim2.new(0, 70, 0, 38)
speedValue.Position = UDim2.new(0.5, -35, 0, 42)
speedValue.BackgroundTransparency = 1
speedValue.Text = tostring(flySpeed)
speedValue.TextColor3 = Color3.new(1, 1, 1)
speedValue.TextSize = 22
speedValue.Font = Enum.Font.GothamBold
speedValue.ZIndex = 41
speedValue.Parent = speedWindow

local function updateFlySpeed()
    speedLabel.Text = "Fly speed: " .. flySpeed
    speedValue.Text = tostring(flySpeed)
end

local speedMinus = Instance.new("TextButton")
speedMinus.Size = UDim2.new(0, 42, 0, 34)
speedMinus.Position = UDim2.new(0.5, -72, 1, -42)
speedMinus.BackgroundColor3 = Color3.fromRGB(65, 55, 125)
speedMinus.Text = "−"
speedMinus.TextColor3 = Color3.new(1, 1, 1)
speedMinus.TextSize = 22
speedMinus.ZIndex = 41
speedMinus.Parent = speedWindow
Instance.new("UICorner", speedMinus).CornerRadius = UDim.new(0, 8)

local speedPlusMore = Instance.new("TextButton")
speedPlusMore.Size = UDim2.new(0, 42, 0, 34)
speedPlusMore.Position = UDim2.new(0.5, 30, 1, -42)
speedPlusMore.BackgroundColor3 = Color3.fromRGB(115, 75, 190)
speedPlusMore.Text = "+"
speedPlusMore.TextColor3 = Color3.new(1, 1, 1)
speedPlusMore.TextSize = 22
speedPlusMore.ZIndex = 41
speedPlusMore.Parent = speedWindow
Instance.new("UICorner", speedPlusMore).CornerRadius = UDim.new(0, 8)

speedPlus.MouseButton1Click:Connect(function()
    speedWindow.Visible = true
end)
speedClose.MouseButton1Click:Connect(function()
    speedWindow.Visible = false
end)
speedMinus.MouseButton1Click:Connect(function()
    flySpeed = math.max(10, flySpeed - 10)
    updateFlySpeed()
end)
speedPlusMore.MouseButton1Click:Connect(function()
    flySpeed = math.min(300, flySpeed + 10)
    updateFlySpeed()
end)

local function stopFly()
    if flyConnection then
        flyConnection:Disconnect()
        flyConnection = nil
    end
    if flyVelocity then
        flyVelocity:Destroy()
        flyVelocity = nil
    end
    if flyGyro then
        flyGyro:Destroy()
        flyGyro = nil
    end
    local character = player.Character
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.PlatformStand = false
        humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
    end
end

local function startFly()
    stopFly()
    local character = player.Character
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")
    local root = character and character:FindFirstChild("HumanoidRootPart")
    if not humanoid or not root then
        flyEnabled = false
        flyButton.Text = "🪽 FLY : OFF"
        return
    end

    humanoid.PlatformStand = true
    flyVelocity = Instance.new("BodyVelocity")
    flyVelocity.MaxForce = Vector3.new(1e9, 1e9, 1e9)
    flyVelocity.Velocity = Vector3.zero
    flyVelocity.Parent = root

    flyGyro = Instance.new("BodyGyro")
    flyGyro.MaxTorque = Vector3.new(1e9, 1e9, 1e9)
    flyGyro.P = 9e4
    flyGyro.CFrame = workspace.CurrentCamera.CFrame
    flyGyro.Parent = root

    flyConnection = RunService.RenderStepped:Connect(function()
        if not flyEnabled or not root.Parent then
            return
        end
        local camera = workspace.CurrentCamera
        local move = humanoid.MoveDirection
        local vertical = 0
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) or humanoid.Jump then
            vertical = 1
        elseif UserInputService:IsKeyDown(Enum.KeyCode.LeftControl)
            or UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
            vertical = -1
        end
        -- На телефоне вертикальное движение доступно кнопкой прыжка;
        -- горизонтальное — стандартным экранным джойстиком.
        flyVelocity.Velocity = (move * flySpeed) + Vector3.new(0, vertical * flySpeed, 0)
        if camera then
            flyGyro.CFrame = CFrame.new(root.Position, root.Position + camera.CFrame.LookVector)
        end
    end)
end

flyButton.MouseButton1Click:Connect(function()
    flyEnabled = not flyEnabled
    flyButton.Text = flyEnabled and "🪽 FLY : ON" or "🪽 FLY : OFF"
    flyButton.BackgroundColor3 = flyEnabled
        and Color3.fromRGB(100, 75, 190)
        or Color3.fromRGB(65, 55, 125)
    if flyEnabled then
        startFly()
    else
        stopFly()
    end
end)

player.CharacterAdded:Connect(function()
    if flyEnabled then
        task.wait(1)
        startFly()
    end
end)


local collapsed = false

collapse.MouseButton1Click:Connect(function()
    collapsed = not collapsed

    tabBar.Visible = not collapsed
    eggPage.Visible = not collap
