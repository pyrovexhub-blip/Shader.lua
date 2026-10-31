local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")

local LocalPlayer = Players.LocalPlayer
local TargetParent = (gethui and gethui()) or LocalPlayer:WaitForChild("PlayerGui")

if TargetParent:FindFirstChild("PyrovexShaderV2Canvas") then
    TargetParent.PyrovexShaderV2Canvas:Destroy()
end

--==================================================
-- LIGHTING FUNCTIONS
--==================================================

local function clearEffects()
    for _, v in pairs(Lighting:GetChildren()) do
        if v:IsA("PostEffect") or v:IsA("Atmosphere") then
            v:Destroy()
        end
    end
end

local function applyDaytime()
    clearEffects()
    Lighting.ClockTime = 14
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
    Lighting.Brightness = 4
    Lighting.GlobalShadows = true
    Lighting.ShadowSoftness = 0
    Lighting.EnvironmentDiffuseScale = 1
    Lighting.EnvironmentSpecularScale = 1
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
    atm.Haze = 2
end

local function applyNight()
    clearEffects()
    Lighting.ClockTime = 0
    Lighting.Brightness = 1.8
    Lighting.GlobalShadows = true
    Lighting.ShadowSoftness = 0.2
    Lighting.EnvironmentDiffuseScale = 0.8
    Lighting.EnvironmentSpecularScale = 1
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
    Lighting.ClockTime = 12
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
    atm.Haze = 3
end

local function applyShore()
    clearEffects()
    Lighting.ClockTime = 16.8
    Lighting.Brightness = 4.5
    Lighting.GlobalShadows = true
    Lighting.EnvironmentDiffuseScale = 1
    Lighting.EnvironmentSpecularScale = 1
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
    Lighting.EnvironmentDiffuseScale = 1
    Lighting.EnvironmentSpecularScale = 1
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
    dof.NearIntensity = 0
end

--==================================================
-- CRIMSON UI THEME
--==================================================

local C = {
    Background = Color3.fromRGB(13, 10, 15),
    Surface = Color3.fromRGB(23, 17, 24),
    SurfaceLight = Color3.fromRGB(34, 23, 32),
    SurfaceHover = Color3.fromRGB(49, 25, 38),

    Crimson = Color3.fromRGB(155, 25, 55),
    CrimsonLight = Color3.fromRGB(205, 38, 75),
    CrimsonBright = Color3.fromRGB(255, 65, 100),
    CrimsonDark = Color3.fromRGB(90, 13, 34),

    White = Color3.fromRGB(250, 240, 245),
    Muted = Color3.fromRGB(155, 137, 148),
    Dim = Color3.fromRGB(95, 77, 88),

    Black = Color3.fromRGB(8, 7, 11),
    Green = Color3.fromRGB(105, 220, 155),
}

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "PyrovexShaderV2Canvas"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true
ScreenGui.Parent = TargetParent

--==================================================
-- UI HELPERS
--==================================================

local function Corner(parent, radius)
    local obj = Instance.new("UICorner")
    obj.CornerRadius = UDim.new(0, radius)
    obj.Parent = parent
    return obj
end

local function Stroke(parent, color, thickness, transparency)
    local obj = Instance.new("UIStroke")
    obj.Color = color
    obj.Thickness = thickness
    obj.Transparency = transparency or 0
    obj.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    obj.Parent = parent
    return obj
end

local function Gradient(parent, colors, rotation)
    local obj = Instance.new("UIGradient")
    obj.Color = ColorSequence.new(colors)
    obj.Rotation = rotation or 0
    obj.Parent = parent
    return obj
end

local function NewTween(object, duration, properties, style, direction)
    local tween = TweenService:Create(
        object,
        TweenInfo.new(
            duration,
            style or Enum.EasingStyle.Quint,
            direction or Enum.EasingDirection.Out
        ),
        properties
    )

    tween:Play()
    return tween
end

local function CreateLabel(parent, name, text, position, size, font, textSize, color)
    local label = Instance.new("TextLabel")
    label.Name = name
    label.Parent = parent
    label.BackgroundTransparency = 1
    label.Position = position
    label.Size = size
    label.Font = font
    label.Text = text
    label.TextSize = textSize
    label.TextColor3 = color
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.TextYAlignment = Enum.TextYAlignment.Center
    label.ZIndex = 10
    return label
end

