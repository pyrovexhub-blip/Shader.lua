local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer

local TargetParent = (gethui and gethui()) or LocalPlayer:WaitForChild("PlayerGui")

if TargetParent:FindFirstChild("PyrovexShaderV6Canvas") then
    TargetParent.PyrovexShaderV6Canvas:Destroy()
end

local function clearEffects()
    for _, v in pairs(Lighting:GetChildren()) do
        if v:IsA("PostEffect") or v:IsA("Atmosphere") then
            v:Destroy()
        end
    end
end

local function applyDaytime()
    clearEffects()
    Lighting.ClockTime = 14.0
    Lighting.Brightness = 3.5
    Lighting.Ambient = Color3.fromRGB(130, 130, 140)
    Lighting.OutdoorAmbient = Color3.fromRGB(220, 220, 230)
    Lighting.GlobalShadows = true
    Lighting.ShadowSoftness = 0.2

    local cc = Instance.new("ColorCorrectionEffect", Lighting)
    cc.Contrast = 0.15
    cc.Saturation = 0.25

    local bloom = Instance.new("BloomEffect", Lighting)
    bloom.Intensity = 0.5
    bloom.Size = 20
end

local function applySunset()
    clearEffects()
    Lighting.ClockTime = 17.45
    Lighting.Brightness = 4.0
    Lighting.GlobalShadows = true
    Lighting.ShadowSoftness = 0.0
    Lighting.EnvironmentDiffuseScale = 1.0
    Lighting.EnvironmentSpecularScale = 1.0
    Lighting.Ambient = Color3.fromRGB(45, 30, 40)
    Lighting.OutdoorAmbient = Color3.fromRGB(110, 65, 55)

    local cc = Instance.new("ColorCorrectionEffect", Lighting)
    cc.Contrast = 0.35
    cc.Saturation = 0.55
    cc.TintColor = Color3.fromRGB(255, 155, 90)

    local bloom = Instance.new("BloomEffect", Lighting)
    bloom.Intensity = 1.2
    bloom.Size = 35
    bloom.Threshold = 0.5

    local rays = Instance.new("SunRaysEffect", Lighting)
    rays.Intensity = 0.35
    rays.Spread = 0.8

    local atm = Instance.new("Atmosphere", Lighting)
    atm.Density = 0.35
    atm.Color = Color3.fromRGB(255, 100, 40)
    atm.Glare = 1.8
    atm.Haze = 2.0
end

local function applyNight()
    clearEffects()
    Lighting.ClockTime = 0.0
    Lighting.Brightness = 1.8
    Lighting.GlobalShadows = true
    Lighting.ShadowSoftness = 0.2
    Lighting.EnvironmentDiffuseScale = 0.8
    Lighting.EnvironmentSpecularScale = 1.0
    Lighting.Ambient = Color3.fromRGB(15, 15, 30)
    Lighting.OutdoorAmbient = Color3.fromRGB(30, 30, 50)

    local cc = Instance.new("ColorCorrectionEffect", Lighting)
    cc.Contrast = 0.35
    cc.Saturation = 0.4
    cc.TintColor = Color3.fromRGB(175, 185, 255)

    local bloom = Instance.new("BloomEffect", Lighting)
    bloom.Intensity = 1.5
    bloom.Size = 40
    bloom.Threshold = 0.25

    local atm = Instance.new("Atmosphere", Lighting)
    atm.Density = 0.4
    atm.Color = Color3.fromRGB(10, 10, 25)
    atm.Haze = 1.5
end

local function applyCloudy()
    clearEffects()
    Lighting.ClockTime = 12.0
    Lighting.Brightness = 1.5
    Lighting.GlobalShadows = true
    Lighting.ShadowSoftness = 0.9
    Lighting.Ambient = Color3.fromRGB(100, 105, 115)
    Lighting.OutdoorAmbient = Color3.fromRGB(130, 135, 145)

    local cc = Instance.new("ColorCorrectionEffect", Lighting)
    cc.Contrast = 0.1
    cc.Saturation = -0.15
    cc.TintColor = Color3.fromRGB(210, 215, 225)

    local atm = Instance.new("Atmosphere", Lighting)
    atm.Density = 0.55
    atm.Color = Color3.fromRGB(180, 185, 195)
    atm.Haze = 3.0
