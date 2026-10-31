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
main.Size = UDim2.new(0, 350, 0, 270)
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
title.Text = "jamie🤗"
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
eggPage.Size = UDim2.new(1, -20, 0, 155)
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
menuPage.Size = UDim2.new(1, -20, 0, 155)
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

local collapsed = false

collapse.MouseButton1Click:Connect(function()
    collapsed = not collapsed

    tabBar.Visible = not collapsed
    eggPage.Visible = not collapsed and eggPage.Visible
    menuPage.Visible = not collapsed and menuPage.Visible

    if collapsed then
        main:TweenSize(
            UDim2.new(0, 250, 0, 48),
            Enum.EasingDirection.Out,
            Enum.EasingStyle.Quad,
            0.2,
            true
        )
        collapse.Text = "+"
    else
        main:TweenSize(
            UDim2.new(0, 350, 0, 270),
            Enum.EasingDirection.Out,
            Enum.EasingStyle.Quad,
            0.2,
            true
        )
        collapse.Text = "−"
    end
end)

close.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

showTab("EGG")

local openTween = TweenService:Create(
    scale,
    TweenInfo.new(0.55, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
    {Scale = 1}
)

openTween:Play()