--==================================================
-- MAIN WINDOW
--==================================================

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = C.Background
MainFrame.BackgroundTransparency = 0
MainFrame.BorderSizePixel = 0
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.Size = UDim2.new(0, 280, 0, 390)
MainFrame.Active = true
MainFrame.ClipsDescendants = true
MainFrame.ZIndex = 2

local MainScale = Instance.new("UIScale")
MainScale.Scale = 0.9
MainScale.Parent = MainFrame

Corner(MainFrame, 17)

Gradient(MainFrame, {
    ColorSequenceKeypoint.new(0, Color3.fromRGB(35, 17, 29)),
    ColorSequenceKeypoint.new(0.45, Color3.fromRGB(17, 13, 21)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(31, 11, 20)),
}, 135)

Stroke(MainFrame, C.CrimsonLight, 1.4, 0.2)

--==================================================
-- OUTER GLOW
--==================================================

local Glow = Instance.new("Frame")
Glow.Name = "Glow"
Glow.Parent = MainFrame
Glow.BackgroundColor3 = C.Crimson
Glow.BorderSizePixel = 0
Glow.Size = UDim2.new(1, 0, 0, 4)
Glow.ZIndex = 15

Gradient(Glow, {
    ColorSequenceKeypoint.new(0, C.CrimsonDark),
    ColorSequenceKeypoint.new(0.3, C.CrimsonBright),
    ColorSequenceKeypoint.new(0.7, C.CrimsonLight),
    ColorSequenceKeypoint.new(1, C.CrimsonDark),
}, 0)

local BottomAccent = Instance.new("Frame")
BottomAccent.Parent = MainFrame
BottomAccent.BackgroundColor3 = C.Crimson
BottomAccent.BackgroundTransparency = 0.3
BottomAccent.BorderSizePixel = 0
BottomAccent.Position = UDim2.new(0, 18, 1, -3)
BottomAccent.Size = UDim2.new(1, -36, 0, 1)
BottomAccent.ZIndex = 8

--==================================================
-- HEADER
--==================================================

local LogoBox = Instance.new("Frame")
LogoBox.Name = "LogoBox"
LogoBox.Parent = MainFrame
LogoBox.BackgroundColor3 = C.CrimsonDark
LogoBox.Position = UDim2.new(0, 17, 0, 17)
LogoBox.Size = UDim2.new(0, 43, 0, 43)
LogoBox.ZIndex = 10

Corner(LogoBox, 12)
Stroke(LogoBox, C.CrimsonBright, 1.3, 0.2)

Gradient(LogoBox, {
    ColorSequenceKeypoint.new(0, Color3.fromRGB(130, 23, 52)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(42, 12, 27)),
}, 45)

local Logo = CreateLabel(
    LogoBox,
    "Logo",
    "P",
    UDim2.new(0, 0, 0, 0),
    UDim2.new(1, 0, 1, 0),
    Enum.Font.GothamBlack,
    27,
    C.White
)

Logo.TextXAlignment = Enum.TextXAlignment.Center
Logo.TextYAlignment = Enum.TextYAlignment.Center

CreateLabel(
    MainFrame,
    "Title",
    "PYROVEX HUB",
    UDim2.new(0, 70, 0, 17),
    UDim2.new(1, -125, 0, 23),
    Enum.Font.GothamBlack,
    14,
    C.White
)

CreateLabel(
    MainFrame,
    "Subtitle",
    "By Kingflame • V2",
    UDim2.new(0, 71, 0, 40),
    UDim2.new(1, -125, 0, 17),
    Enum.Font.GothamMedium,
    8,
    C.Muted
)

local CloseBtn = Instance.new("TextButton")
CloseBtn.Name = "Close"
CloseBtn.Parent = MainFrame
CloseBtn.BackgroundColor3 = C.SurfaceLight
CloseBtn.BorderSizePixel = 0
CloseBtn.Position = UDim2.new(1, -44, 0, 20)
CloseBtn.Size = UDim2.new(0, 27, 0, 27)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.Text = "×"
CloseBtn.TextColor3 = C.White
CloseBtn.TextSize = 21
CloseBtn.AutoButtonColor = false
CloseBtn.ZIndex = 20

Corner(CloseBtn, 9)

local CloseStroke = Stroke(CloseBtn, C.CrimsonLight, 1, 0.45)

CloseBtn.MouseEnter:Connect(function()
    NewTween(CloseBtn, 0.2, {
        BackgroundColor3 = C.CrimsonDark
    })

    NewTween(CloseStroke, 0.2, {
        Transparency = 0.05
    })
end)