end

local function applyShore()
    clearEffects()
    Lighting.ClockTime = 16.8
    Lighting.Brightness = 4.5
    Lighting.GlobalShadows = true
    Lighting.EnvironmentDiffuseScale = 1.0
    Lighting.EnvironmentSpecularScale = 1.0
    Lighting.Ambient = Color3.fromRGB(50, 40, 50)
    Lighting.OutdoorAmbient = Color3.fromRGB(130, 85, 65)

    pcall(function()
        local terrain = Workspace:FindFirstChildOfClass("Terrain")
        if terrain then
            terrain.WaterWaveSize = 0.4
            terrain.WaterWaveSpeed = 24
            terrain.WaterTransparency = 0.9
            terrain.WaterColor = Color3.fromRGB(245, 125, 70)
        end
    end)

    local cc = Instance.new("ColorCorrectionEffect", Lighting)
    cc.Contrast = 0.4
    cc.Saturation = 0.65
    cc.TintColor = Color3.fromRGB(255, 160, 95)

    local bloom = Instance.new("BloomEffect", Lighting)
    bloom.Intensity = 1.3
    bloom.Size = 35

    local rays = Instance.new("SunRaysEffect", Lighting)
    rays.Intensity = 0.45
    rays.Spread = 0.85
end

local function applyCinematic()
    clearEffects()
    Lighting.ClockTime = 16.2
    Lighting.Brightness = 3.8
    Lighting.GlobalShadows = true
    Lighting.ShadowSoftness = 0.1
    Lighting.EnvironmentDiffuseScale = 1.0
    Lighting.EnvironmentSpecularScale = 1.0
    Lighting.Ambient = Color3.fromRGB(35, 35, 45)
    Lighting.OutdoorAmbient = Color3.fromRGB(115, 100, 90)

    local cc = Instance.new("ColorCorrectionEffect", Lighting)
    cc.Brightness = 0.03
    cc.Contrast = 0.42
    cc.Saturation = 0.48
    cc.TintColor = Color3.fromRGB(255, 235, 205)

    local bloom = Instance.new("BloomEffect", Lighting)
    bloom.Intensity = 1.1
    bloom.Size = 32
    bloom.Threshold = 0.45

    local rays = Instance.new("SunRaysEffect", Lighting)
    rays.Intensity = 0.3
    rays.Spread = 0.8

    local dof = Instance.new("DepthOfFieldEffect", Lighting)
    dof.FarIntensity = 0.65
    dof.FocusDistance = 25
    dof.InFocusRadius = 45
    dof.NearIntensity = 0.0
end

-- UI PALETTE: charcoal, graphite, muted red, deep purple
local C = {
    Background = Color3.fromRGB(17, 17, 23),
    Top = Color3.fromRGB(29, 25, 34),
    Bottom = Color3.fromRGB(30, 19, 27),
    Graphite = Color3.fromRGB(38, 38, 47),
    GraphiteLight = Color3.fromRGB(53, 48, 59),
    Red = Color3.fromRGB(151, 52, 69),
    RedLight = Color3.fromRGB(205, 75, 95),
    Purple = Color3.fromRGB(113, 77, 155),
    PurpleLight = Color3.fromRGB(166, 113, 207),
    White = Color3.fromRGB(244, 240, 248),
    Muted = Color3.fromRGB(164, 155, 174),
    Black = Color3.fromRGB(12, 12, 17),
}

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "PyrovexShaderV6Canvas"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = TargetParent

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = C.Background
MainFrame.BackgroundTransparency = 0.04
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.08, 0, 0.15, 0)
MainFrame.Size = UDim2.new(0, 270, 0, 350)
MainFrame.Active = true
MainFrame.ClipsDescendants = true
MainFrame.ZIndex = 2

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 16)
MainCorner.Parent = MainFrame

local FrameGradient = Instance.new("UIGradient")
FrameGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(35, 31, 43)),
    ColorSequenceKeypoint.new(0.48, Color3.fromRGB(20, 20, 27)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(43, 24, 32))
})
FrameGradient.Rotation = 125
FrameGradient.Parent = MainFrame