CloseBtn.MouseLeave:Connect(function()
    NewTween(CloseBtn, 0.2, {
        BackgroundColor3 = C.SurfaceLight
    })

    NewTween(CloseStroke, 0.2, {
        Transparency = 0.45
    })
end)

--==================================================
-- HEADER STATUS
--==================================================

local StatusFrame = Instance.new("Frame")
StatusFrame.Parent = MainFrame
StatusFrame.BackgroundColor3 = C.Surface
StatusFrame.Position = UDim2.new(0, 17, 0, 73)
StatusFrame.Size = UDim2.new(1, -34, 0, 37)
StatusFrame.BorderSizePixel = 0
StatusFrame.ZIndex = 5

Corner(StatusFrame, 9)
Stroke(StatusFrame, C.CrimsonDark, 1, 0.35)

local StatusDot = Instance.new("Frame")
StatusDot.Parent = StatusFrame
StatusDot.BackgroundColor3 = C.Green
StatusDot.Position = UDim2.new(0, 12, 0.5, -3)
StatusDot.Size = UDim2.new(0, 6, 0, 6)
StatusDot.BorderSizePixel = 0
StatusDot.ZIndex = 7

Corner(StatusDot, 10)

CreateLabel(
    StatusFrame,
    "Status",
    "GRAPHICS SYSTEM ONLINE",
    UDim2.new(0, 26, 0, 0),
    UDim2.new(1, -38, 1, 0),
    Enum.Font.GothamBold,
    9,
    C.Muted
)

CreateLabel(
    StatusFrame,
    "Version",
    "V2",
    UDim2.new(1, -38, 0, 0),
    UDim2.new(0, 25, 1, 0),
    Enum.Font.GothamBlack,
    9,
    C.CrimsonBright
)

--==================================================
-- SECTION HEADER
--==================================================

CreateLabel(
    MainFrame,
    "SectionLabel",
    "VISUAL PRESETS",
    UDim2.new(0, 19, 0, 123),
    UDim2.new(1, -38, 0, 19),
    Enum.Font.GothamBlack,
    10,
    C.White
)

CreateLabel(
    MainFrame,
    "SectionDescription",
    "Choose your preferred atmosphere",
    UDim2.new(0, 19, 0, 143),
    UDim2.new(1, -38, 0, 15),
    Enum.Font.GothamMedium,
    8,
    C.Muted
)

local SectionLine = Instance.new("Frame")
SectionLine.Parent = MainFrame
SectionLine.BackgroundColor3 = C.Crimson
SectionLine.BackgroundTransparency = 0.5
SectionLine.BorderSizePixel = 0
SectionLine.Position = UDim2.new(0, 19, 0, 164)
SectionLine.Size = UDim2.new(1, -38, 0, 1)
SectionLine.ZIndex = 5

--==================================================
-- SCROLLING AREA
--==================================================

local ScrollFrame = Instance.new("ScrollingFrame")
ScrollFrame.Name = "ShaderList"
ScrollFrame.Parent = MainFrame
ScrollFrame.BackgroundTransparency = 1
ScrollFrame.BorderSizePixel = 0
ScrollFrame.Position = UDim2.new(0, 15, 0, 174)
ScrollFrame.Size = UDim2.new(1, -30, 1, -216)
ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
ScrollFrame.ScrollBarThickness = 3
ScrollFrame.ScrollBarImageColor3 = C.CrimsonBright
ScrollFrame.ScrollBarImageTransparency = 0.15
ScrollFrame.ScrollingDirection = Enum.ScrollingDirection.Y
ScrollFrame.Active = true
ScrollFrame.ZIndex = 5

local ScrollPadding = Instance.new("UIPadding")
ScrollPadding.PaddingTop = UDim.new(0, 4)
ScrollPadding.PaddingBottom = UDim.new(0, 8)
ScrollPadding.PaddingLeft = UDim.new(0, 3)
ScrollPadding.PaddingRight = UDim.new(0, 3)
ScrollPadding.Parent = ScrollFrame

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = ScrollFrame
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 9)

--==================================================
-- BUTTON SYSTEM
--==================================================

local ButtonNormal = Color3.fromRGB(29, 21, 29)
local ButtonHover = Color3.fromRGB(48, 24, 36)
local ButtonSelected = Color3.fromRGB(72, 23, 42)

local SelectedButton = nil
local ButtonRecords = {}

local function createMenuButton(text, order, callback)
    local btn = Instance.new("TextButton")
    btn.Name = text .. "Button"
    btn.Parent = ScrollFrame
    btn.BackgroundColor3 = ButtonNormal
    btn.BackgroundTransparency = 0
    btn.BorderSizePixel = 0
    btn.Size = UDim2.new(1, -6, 0, 52)
    btn.Font = Enum.Font.GothamSemibold
    btn.Text = ""
    btn.LayoutOrder = order
    btn.AutoButtonColor = false
    btn.ClipsDescendants = true
    btn.ZIndex = 6

    Corner(btn, 11)

    local stroke = Stroke(
        btn,
        Color3.fromRGB(76, 48, 62),
        1,
        0.35
    )

    local gradient = Gradient(btn, {
        ColorSequenceKeypoint.new(0, Color3.fromRGB(43, 28, 39)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(29, 21, 30)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(44, 22, 34)),
    }, 15)

    local accent = Instance.new("Frame")
    accent.Name = "Accent"
    accent.Parent = btn
    accent.BackgroundColor3 = C.Crimson
    accent.BorderSizePixel = 0
    accent.Position = UDim2.new(0, 0, 0.2, 0)
    accent.Size = UDim2.new(0, 3, 0.6, 0)
    accent.ZIndex = 8

    Corner(accent, 5)

    local iconBox = Instance.new("Frame")
    iconBox.Parent = btn
    iconBox.BackgroundColor3 = C.SurfaceLight
    iconBox.BorderSizePixel = 0
    iconBox.Position = UDim2.new(0, 11, 0.5, -15)
    iconBox.Size = UDim2.new(0, 30, 0, 30)
    iconBox.ZIndex = 8

    Corner(iconBox, 9)

    local iconStroke = Stroke(iconBox, C.CrimsonDark, 1, 0.35)

    local icons = {
        Daytime = "☀",
        Sunset = "◉",
        Night = "🌑",
        Cloudy = "☁",
        Shore = "≈",
        Cinematic = "🎞️",
    }

    local iconLabel = CreateLabel(
        iconBox,
        "Icon",
        icons[text] or "✦",
        UDim2.new(0, 0, 0, 0),
        UDim2.new(1, 0, 1, 0),
        Enum.Font.GothamBold,
        18,
        C.CrimsonBright
    )

    iconLabel.TextXAlignment = Enum.TextXAlignment.Center

    local descriptions = {
        Daytime = "Natural daylight atmosphere",
        Sunset = "Warm crimson sunset tones",
        Night = "Deep midnight atmosphere",
        Cloudy = "Soft overcast environment",
        Shore = "Golden coastal atmosphere",
        Cinematic = "Enhanced cinematic visuals",
    }

    local label = CreateLabel(
        btn,
        "ButtonLabel",
        text,
        UDim2.new(0, 51, 0, 6),
        UDim2.new(1, -90, 0, 20),
        Enum.Font.GothamBold,
        12,
        C.White
    )

    local sublabel = CreateLabel(
        btn,
        "Description",
        descriptions[text] or "Visual lighting preset",
        UDim2.new(0, 51, 0, 27),
        UDim2.new(1, -90, 0, 15),
        Enum.Font.GothamMedium,
        8,
        C.Muted
    )

    local arrow = CreateLabel(
        btn,
        "Arrow",
        "›",
        UDim2.new(1, -29, 0, 0),
        UDim2.new(0, 19, 1, 0),
        Enum.Font.GothamMedium,
        24,
        C.Dim
    )

    arrow.TextXAlignment = Enum.TextXAlignment.Center

    local indicator = Instance.new("Frame")
    indicator.Name = "SelectedIndicator"
    indicator.Parent = btn
    indicator.BackgroundColor3 = C.CrimsonBright
    indicator.BorderSizePixel = 0
    indicator.AnchorPoint = Vector2.new(1, 0.5)
    indicator.Position = UDim2.new(1, -14, 0.5, 0)
    indicator.Size = UDim2.new(0, 5, 0, 5)
    indicator.BackgroundTransparency = 1
    indicator.ZIndex = 9

    Corner(indicator, 10)

    local record = {
        Button = btn,
        Stroke = stroke,
        Accent = accent,
        Label = label,
        Arrow = arrow,
        Icon = iconBox,
        IconStroke = iconStroke,
        IconLabel = iconLabel,
        Indicator = indicator,
        Gradient = gradient,
    }

    table.insert(ButtonRecords, record)

    local function setSelected(state)
        if state then
            NewTween(btn, 0.22, {
                BackgroundColor3 = ButtonSelected
            })

            NewTween(stroke, 0.22, {
                Color = C.CrimsonBright,
                Transparency = 0.05
            })

            NewTween(accent, 0.22, {
                BackgroundColor3 = C.CrimsonBright,
                Size = UDim2.new(0, 4, 0.75, 0),
                Position = UDim2.new(0, 0, 0.125, 0)
            })

            NewTween(iconBox, 0.22, {
                BackgroundColor3 = C.CrimsonDark
            })

            NewTween(iconStroke, 0.22, {
                Color = C.CrimsonBright,
                Transparency = 0.1
            })

            NewTween(iconLabel, 0.22, {
                              TextColor3 = C.White
            })

            NewTween(label, 0.22, {
                TextColor3 = C.CrimsonBright
            })

            NewTween(arrow, 0.22, {
                TextColor3 = C.CrimsonBright,
                Position = UDim2.new(1, -25, 0, 0)
            })

            NewTween(indicator, 0.22, {
                BackgroundTransparency = 0,
                Size = UDim2.new(0, 6, 0, 6)
            })
        else
            NewTween(btn, 0.22, {
                BackgroundColor3 = ButtonNormal
            })

            NewTween(stroke, 0.22, {
                Color = Color3.fromRGB(76, 48, 62),
                Transparency = 0.35
            })

            NewTween(accent, 0.22, {
                BackgroundColor3 = C.Crimson,
                Size = UDim2.new(0, 3, 0.6, 0),
                Position = UDim2.new(0, 0, 0.2, 0)
            })

            NewTween(iconBox, 0.22, {
                BackgroundColor3 = C.SurfaceLight
            })

            NewTween(iconStroke, 0.22, {
                Color = C.CrimsonDark,
                Transparency = 0.35
            })

            NewTween(iconLabel, 0.22, {
                TextColor3 = C.CrimsonBright
            })

            NewTween(label, 0.22, {
                TextColor3 = C.White
            })

            NewTween(arrow, 0.22, {
                TextColor3 = C.Dim,
                Position = UDim2.new(1, -29, 0, 0)
            })

            NewTween(indicator, 0.22, {
                BackgroundTransparency = 1,
                Size = UDim2.new(0, 5, 0, 5)
            })
        end
    end

    btn.MouseEnter:Connect(function()
        if SelectedButton ~= btn then
            NewTween(btn, 0.18, {
                BackgroundColor3 = ButtonHover
            })

            NewTween(stroke, 0.18, {
                Transparency = 0.12
            })

            NewTween(arrow, 0.18, {
                TextColor3 = C.CrimsonLight
            })
        end
    end)

    btn.MouseLeave:Connect(function()
        if SelectedButton ~= btn then
            NewTween(btn, 0.18, {
                BackgroundColor3 = ButtonNormal
            })

            NewTween(stroke, 0.18, {
                Transparency = 0.35
            })

            NewTween(arrow, 0.18, {
                TextColor3 = C.Dim
            })
        end
    end)

    btn.MouseButton1Click:Connect(function()
        if SelectedButton and SelectedButton ~= btn then
            for _, item in ipairs(ButtonRecords) do
                if item.Button == SelectedButton then
                    NewTween(item.Button, 0.22, {
                        BackgroundColor3 = ButtonNormal
                    })

                    NewTween(item.Stroke, 0.22, {
                        Color = Color3.fromRGB(76, 48, 62),
                        Transparency = 0.35
                    })

                    NewTween(item.Accent, 0.22, {
                        BackgroundColor3 = C.Crimson,
                        Size = UDim2.new(0, 3, 0.6, 0),
                        Position = UDim2.new(0, 0, 0.2, 0)
                    })

                    NewTween(item.Icon, 0.22, {
                        BackgroundColor3 = C.SurfaceLight
                    })

                    NewTween(item.IconStroke, 0.22, {
                        Color = C.CrimsonDark,
                        Transparency = 0.35
                    })

                    NewTween(item.IconLabel, 0.22, {
                        TextColor3 = C.CrimsonBright
                    })

                    NewTween(item.Label, 0.22, {
                        TextColor3 = C.White
                    })

                    NewTween(item.Arrow, 0.22, {
                        TextColor3 = C.Dim,
                        Position = UDim2.new(1, -29, 0, 0)
                    })

                    NewTween(item.Indicator, 0.22, {
                        BackgroundTransparency = 1,
                        Size = UDim2.new(0, 5, 0, 5)
                    })

                    break
                end
            end
        end

        SelectedButton = btn
        setSelected(true)
        callback()
    end)

    return btn