local FrameStroke = Instance.new("UIStroke")
FrameStroke.Color = C.Purple
FrameStroke.Transparency = 0.28
FrameStroke.Thickness = 1.3
FrameStroke.Parent = MainFrame

local OuterGlow = Instance.new("Frame")
OuterGlow.Name = "AccentEdge"
OuterGlow.Parent = MainFrame
OuterGlow.BackgroundColor3 = C.Red
OuterGlow.BackgroundTransparency = 0.08
OuterGlow.BorderSizePixel = 0
OuterGlow.Position = UDim2.new(0, 0, 0, 0)
OuterGlow.Size = UDim2.new(1, 0, 0, 3)
OuterGlow.ZIndex = 8

local OuterGlowGradient = Instance.new("UIGradient")
OuterGlowGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, C.Purple),
    ColorSequenceKeypoint.new(0.5, C.RedLight),
    ColorSequenceKeypoint.new(1, C.PurpleLight)
})
OuterGlowGradient.Parent = OuterGlow

local PLogoBox = Instance.new("Frame")
PLogoBox.Name = "PLogoBox"
PLogoBox.Parent = MainFrame
PLogoBox.BackgroundColor3 = C.Graphite
PLogoBox.BackgroundTransparency = 0.05
PLogoBox.Position = UDim2.new(0, 16, 0, 15)
PLogoBox.Size = UDim2.new(0, 35, 0, 35)
PLogoBox.ZIndex = 10

local PLogoCorner = Instance.new("UICorner")
PLogoCorner.CornerRadius = UDim.new(0, 10)
PLogoCorner.Parent = PLogoBox

local PLogoStroke = Instance.new("UIStroke")
PLogoStroke.Color = C.PurpleLight
PLogoStroke.Transparency = 0.12
PLogoStroke.Thickness = 1.2
PLogoStroke.Parent = PLogoBox

local PLogoGradient = Instance.new("UIGradient")
PLogoGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(77, 53, 103)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(107, 39, 54))
})
PLogoGradient.Rotation = 45
PLogoGradient.Parent = PLogoBox

local PLogo = Instance.new("TextLabel")
PLogo.Name = "P"
PLogo.Parent = PLogoBox
PLogo.BackgroundTransparency = 1
PLogo.Size = UDim2.new(1, 0, 1, 0)
PLogo.Font = Enum.Font.GothamBlack
PLogo.Text = "P"
PLogo.TextColor3 = Color3.fromRGB(255, 224, 232)
PLogo.TextSize = 21
PLogo.TextXAlignment = Enum.TextXAlignment.Center
PLogo.TextYAlignment = Enum.TextYAlignment.Center
PLogo.ZIndex = 11

local LogoTextStroke = Instance.new("UIStroke")
LogoTextStroke.Color = C.RedLight
LogoTextStroke.Transparency = 0.65
LogoTextStroke.Thickness = 0.6
LogoTextStroke.Parent = PLogo

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Name = "TitleLabel"
TitleLabel.Parent = MainFrame
TitleLabel.BackgroundTransparency = 1
TitleLabel.Position = UDim2.new(0, 61, 0, 13)
TitleLabel.Size = UDim2.new(1, -112, 0, 25)
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.Text = "PYROVEX HUB SHADER V6"
TitleLabel.TextColor3 = C.White
TitleLabel.TextSize = 12
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.ZIndex = 10

local SubtitleLabel = Instance.new("TextLabel")
SubtitleLabel.Name = "Subtitle"
SubtitleLabel.Parent = MainFrame
SubtitleLabel.BackgroundTransparency = 1
SubtitleLabel.Position = UDim2.new(0, 62, 0, 36)
SubtitleLabel.Size = UDim2.new(1, -112, 0, 15)
SubtitleLabel.Font = Enum.Font.GothamMedium
SubtitleLabel.Text = "By Kingflame/Pyro Vex Hub"
SubtitleLabel.TextColor3 = C.Muted
SubtitleLabel.TextSize = 8
SubtitleLabel.TextXAlignment = Enum.TextXAlignment.Left
SubtitleLabel.ZIndex = 10