end

--==================================================
-- CREATE PRESET BUTTONS
--==================================================

createMenuButton("Daytime", 1, applyDaytime)
createMenuButton("Sunset", 2, applySunset)
createMenuButton("Night", 3, applyNight)
createMenuButton("Cloudy", 4, applyCloudy)
createMenuButton("Shore", 5, applyShore)
createMenuButton("Cinematic", 6, applyCinematic)

--==================================================
-- FOOTER
--==================================================

local Footer = Instance.new("Frame")
Footer.Parent = MainFrame
Footer.BackgroundColor3 = C.Surface
Footer.BackgroundTransparency = 0.2
Footer.BorderSizePixel = 0
Footer.Position = UDim2.new(0, 17, 1, -34)
Footer.Size = UDim2.new(1, -34, 0, 22)
Footer.ZIndex = 6

Corner(Footer, 7)

local FooterText = CreateLabel(
    Footer,
    "FooterText",
    "PYROVEX GRAPHICS  •  LOCAL PRESETS",
    UDim2.new(0, 0, 0, 0),
    UDim2.new(1, 0, 1, 0),
    Enum.Font.GothamBold,
    7,
    C.Dim
)

FooterText.TextXAlignment = Enum.TextXAlignment.Center

--==================================================
-- DRAG SYSTEM
--==================================================