local CloseBtn = Instance.new("TextButton")
CloseBtn.Name = "Close"
CloseBtn.Parent = MainFrame
CloseBtn.BackgroundColor3 = C.Graphite
CloseBtn.BackgroundTransparency = 0
CloseBtn.Position = UDim2.new(1, -39, 0, 18)
CloseBtn.Size = UDim2.new(0, 25, 0, 25)
CloseBtn.Font = Enum.Font.GothamMedium
CloseBtn.Text = "×"
CloseBtn.TextColor3 = C.White
CloseBtn.TextSize = 20
CloseBtn.AutoButtonColor = false
CloseBtn.ZIndex = 20

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 8)
CloseCorner.Parent = CloseBtn

local CloseGradient = Instance.new("UIGradient")
CloseGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(119, 47, 64)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(67, 35, 55))
})
CloseGradient.Rotation = 90
CloseGradient.Parent = CloseBtn

local CloseStroke = Instance.new("UIStroke")
CloseStroke.Color = C.RedLight
CloseStroke.Transparency = 0.4
CloseStroke.Thickness = 1
CloseStroke.Parent = CloseBtn

local HeaderLine = Instance.new("Frame")
HeaderLine.Name = "HeaderLine"
HeaderLine.Parent = MainFrame
HeaderLine.BackgroundColor3 = C.Red
HeaderLine.BackgroundTransparency = 0.1
HeaderLine.BorderSizePixel = 0
HeaderLine.Position = UDim2.new(0, 16, 0, 62)
HeaderLine.Size = UDim2.new(1, -32, 0, 1)
HeaderLine.ZIndex = 6

local HeaderGradient = Instance.new("UIGradient")
HeaderGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, C.Purple),
    ColorSequenceKeypoint.new(0.5, C.Red),
    ColorSequenceKeypoint.new(1, C.Purple)
})
HeaderGradient.Parent = HeaderLine

local SectionLabel = Instance.new("TextLabel")
SectionLabel.Name = "SectionLabel"
SectionLabel.Parent = MainFrame
SectionLabel.BackgroundTransparency = 1
SectionLabel.Position = UDim2.new(0, 17, 0, 72)
SectionLabel.Size = UDim2.new(1, -34, 0, 17)
SectionLabel.Font = Enum.Font.GothamBold
SectionLabel.Text = "LIGHTING PRESETS"
SectionLabel.TextColor3 = C.Muted
SectionLabel.TextSize = 9
SectionLabel.TextXAlignment = Enum.TextXAlignment.Left
SectionLabel.ZIndex = 5

local ScrollFrame = Instance.new("ScrollingFrame")
ScrollFrame.Name = "ShaderList"
ScrollFrame.Parent = MainFrame
ScrollFrame.BackgroundTransparency = 1
ScrollFrame.BorderSizePixel = 0
ScrollFrame.Position = UDim2.new(0, 14, 0, 96)
ScrollFrame.Size = UDim2.new(1, -28, 1, -108)
ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
ScrollFrame.ScrollBarThickness = 3
ScrollFrame.ScrollBarImageColor3 = C.PurpleLight
ScrollFrame.ScrollBarImageTransparency = 0.25
ScrollFrame.ScrollingDirection = Enum.ScrollingDirection.Y
ScrollFrame.Active = true
ScrollFrame.ZIndex = 4

local ScrollPadding = Instance.new("UIPadding")
ScrollPadding.PaddingTop = UDim.new(0, 3)
ScrollPadding.PaddingBottom = UDim.new(0, 5)
ScrollPadding.PaddingLeft = UDim.new(0, 2)
ScrollPadding.PaddingRight = UDim.new(0, 2)
ScrollPadding.Parent = ScrollFrame

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = ScrollFrame
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 8)

local ButtonNormal = Color3.fromRGB(34, 33, 42)
local ButtonHover = Color3.fromRGB(55, 43, 61)
local ButtonPressed = Color3.fromRGB(75, 39, 56)

local ButtonTween = TweenInfo.new(0.22, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
local PressTween = TweenInfo.new(0.10, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

local SelectedButton
local ButtonRecords = {}

local function createMenuButton(text, order, callback)
    local btn = Instance.new("TextButton")
    btn.Name = text .. "Button"
    btn.Parent = ScrollFrame
    btn.BackgroundColor3 = ButtonNormal
    btn.BackgroundTransparency = 0.02
    btn.BorderSizePixel = 0
    btn.Size = UDim2.new(1, -4, 0, 45)
    btn.Font = Enum.Font.GothamSemibold
    btn.Text = ""
    btn.LayoutOrder = order
    btn.AutoButtonColor = false
    btn.ClipsDescendants = true
    btn.ZIndex = 5

    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 10)
    btnCorner.Parent = btn

    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(75, 65, 82)
    stroke.Transparency = 0.25
    stroke.Thickness = 1
    stroke.Parent = btn

    local buttonGradient = Instance.new("UIGradient")
    buttonGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(44, 41, 53)),
        ColorSequenceKeypoint.new(0.55, Color3.fromRGB(33, 32, 41)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(49, 32, 40))
    })
    buttonGradient.Rotation = 15
    buttonGradient.Parent = btn

    local accent = Instance.new("Frame")
    accent.Name = "Accent"
    accent.Parent = btn
    accent.BackgroundColor3 = C.PurpleLight
    accent.BorderSizePixel = 0
    accent.Position = UDim2.new(0, 0, 0.2, 0)
    accent.Size = UDim2.new(0, 3, 0.6, 0)
    accent.BackgroundTransparency = 0.08
    accent.ZIndex = 7

    local accentCorner = Instance.new("UICorner")
    accentCorner.CornerRadius = UDim.new(1, 0)
    accentCorner.Parent = accent

    local label = Instance.new("TextLabel")
    label.Name = "ButtonLabel"
    label.Parent = btn
    label.BackgroundTransparency = 1
    label.Position = UDim2.new(0, 15, 0, 0)
    label.Size = UDim2.new(1, -53, 1, 0)
    label.Font = Enum.Font.GothamSemibold
    label.Text = text
    label.TextColor3 = C.White
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.ZIndex = 7

    local arrow = Instance.new("TextLabel")
    arrow.Name = "Arrow"
    arrow.Parent = btn
    arrow.BackgroundTransparency = 1
    arrow.Position = UDim2.new(1, -32, 0, 0)
    arrow.Size = UDim2.new(0, 20, 1, 0)
    arrow.Font = Enum.Font.GothamMedium
    arrow.Text = "›"
    arrow.TextColor3 = C.Muted
    arrow.TextSize = 23
    arrow.ZIndex = 7

    local originalSize = btn.Size
    local isHovered = false

    ButtonRecords[#ButtonRecords + 1] = {
        Button = btn,
        Stroke = stroke,
        Accent = accent,
        Label = label,
        Arrow = arrow,
    }

    btn.MouseEnter:Connect(function()
        isHovered = true

        TweenService:Create(btn, ButtonTween, {
            BackgroundColor3 = ButtonHover,
        }):Play()

        TweenService:Create(stroke, ButtonTween, {
            Color = C.PurpleLight,
            Transparency = 0.05,
        }):Play()

        TweenService:Create(accent, ButtonTween, {
            BackgroundColor3 = C.RedLight,
            Size = UDim2.new(0, 4, 0.76, 0),
            Position = UDim2.new(0, 0, 0.12, 0),
        }):Play()

        TweenService:Create(arrow, ButtonTween, {
            TextColor3 = C.RedLight,
            Position = UDim2.new(1, -27, 0, 0),
        }):Play()
    end)

    btn.MouseLeave:Connect(function()
        isHovered = false

        TweenService:Create(btn, ButtonTween, {
            BackgroundColor3 = SelectedButton == btn and ButtonPressed or ButtonNormal,
            Size = originalSize,
        }):Play()

        TweenService:Create(stroke, ButtonTween, {
            Color = SelectedButton == btn and C.RedLight or Color3.fromRGB(75, 65, 82),
            Transparency = SelectedButton == btn and 0.05 or 0.25,
        }):Play()

        TweenService:Create(accent, ButtonTween, {
            BackgroundColor3 = SelectedButton == btn and C.RedLight or C.PurpleLight,
            Size = UDim2.new(0, 3, 0.6, 0),
            Position = UDim2.new(0, 0, 0.2, 0),
        }):Play()

        TweenService:Create(arrow, ButtonTween, {
            TextColor3 = C.Muted,
            Position = UDim2.new(1, -32, 0, 0),
        }):Play()
    end)

    btn.MouseButton1Down:Connect(function()
        TweenService:Create(btn, PressTween, {
            BackgroundColor3 = ButtonPressed,
            Size = UDim2.new(1, -8, 0, 43),
        }):Play()
    end)

    btn.MouseButton1Up:Connect(function()
        TweenService:Create(btn, PressTween, {
            BackgroundColor3 = isHovered and ButtonHover or ButtonNormal,
            Size = originalSize,
        }):Play()
    end)

    btn.Activated:Connect(function()
        callback()

        if SelectedButton and SelectedButton.Parent then
            for _, record in ipairs(ButtonRecords) do
                if record.Button == SelectedButton then
                    TweenService:Create(record.Stroke, ButtonTween, {
                        Color = Color3.fromRGB(75, 65, 82),
                        Transparency = 0.25,
                    }):Play()
                    TweenService:Create(record.Accent, ButtonTween, {
                        BackgroundColor3 = C.PurpleLight,
                    }):Play()
                end
            end
        end

        SelectedButton = btn

        TweenService:Create(btn, ButtonTween, {
            BackgroundColor3 = ButtonPressed,
        }):Play()

        TweenService:Create(stroke, ButtonTween, {
            Color = C.RedLight,
            Transparency = 0.05,
        }):Play()

        TweenService:Create(accent, ButtonTween, {
            BackgroundColor3 = C.RedLight,
        }):Play()

        TweenService:Create(arrow, ButtonTween, {
            TextColor3 = C.RedLight,
        }):Play()
    end)

    return btn