local dragging = false
local dragInput = nil
local dragStart = nil
local startPosition = nil

local function updateDrag(input)
    local delta = input.Position - dragStart

    MainFrame.Position = UDim2.new(
        startPosition.X.Scale,
        startPosition.X.Offset + delta.X,
        startPosition.Y.Scale,
        startPosition.Y.Offset + delta.Y
    )
end

MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then

        dragging = true
        dragStart = input.Position
        startPosition = MainFrame.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

MainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement
        or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        updateDrag(input)
    end
end)

--==================================================
-- CLOSE BUTTON
--==================================================

local isClosing = false

CloseBtn.MouseButton1Click:Connect(function()
    if isClosing then
        return
    end

    isClosing = true

    NewTween(MainFrame, 0.25, {
        BackgroundTransparency = 1,
        Size = UDim2.new(0, 250, 0, 350)
    })

    for _, obj in ipairs(MainFrame:GetDescendants()) do
        if obj:IsA("TextLabel") or obj:IsA("TextButton") then
            NewTween(obj, 0.2, {
                TextTransparency = 1,
                BackgroundTransparency = 1
            })
        elseif obj:IsA("Frame") then
            NewTween(obj, 0.2, {
                BackgroundTransparency = 1
            })
        elseif obj:IsA("UIStroke") then
            NewTween(obj, 0.2, {
                Transparency = 1
            })
        end
    end

    task.wait(0.27)
    ScreenGui:Destroy()
end)

--==================================================
-- OPEN ANIMATION
--==================================================

MainFrame.Size = UDim2.new(0, 250, 0, 350)
MainScale.Scale = 0.85

NewTween(MainFrame, 0.45, {
    Size = UDim2.new(0, 280, 0, 390)
}, Enum.EasingStyle.Back)

NewTween(MainScale, 0.45, {
    Scale = 0.9
}, Enum.EasingStyle.Back)

--==================================================
-- DEFAULT PRESET
--==================================================

task.wait(0.5)
applyDaytime()

for _, item in ipairs(ButtonRecords) do
    if item.Button.Name == "DaytimeButton" then
        SelectedButton = item.Button

        NewTween(item.Button, 0.22, {
            BackgroundColor3 = ButtonSelected
        })

        NewTween(item.Stroke, 0.22, {
            Color = C.CrimsonBright,
            Transparency = 0.05
        })

        NewTween(item.Accent, 0.22, {
            BackgroundColor3 = C.CrimsonBright,
            Size = UDim2.new(0, 4, 0.75, 0),
            Position = UDim2.new(0, 0, 0.125, 0)
        })

        NewTween(item.Icon, 0.22, {
            BackgroundColor3 = C.CrimsonDark
        })

        NewTween(item.Label, 0.22, {
            TextColor3 = C.CrimsonBright
        })

        NewTween(item.Indicator, 0.22, {
            BackgroundTransparency = 0,
            Size = UDim2.new(0, 6, 0, 6)
        })

        break
    end
end