end

createMenuButton("Daytime", 1, applyDaytime)
createMenuButton("Sunset", 2, applySunset)
createMenuButton("Night", 3, applyNight)
createMenuButton("Cloudy", 4, applyCloudy)
createMenuButton("Shore", 5, applyShore)
createMenuButton("Cinematic", 6, applyCinematic)

-- Dragging
local dragging = false
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    MainFrame.Position = UDim2.new(
        startPos.X.Scale,
        startPos.X.Offset + delta.X,
                startPos.Y.Scale,
        startPos.Y.Offset + delta.Y
    )
end

local DragHandle = Instance.new("Frame")
DragHandle.Name = "DragHandle"
DragHandle.Parent = MainFrame
DragHandle.BackgroundTransparency = 1
DragHandle.Position = UDim2.new(0, 55, 0, 0)
DragHandle.Size = UDim2.new(1, -105, 0, 60)
DragHandle.Active = true
DragHandle.ZIndex = 12

DragHandle.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then

        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

DragHandle.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement
        or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

-- Close animation
local closing = false

CloseBtn.MouseEnter:Connect(function()
    TweenService:Create(CloseBtn, ButtonTween, {
        BackgroundColor3 = C.Red,
    }):Play()

    TweenService:Create(CloseStroke, ButtonTween, {
        Color = C.RedLight,
        Transparency = 0.05,
    }):Play()
end)

CloseBtn.MouseLeave:Connect(function()
    TweenService:Create(CloseBtn, ButtonTween, {
        BackgroundColor3 = C.Graphite,
    }):Play()

    TweenService:Create(CloseStroke, ButtonTween, {
        Color = C.RedLight,
        Transparency = 0.4,
    }):Play()
end)

CloseBtn.Activated:Connect(function()
    if closing then
        return
    end

    closing = true

    local fadeInfo = TweenInfo.new(
        0.28,
        Enum.EasingStyle.Quint,
        Enum.EasingDirection.In
    )

    TweenService:Create(MainFrame, fadeInfo, {
        BackgroundTransparency = 1,
        Size = UDim2.new(0, 245, 0, 315),
        Position = MainFrame.Position + UDim2.new(0, 0, 0, 12),
    }):Play()

    TweenService:Create(FrameStroke, fadeInfo, {
        Transparency = 1,
    }):Play()

    for _, obj in ipairs(MainFrame:GetDescendants()) do
        if obj:IsA("TextLabel") or obj:IsA("TextButton") then
            TweenService:Create(obj, fadeInfo, {
                TextTransparency = 1,
                BackgroundTransparency = 1,
            }):Play()
        elseif obj:IsA("UIStroke") then
            TweenService:Create(obj, fadeInfo, {
                Transparency = 1,
            }):Play()
        elseif obj:IsA("Frame") and obj ~= DragHandle then
            TweenService:Create(obj, fadeInfo, {
                BackgroundTransparency = 1,
            }):Play()
        end
    end

    task.wait(0.31)

    if ScreenGui.Parent then
        ScreenGui:Destroy()
    end
end)

-- Opening animation
MainFrame.Size = UDim2.new(0, 235, 0, 305)
MainFrame.Position = UDim2.new(0.08, 0, 0.15, 14)
MainFrame.BackgroundTransparency = 1
FrameStroke.Transparency = 1

for _, obj in ipairs(MainFrame:GetDescendants()) do
    if obj:IsA("TextLabel") or obj:IsA("TextButton") then
        obj.TextTransparency = 1
    elseif obj:IsA("UIStroke") then
        obj.Transparency = 1
    elseif obj:IsA("Frame") and obj ~= DragHandle then
        if obj ~= MainFrame then
            obj.BackgroundTransparency = 1
        end
    end
end

local openTween = TweenInfo.new(
    0.48,
    Enum.EasingStyle.Back,
    Enum.EasingDirection.Out
)

TweenService:Create(MainFrame, openTween, {
    Size = UDim2.new(0, 270, 0, 350),
    Position = UDim2.new(0.08, 0, 0.15, 0),
    BackgroundTransparency = 0.04,
}):Play()

TweenService:Create(FrameStroke, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {
    Transparency = 0.28,
}):Play()

for _, obj in ipairs(MainFrame:GetDescendants()) do
    if obj:IsA("TextLabel") or obj:IsA("TextButton") then
        TweenService:Create(
            obj,
            TweenInfo.new(0.36, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
            {TextTransparency = 0}
        ):Play()

    elseif obj:IsA("UIStroke") then
        local targetTransparency = 0.25

        if obj == PLogoStroke then
            targetTransparency = 0.12
        elseif obj == LogoTextStroke then
            targetTransparency = 0.65
        elseif obj == CloseStroke then
            targetTransparency = 0.4
        elseif obj.Parent and obj.Parent:IsA("TextButton") then
            targetTransparency = 0.25
        end

        TweenService:Create(
            obj,
            TweenInfo.new(0.42, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
            {Transparency = targetTransparency}
        ):Play()

    elseif obj:IsA("Frame") and obj ~= MainFrame and obj ~= DragHandle then
        local targetTransparency = 0

        if obj == HeaderLine or obj == OuterGlow then
            targetTransparency = 0.1
        end

        TweenService:Create(
            obj,
            TweenInfo.new(0.38, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
            {BackgroundTransparency = targetTransparency}
        ):Play()
    end
end

-- Animated red-purple accent
task.spawn(function()
    while ScreenGui.Parent and not closing do
        local gradientTween = TweenService:Create(
            OuterGlowGradient,
            TweenInfo.new(3.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
            {Rotation = 180}
        )

        gradientTween:Play()
        gradientTween.Completed:Wait()

        if not ScreenGui.Parent or closing then
            break
        end

        local reverseTween = TweenService:Create(
            OuterGlowGradient,
            TweenInfo.new(3.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
            {Rotation = 360}
        )

        reverseTween:Play()
        reverseTween.Completed:Wait()
    end
end)

-- Subtle logo pulse
task.spawn(function()
    while ScreenGui.Parent and not closing do
        TweenService:Create(
            PLogoStroke,
            TweenInfo.new(1.1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
            {Transparency = 0.35}
        ):Play()

        task.wait(1.1)

        if not ScreenGui.Parent or closing then
            break
        end

        TweenService:Create(
            PLogoStroke,
            TweenInfo.new(1.1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
            {Transparency = 0.12}
        ):Play()

        task.wait(1.1)
    end
end)
