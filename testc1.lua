--!native
--[[
  Licensed under the MIT License (see LICENSE file for full details).
  Copyright (c) 2026 MrY7zz

  LEGAL NOTICE:
  You are REQUIRED to retain this license header under the terms of the MIT License.
  Removing or modifying this notice may violate copyright law.
]]
--// BY MrY7zz

if not game:IsLoaded() then
	game.Loaded:Wait()
end

local vector3zero = Vector3.zero
local oldpos = workspace.CurrentCamera.CameraSubject.Parent.HumanoidRootPart.CFrame

if not sethiddenproperty then
	--error("Script is only compatible with environments that have sethiddenproperty")
	task.spawn(function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/somethingsimade/CurrentAngleV2/refs/heads/main/fallback.lua"))()
	end)
	repeat task.wait() until finished == true
	return
end

--// Tools

--// .. code ..

local UI = (gethui and gethui()) or (cloneref and cloneref(game:GetService("CoreGui"))) or (pcall(function() return game:GetService("CoreGui").Parent end) and game:GetService("CoreGui")) or game:GetService("Players").LocalPlayer:FindFirstChildOfClass("PlayerGui")

local function LoadUi(seconds)
	-- Gui to Lua
	-- Version: 3.2

	-- Instances:

	local ScreenGui = Instance.new("ScreenGui")
	local Frame = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local UIGradient = Instance.new("UIGradient")
	local UIStroke = Instance.new("UIStroke")
	local UIStroke_2 = Instance.new("UIStroke")
	local UIStroke_3 = Instance.new("UIStroke")
	local TextLabel = Instance.new("TextLabel")
	local TextLabel_2 = Instance.new("TextLabel")
	ScreenGui.IgnoreGuiInset = true

	ScreenGui.Parent = UI
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	Frame.Parent = ScreenGui
	Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Frame.BorderSizePixel = 0
	Frame.Size = UDim2.new(0, 429, 0, 79)
	Frame.Position = UDim2.new(0.5, -Frame.Size.X.Offset/2, 0.01, 0)
	UIStroke.Parent = Frame

	UIStroke_2.Color = Color3.fromRGB(65, 65, 65)
	UIStroke_3.Color = Color3.fromRGB(65, 65, 65)

	UICorner.Parent = Frame

	UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(79, 173, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(85, 127, 179))}
	UIGradient.Rotation = 40
	UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.00), NumberSequenceKeypoint.new(0.07, 0.13), NumberSequenceKeypoint.new(1.00, 0.00)}
	UIGradient.Parent = Frame

	UIStroke_3.Thickness = 0.7

	TextLabel.Parent = Frame
	TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.BackgroundTransparency = 1.000
	TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel.BorderSizePixel = 0
	TextLabel.Position = UDim2.new(0.265734255, 0, 0, 0)
	TextLabel.Size = UDim2.new(0, 200, 0, 50)
	TextLabel.Font = Enum.Font.BuilderSans
	TextLabel.Text = "MrY7zz's CurrentAngle V2 REANIMATE BY MrY7zz"
	TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.TextSize = 20.000
	UIStroke_2.Parent = TextLabel

	TextLabel_2.Parent = Frame
	TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel_2.BackgroundTransparency = 1.000
	TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel_2.BorderSizePixel = 0
	TextLabel_2.Position = UDim2.new(-0.08, 0, 0.367088616, 0)
	TextLabel_2.Size = UDim2.new(0, 500, 0, 50)
	TextLabel_2.Font = Enum.Font.BuilderSans
	TextLabel_2.Text = tostring(seconds) .. " Seconds left for reanimate to load"
	TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel_2.TextSize = 28.000

	UIStroke_3.Parent = TextLabel_2
	task.delay(seconds + 1.5, function()
		ScreenGui:Destroy()
	end)
end

local setsimulationradius = setsimulationradius
if not setsimulationradius then
	-- setsimulationradius.lua
	-- © 2025 MrY7zz (MIT License)

	local Players = game:GetService("Players")

	local newIndex
	local Index

	--// Extracting __newindex
	xpcall(function()
		game[{}] = {}
	end, function()
		newIndex = debug.info(2, "f")
	end)

	--// Extracting __index
	xpcall(function()
		return game[{}]
	end, function()
		Index = debug.info(2, "f")
	end)


	setsimulationradius = function(Radius, maxRadius)
		local LocalPlayer = Index(Players, "LocalPlayer")
		newIndex(LocalPlayer, "SimulationRadius", Radius)

		if maxRadius then
			newIndex(LocalPlayer, "MaximumSimulationRadius", maxRadius)
		end
	end
end

local game = game
local debug = debug
local debug_info = debug.info

local gameIndex
local gameNewIndex
local CFrameIndex
local CFrameMul
local CFrameAdd
local Vector3Mul

local emptyCFrame = CFrame.new()

local getrawmetatableworks = false
local isindexsupported = false

if getrawmetatable then
	local s, r = pcall(getrawmetatable, game)
	local success, res = pcall(getrawmetatable, emptyCFrame)

	if s then  
		if r.__index then
			gameIndex = r.__index
			gameNewIndex = r.__newindex
			getrawmetatableworks = true
		end
	end
	if success and s then
		if res.__index then
			CFrameIndex = res.__index
			CFrameMul = res.__mul
			CFrameAdd = res.__add
			Vector3Mul = getrawmetatable(vector3zero).__mul
		end
	end
end

if not getrawmetatableworks then
	xpcall(function()
		return game[{}]
	end, function()
		gameIndex = debug_info(2, "f")
	end)

	xpcall(function()
		game[{}] = {}
	end, function()
		gameNewIndex = debug_info(2, "f")
	end)

	xpcall(function()
		return emptyCFrame[{}]
	end, function()
		CFrameIndex = debug_info(2, "f")
	end)

	xpcall(function()
		return emptyCFrame * 9
	end, function()
		CFrameMul = debug_info(2, "f")
	end)

	xpcall(function()
		return emptyCFrame + 9
	end, function()
		CFrameAdd = debug_info(2, "f")
	end)

	xpcall(function()
		return vector3zero * 9
	end, function()
		Vector3Mul = debug_info(2, "f")
	end)
end

local successtest, err = pcall(function()
	return gameIndex(game:GetService("Workspace"), "Parent")
end)

if not successtest then
	if string.find(err:lower(), "instance expected") then
		isindexsupported = false
	else
		isindexsupported = true
	end
else
	isindexsupported = true
end

if not gameIndex then
	gameIndex = function(self, key)
		return self[key]
	end
end

if not gameNewIndex then
	gameNewIndex = function(self, key, new)
		self[key] = new
	end
end

if not CFrameIndex then
	CFrameIndex = function(self, key, new)
		self[key] = new
	end
end

if not CFrameMul then
	CFrameMul = function(a, b)
		return a * b
	end
end

if not CFrameAdd then
	CFrameAdd = function(a, b)
		return a + b
	end
end

if not Vector3Mul then
	Vector3Mul = function(a, b)
		return a * b
	end
end

local zeropointone = 0.1
local twait = task.wait
local tspawn = task.spawn
local currentfakechar = nil
local getgenv = getgenv or function()
	return _G
end

local NaN = 0/0

local dummypart = Instance.new("Part")

local function getsetting(string_, default) --// Finally
	if _G[string_] == nil then
		return default
	else
		return _G[string_]
	end
end

local GetDescendants = dummypart.GetDescendants
local IsA = dummypart.IsA
local Destroy = dummypart.Destroy

local math_random = math.random
local Vector3_new = Vector3.new

local usedefaultanims = getsetting("Use default animations", false)

local transparency_level = getsetting("Local character transparency level", 1) or getsetting("Fake character transparency level", 1) --// Backwards compatibility

local disablescripts = getsetting("Disable character scripts", true)

local fakecollisions = getsetting("Fake character should collide", false)

local nametoexcludefromtransparency = getsetting("Names to exclude from transparency", {})

local parentrealchartofakechar = getsetting("Parent real character to fake character", false)

local respawncharacter = getsetting("Respawn character", true)

local instantrespawn = getsetting("Instant respawn", false)

local hiderootpart = getsetting("Hide HumanoidRootPart", false)

local permadeathcharacter = getsetting("PermaDeath fake character", true)

local r15rig = getsetting("R15 Reanimate", false)

local clickfling = getsetting("Click Fling", false)

local displaymode = getsetting("Client sided display mode", 1)

local respawnmode = getsetting("Respawn mode", "BreakJoints")

local poscache = getsetting("Hide RootPart Distance", CFrame.new(255, 255, 0))

local LocalPlayer = game:GetService("Players").LocalPlayer

local Mouse = LocalPlayer:GetMouse()

if not LocalPlayer.Character then
	LocalPlayer.CharacterAdded:Wait()
end
twait(zeropointone)

local mode = LocalPlayer.Character:FindFirstChildOfClass("Humanoid").RigType
local R15 = Enum.HumanoidRigType.R15
if mode == R15 and hiderootpart == true then
	warn("Hide RootPart is not supported with R15, disabling")
	hiderootpart = false
end

local function removeAnims(character)
	if character == currentfakechar then
		return
	end
	local humanoid = character:WaitForChild("Humanoid", 5)
	local animator = humanoid:FindFirstChildWhichIsA("Animator")
	if animator then
		Destroy(animator)
	end
	local animateScript = character:FindFirstChild("Animate")
	if animateScript then
		Destroy(animateScript)
	end
	local a = nil
	a = humanoid.DescendantAdded:Connect(function(child)
		if child:IsA("Animator") then
			Destroy(child)
			a:Disconnect()
			a = nil
		end
	end)
end

LocalPlayer.CharacterAdded:Once(removeAnims)

LocalPlayer.Character.Archivable = true
local originalChar = LocalPlayer.Character
local fakeChar

local fakecharcreate = loadstring(game:HttpGet("https://raw.githubusercontent.com/somethingsimade/CurrentAngleV4/refs/heads/main/fakeCharHandler.lua"))

if not r15rig then
	fakeChar = fakecharcreate(originalChar, false, Enum.HumanoidRigType.R6) --originalChar:Clone()
else
	fakeChar = fakecharcreate(originalChar, false, Enum.HumanoidRigType.R15)
	fakeChar.HumanoidRootPart.CFrame = originalChar.HumanoidRootPart.CFrame
end
fakeChar.Name = LocalPlayer.Name .. "_Fake"
fakeChar.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
--local signaldiedbackend = LocalPlayer.ConnectDiedSignalBackend
local signalkill = LocalPlayer.Kill

local function respawn(character: Model)
	local typeof_ = typeof(replicatesignal) == "function"
	local Humanoid = character:WaitForChild("Humanoid")

	if respawnmode == "BreakJoints" then
		character:BreakJoints()
	elseif respawnmode == "Health" then
		Humanoid.Health = 0
	elseif respawnmode == "ServerBreakJoints" and typeof_ then
		replicatesignal(Humanoid.ServerBreakJoints)
	elseif respawnmode == "Kill" and typeof_ then
		replicatesignal(LocalPlayer.Kill)
    else
        character:BreakJoints()
	end
end

if respawncharacter then
	LoadUi(game:GetService("Players").RespawnTime)
	type 'shi'
	--[[if instantrespawn then // Roblox patched it, CurrentAngle is next
		if replicatesignal then
			replicatesignal(signaldiedbackend)
			twait(game:GetService("Players").RespawnTime - 0.05)
			respawn(originalChar)
			LocalPlayer.CharacterAdded:Wait()
			fakeChar.Parent = workspace
			currentfakechar = fakeChar
		end
	else]]
		respawn(originalChar)
		LocalPlayer.CharacterAdded:Wait()
		fakeChar.Parent = workspace
		currentfakechar = fakeChar
else
	fakeChar.Parent = workspace
	currentfakechar = fakeChar
end

twait(zeropointone)

local newChar = LocalPlayer.Character
newChar.Archivable = true

if disablescripts then
	tspawn(function()
		for _, obj in ipairs(fakeChar:GetChildren()) do
			if obj:IsA("LocalScript") then
				obj.Enabled = false
			end
		end
	end)
end

twait(0.4)

do
-- Warning: This system made by stevetherealone/uhhhhhh reanimate
local Players = game.Players
local Player = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local GuiService = game:GetService("GuiService")
local GameCamera = workspace.CurrentCamera
local GameSettings = UserSettings():GetService("UserGameSettings")
local SCREENGUI = Instance.new("ScreenGui")
SCREENGUI.Parent = Player:WaitForChild("PlayerGui")
local FallenPartsDestroyHeight = workspace.FallenPartsDestroyHeight or -500
local Reanimate = {
	Camera = nil,
	Control = nil,
	Character = nil,
	CharacterLTMs = {},
	CharacterScale = 1,
	Shiftlocked = false,
	ShiftlockEnabled = true,
	Noclip = false,
	SmoothCam = true,
	InfiniteJump = false,
	ScaleGravity = true,
	SeatSit = true,
	ToolGrab = true
}
local Camera = {
    CFrame = CFrame.identity,
    Focus = CFrame.identity,
    Scriptable = false,
    Zoom = 16,
    FieldOfView = 70,
    Input = Vector3.zero,
    _Zoom = 16,

    OnReset = function(self)
        self.Zoom = (self.Focus.Position - self.CFrame.Position).Magnitude
        self._Zoom = self.Zoom
        self.Scriptable = false
        self.FieldOfView = 70
        self.Inputs:Reset()
    end,

    OnPanInput = function(self, vec, accum)
        if accum then
            self.Input += Vector3.new(vec.X, vec.Y, 0)
        else
            self.Input = Vector3.new(vec.X, vec.Y, self.Input.Z)
        end
    end,

    OnZoomInput = function(self, zoom)
        self.Input += Vector3.new(0, 0, zoom)
    end,

    Inputs = {
        KB = {
            Left = false,
            Right = false,
        },
        MS = {
            RMB = false,
        },
        TC = {
            DJ = nil,
            Touch = {},
            LP = nil,
        },
        Reset = function(self)
            self.KB.Left = false
            self.KB.Right = false
            self.MS.RMB = false
            self.TC.DJ = nil
            table.clear(self.TC.Touch)
            self.TC.LP = nil
        end,
    },

    LocalTransparencyModifier = 0,

    Control = {
        Move = Vector3.zero,
        Jump = false,
        Inputs = {
            KB = {
                Up = false,
                Down = false,
                Left = false,
                Right = false,
                Space = false,
            },
            TC = {
                DJ = nil,
                LP = nil,
                JB = nil,
            },
            Reset = function(self)
                self.KB.Up = false
                self.KB.Down = false
                self.KB.Left = false
                self.KB.Right = false
                self.KB.Space = false
                self.TC.DJ = nil
                self.TC.LP = nil
                self.TC.JB = nil
            end,
        }
    }
}

local AntiflingHumanoids = {}
	local AntiflingBaseParts = {}
	
	RunService.PreAnimation:Connect(function()
		for i,v in AntiflingBaseParts do
			if v:IsDescendantOf(workspace) then
				v.CanCollide = false
				v.AssemblyLinearVelocity, v.AssemblyAngularVelocity = Vector3.zero, Vector3.zero
			else
				table.remove(AntiflingBaseParts, i)
			end
		end
		for i,v in AntiflingHumanoids do
			if v:IsDescendantOf(workspace) then
				v.EvaluateStateMachine = false
			else
				table.remove(AntiflingHumanoids, i)
			end
		end
	end)
	local OnBasePart = function(v)
		if v:IsA("BasePart") then
			v.CanCollide = false
			if not table.find(AntiflingBaseParts, v) then
				table.insert(AntiflingBaseParts, v)
			end
		end
		if v:IsA("Humanoid") then
			v.EvaluateStateMachine = false
			if not table.find(AntiflingHumanoids, v) then
				table.insert(AntiflingHumanoids, v)
			end
		end
	end
	local OnCharacter = function(character)
		character.DescendantAdded:Connect(OnBasePart)
		for _,v in character:GetDescendants() do
			OnBasePart(v)
		end
	end
	local OnPlayer = function(player)
		if player == Player then return end
		player.CharacterAdded:Connect(OnCharacter)
		if player.Character then OnCharacter(player.Character) end
	end
	Players.PlayerAdded:Connect(OnPlayer)
	for _,player in Players:GetPlayers() do
		OnPlayer(player)
	end

Reanimate.Camera = Camera
Reanimate.Control = Camera.Control
local function AddToRenderStep(func)
	RunService:BindToRenderStep("CustomRender_"..tostring(math.random()), Enum.RenderPriority.Last.Value, func)
end
local Util = {}

function Util.GetScreenSize()
	return workspace.CurrentCamera.ViewportSize
end

function Util.LinkDestroyI2C(obj, conn)
	obj.Destroying:Connect(function()
		conn:Disconnect()
	end)
end
function Reanimate.Camera:IsFirstPerson()
	return self._Zoom <= 0.75
end
Reanimate.Camera.IsMouseLocked = function(self)
	return self:IsFirstPerson() or Reanimate.Shiftlocked
end
Reanimate.Camera.IsMousePanning = function(self)
	return self:IsMouseLocked() or self.Inputs.MS.RMB
end
do
	local function IsInThumbstickArea(pos)
		local playerGui = Player:FindFirstChildOfClass("PlayerGui")
		local touchGui = playerGui and playerGui:FindFirstChild("TouchGui")
		if not touchGui.Enabled then
			return false
		end
		local touchFrame = touchGui and touchGui:FindFirstChild("TouchControlFrame")
		local thumbstickFrame = touchFrame and (touchFrame:FindFirstChild("DynamicThumbstickFrame") or touchFrame:FindFirstChild("ThumbstickFrame"))
		if not thumbstickFrame then
			return false
		end
		local posTopLeft = thumbstickFrame.AbsolutePosition
		local posBottomRight = posTopLeft + thumbstickFrame.AbsoluteSize
		return pos.X >= posTopLeft.X and pos.Y >= posTopLeft.Y and pos.X <= posBottomRight.X and pos.Y <= posBottomRight.Y
	end
	local function IsInJumpButtonArea(pos)
		local playerGui = Player:FindFirstChildOfClass("PlayerGui")
		local touchGui = playerGui and playerGui:FindFirstChild("TouchGui")
		if not touchGui.Enabled then
			return false
		end
		local touchFrame = touchGui and touchGui:FindFirstChild("TouchControlFrame")
		local jumpButton = touchFrame and touchFrame:FindFirstChild("JumpButton")
		if not jumpButton then
			return false
		end
		local posTopLeft = jumpButton.AbsolutePosition
		local posBottomRight = posTopLeft + jumpButton.AbsoluteSize
		return pos.X >= posTopLeft.X and pos.Y >= posTopLeft.Y and pos.X <= posBottomRight.X and pos.Y <= posBottomRight.Y
	end
	do
		local self = Reanimate.Control
		UserInputService.InputBegan:Connect(function(input, gpe)
			if GuiService.MenuIsOpen then return end
			if UserInputService:GetFocusedTextBox() then return end
			if input.UserInputType == Enum.UserInputType.Keyboard then
				if input.KeyCode == Enum.KeyCode.W then
					self.Inputs.KB.Up = true
				end
				if input.KeyCode == Enum.KeyCode.S then
					self.Inputs.KB.Down = true
				end
				if input.KeyCode == Enum.KeyCode.Up then
					self.Inputs.KB.Up = true
				end
				if input.KeyCode == Enum.KeyCode.Down then
					self.Inputs.KB.Down = true
				end
				if input.KeyCode == Enum.KeyCode.A then
					self.Inputs.KB.Left = true
				end
				if input.KeyCode == Enum.KeyCode.D then
					self.Inputs.KB.Right = true
				end
				if input.KeyCode == Enum.KeyCode.Space then
					self.Inputs.KB.Space = true
				end
			end
			if input.UserInputType == Enum.UserInputType.Touch then
				if self.Inputs.TC.DJ == nil and IsInThumbstickArea(input.Position) then
					self.Inputs.TC.DJ = input
					self.Inputs.TC.LP = input.Position
					return
				end
				if self.Inputs.TC.JB == nil and IsInJumpButtonArea(input.Position) then
					self.Inputs.TC.JB = input
					return
				end
			end
		end)
		UserInputService.InputEnded:Connect(function(input)
			if GuiService.MenuIsOpen then return end
			if UserInputService:GetFocusedTextBox() then return end
			if input.UserInputType == Enum.UserInputType.Keyboard then
				if input.KeyCode == Enum.KeyCode.W then
					self.Inputs.KB.Up = false
				end
				if input.KeyCode == Enum.KeyCode.S then
					self.Inputs.KB.Down = false
				end
				if input.KeyCode == Enum.KeyCode.Up then
					self.Inputs.KB.Up = false
				end
				if input.KeyCode == Enum.KeyCode.Down then
					self.Inputs.KB.Down = false
				end
				if input.KeyCode == Enum.KeyCode.A then
					self.Inputs.KB.Left = false
				end
				if input.KeyCode == Enum.KeyCode.D then
					self.Inputs.KB.Right = false
				end
				if input.KeyCode == Enum.KeyCode.Space then
					self.Inputs.KB.Space = false
				end
			end
			if input.UserInputType == Enum.UserInputType.Touch then
				if self.Inputs.TC.DJ == input then
					self.Inputs.TC.DJ = nil
					self.Inputs.TC.LP = nil
				elseif self.Inputs.TC.JB == input then
					self.Inputs.TC.JB = nil
				end
			end
		end)
		local function resetInputDevices()
			self.Inputs:Reset()
		end
		UserInputService.WindowFocused:Connect(resetInputDevices)
		UserInputService.WindowFocusReleased:Connect(resetInputDevices)
		UserInputService.TextBoxFocusReleased:Connect(resetInputDevices)
		GuiService.MenuOpened:Connect(resetInputDevices)
		RunService:BindToRenderStep("Uhhhhhh_Control", Enum.RenderPriority.Input.Value + 1, function(dt)
		if UserInputService:GetFocusedTextBox() then
	    self.Inputs:Reset()
	    self.Move = Vector3.zero
	    self.Jump = false
	    return
        end
			local screensize = Util.GetScreenSize()
			self.Move = Vector3.zero
			if self.Inputs.KB.Up then
				self.Move += Vector3.new(0, 0, -1)
			end
			if self.Inputs.KB.Down then
				self.Move += Vector3.new(0, 0, 1)
			end
			if self.Inputs.KB.Left then
				self.Move += Vector3.new(-1, 0, 0)
			end
			if self.Inputs.KB.Right then
				self.Move += Vector3.new(1, 0, 0)
			end
			if self.Inputs.TC.DJ and self.Inputs.TC.LP then
				local stickrad = 40
				if math.min(screensize.X, screensize.Y) < 500 then
					stickrad = 20
				end
				local dir = (self.Inputs.TC.DJ.Position - self.Inputs.TC.LP) / stickrad
				if dir.Magnitude > 0.05 then
					dir = dir.Unit * math.min(1, (dir.Magnitude - 0.05) / (1 - 0.05))
					self.Move = Vector3.new(dir.X, 0, dir.Y)
				end
			end
			if self.Move.Magnitude > 1 then self.Move = self.Move.Unit end
			self.Jump = false
			if self.Inputs.KB.Space then
				self.Jump = true
			end
			if self.Inputs.TC.JB then
				self.Jump = true
			end
		end)
	end
	do -- Camera
		local self = Reanimate.Camera
		local function AdjustTouchPitchSensitivity(delta)
			local pitch = Camera.CFrame:ToEulerAnglesYXZ()
			if delta.Y * pitch >= 0 then
				return delta
			end
			local curveY = 1 - (2 * math.abs(pitch) / math.pi) ^ 0.75
			local sensitivity = curveY * 0.75 + 0.25
			return Vector2.new(1, sensitivity) * delta
		end
		UserInputService.InputBegan:Connect(function(input, gpe)
			if GuiService.MenuIsOpen then return end
			if UserInputService:GetFocusedTextBox() then return end
			if input.UserInputType == Enum.UserInputType.Keyboard then
				if input.KeyCode == Enum.KeyCode.LeftShift or input.KeyCode == Enum.KeyCode.RightShift then
					Reanimate.Shiftlocked = Reanimate.ShiftlockEnabled and not Reanimate.Shiftlocked
				end
				if input.KeyCode == Enum.KeyCode.Left then
					self.Inputs.KB.Left = true
				end
				if input.KeyCode == Enum.KeyCode.Right then
					self.Inputs.KB.Right = true
				end
			end
			if input.UserInputType == Enum.UserInputType.MouseButton2 then
				if gpe then return end
				self.Inputs.MS.RMB = true
			end
			if input.UserInputType == Enum.UserInputType.Touch then
				if gpe then return end
				if self.Inputs.TC.DJ == nil and IsInThumbstickArea(input.Position) then
					self.Inputs.TC.DJ = input
					return
				end
				self.Inputs.TC.Touch[input] = true
			end
		end)
		UserInputService.InputChanged:Connect(function(input, gpe)
			if GuiService.MenuIsOpen then return end
			if input.UserInputType == Enum.UserInputType.MouseMovement then
				if self:IsMousePanning() then
					self:OnPanInput(Vector2.new(input.Delta.X, input.Delta.Y) * Vector2.new(1, 0.77) * math.rad(0.5), false)
				end
			end
			if input.UserInputType == Enum.UserInputType.MouseWheel then
				if gpe and not self:IsMousePanning() then return end
				local zoom = math.clamp(-input.Position.Z, -1, 1)
				self:OnZoomInput(zoom)
			end
			if input.UserInputType == Enum.UserInputType.Touch then
				if self.Inputs.TC.DJ == input then
					return
				end
				local touches = {}
				for touch,exist in self.Inputs.TC.Touch do
					if exist then table.insert(touches, touch) end
				end
				if #touches == 1 then
					if touches[1] == input then
						self:OnPanInput(Vector2.new(input.Delta.X, input.Delta.Y) * Vector2.new(1, 0.66) * math.rad(1), true)
					end
				end
				if #touches == 2 then
					local pinch = (touches[1].Position - touches[2].Position).Magnitude
					if self.Inputs.TC.LP then
						local zoom = (self.Inputs.TC.LP - pinch) * 0.04
						self:OnZoomInput(zoom)
					end
					self.Inputs.TC.LP = pinch
				else
					self.Inputs.TC.LP = nil
				end
			end
		end)
		UserInputService.InputEnded:Connect(function(input)
			if GuiService.MenuIsOpen then return end
			if UserInputService:GetFocusedTextBox() then return end
			if input.UserInputType == Enum.UserInputType.Keyboard then
				if input.KeyCode == Enum.KeyCode.Left then
					self.Inputs.KB.Left = false
				end
				if input.KeyCode == Enum.KeyCode.Right then
					self.Inputs.KB.Right = false
				end
			end
			if input.UserInputType == Enum.UserInputType.MouseButton2 then
				self.Inputs.MS.RMB = false
			end
			if input.UserInputType == Enum.UserInputType.Touch then
				if self.Inputs.TC.DJ == input then
					self.Inputs.TC.DJ = nil
					return
				end
				self.Inputs.TC.LP = nil
				self.Inputs.TC.Touch[input] = false
			end
		end)
		UserInputService.PointerAction:Connect(function(wheel, pan, pinch, gpe)
			if not gpe then
				self:OnPanInput(pan * Vector2.new(1, 0.77) * math.rad(7), false)
				self:OnZoomInput(-wheel - pinch)
			end
		end)
		local function resetInputDevices()
			self.Inputs:Reset()
		end
		UserInputService.WindowFocused:Connect(resetInputDevices)
		UserInputService.WindowFocusReleased:Connect(resetInputDevices)
		UserInputService.TextBoxFocusReleased:Connect(resetInputDevices)
		GuiService.MenuOpened:Connect(resetInputDevices)
		local states = {
			[false] = "rbxasset://textures/ui/mouseLock_off@2x.png",
			[true] = "rbxasset://textures/ui/mouseLock_on@2x.png"
		}
		local MobileShiftlock = Instance.new("ImageButton")
		MobileShiftlock.Parent = SCREENGUI
		MobileShiftlock.BackgroundTransparency = 1
		MobileShiftlock.Position = UDim2.new(1, -190, 1, -60)
		MobileShiftlock.Size = UDim2.new(0, 40, 0, 40)
		MobileShiftlock.Image = states[false]
		local state = false
		AddToRenderStep(function()
			if state ~= Reanimate.Shiftlocked then
				state = Reanimate.Shiftlocked
				MobileShiftlock.Image = states[state]
			end
			MobileShiftlock.Visible = not not (Reanimate.Character and UserInputService.TouchEnabled)
		end)
		MobileShiftlock.Activated:Connect(function()
			Reanimate.Shiftlocked = Reanimate.ShiftlockEnabled and not Reanimate.Shiftlocked
		end)
		RunService:BindToRenderStep("Uhhhhhh_Camera", Enum.RenderPriority.Camera.Value + 1, function(dt)
		self.Zoom = self.Zoom or 16
        self._Zoom = self._Zoom or self.Zoom
        
			if self.Inputs.KB.Left then
				self:OnPanInput(Vector2.new(math.rad(-120) * dt, 0), true)
			end
			if self.Inputs.KB.Right then
				self:OnPanInput(Vector2.new(math.rad(120) * dt, 0), true)
			end
			local ltm = Reanimate.LocalTransparencyModifier or 0
local tltm = 0
local sltm = (dt or 0) * 3
			if not self.Scriptable then
				if self:IsFirstPerson() then
					tltm = 1
				elseif self.Zoom < 1.5 * Reanimate.CharacterScale then
					tltm = 0.5
				end
			end
			if math.abs(ltm - tltm) <= sltm then
				ltm = tltm
			elseif ltm < tltm then
				ltm += sltm
			else
				ltm -= sltm
			end
			Reanimate.LocalTransparencyModifier = ltm
			if not Reanimate.ShiftlockEnabled and Reanimate.Shiftlocked then
				Reanimate.Shiftlocked = false
			end
			if Reanimate.Character then
				local targetMouseBehavior = Enum.MouseBehavior.Default
				if self:IsMousePanning() then
					if self:IsMouseLocked() then
						if UserInputService.TouchEnabled then
							targetMouseBehavior = Enum.MouseBehavior.LockCurrentPosition
						else
							targetMouseBehavior = Enum.MouseBehavior.LockCenter
						end
					else
						targetMouseBehavior = Enum.MouseBehavior.LockCurrentPosition
					end
				end
				if UserInputService.MouseBehavior ~= targetMouseBehavior then
					UserInputService.MouseBehavior = targetMouseBehavior
				end
				local targetMouseIcon = ""
				if Reanimate.Shiftlocked then
					targetMouseIcon = "rbxasset://textures/Cursors/CrossMouseIcon.png"
				end
				if UserInputService.MouseIcon ~= targetMouseIcon then
					UserInputService.MouseIcon = targetMouseIcon
				end
				if GameSettings.RotationType ~= Enum.RotationType.MovementRelative then
					GameSettings.RotationType = Enum.RotationType.MovementRelative
				end
				local Humanoid = Reanimate.Character:FindFirstChildOfClass("Humanoid")
				local RootPart = Reanimate.Character:FindFirstChild("HumanoidRootPart")
				if Humanoid and RootPart and GameCamera.CameraSubject == Humanoid then
					if self.Scriptable then
						Camera.FieldOfView = self.FieldOfView
						Camera.FieldOfViewMode = "Vertical"
					else
						Camera.FieldOfView = 70
						Camera.FieldOfViewMode = "Vertical"
						local newCameraCFrame, newCameraFocus = self.CFrame, self.Focus
						local subjectPosition = RootPart.Position + RootPart.CFrame.UpVector * 1.5
						subjectPosition += RootPart.CFrame.Rotation * Humanoid.CameraOffset
						local input = self.Input * Vector3.new(1, GameSettings:GetCameraYInvertValue(), 1)
						self.Input = Vector3.zero
						local zoomDelta = input.Z
						if math.abs(zoomDelta) > 0 then
							if zoomDelta > 0 then
								self.Zoom += zoomDelta * (1 + self.Zoom * 0.5)
							else
								self.Zoom = (self.Zoom + zoomDelta) / (1 - zoomDelta * 0.5)
							end
						end
						if self.Zoom < 0.5 then
							self.Zoom = 0.5
						end
						self._Zoom = self.Zoom + (self._Zoom - self.Zoom) * math.exp(-32 * dt)
						local currLookVector = newCameraCFrame.LookVector
						local currPitchAngle = math.asin(currLookVector.Y)
						local constrainedRotateInput = Vector2.new(input.X, math.clamp(input.Y, math.rad(-80) + currPitchAngle, math.rad(80) + currPitchAngle))
						local startCFrame = CFrame.lookAt(Vector3.zero, currLookVector)
						local newLookCFrame = CFrame.Angles(0, -constrainedRotateInput.X, 0) * startCFrame * CFrame.Angles(-constrainedRotateInput.Y, 0, 0)
						local newLookVector = newLookCFrame.LookVector
						if self:IsMouseLocked() and not self:IsFirstPerson() then
							local cameraRelativeOffset = newLookCFrame * Vector3.new(1.7, 0, 0)
							if cameraRelativeOffset == cameraRelativeOffset then
								subjectPosition += cameraRelativeOffset
							end
						end
						newCameraFocus = CFrame.new(subjectPosition)
						local cameraFocusP = newCameraFocus.Position
						newCameraCFrame = CFrame.lookAt(cameraFocusP - newLookVector * self._Zoom, cameraFocusP)
						self.CFrame, self.Focus = newCameraCFrame, newCameraFocus
					end
					GameCamera.CFrame = self.CFrame
GameCamera.Focus = self.Focus
				end
				for _,v in Reanimate.CharacterLTMs do
					v.LocalTransparencyModifier = ltm
				end
			end
			pcall(function() CoreGui.TopBarApp.TopBarApp.FullScreenFrame.HurtOverlay.Visible = false end)
		end)
	end
end
Reanimate.CreateCharacter = function(InitCFrame)
	local RC = Reanimate.Character
	local cf = CFrame.new(Camera.Focus.Position)
	if RC then
		local r = RC:FindFirstChild("HumanoidRootPart")
		if r then
			cf = r.CFrame
		end
		RC:Destroy()
	elseif Player.Character then
		local r = Player.Character:FindFirstChild("HumanoidRootPart")
		if r then
			cf = r.CFrame
		end
	end
	if InitCFrame then
		cf = InitCFrame
	end
	Reanimate.Camera.CFrame, Reanimate.Camera.Focus = Camera.CFrame, Camera.Focus
	Reanimate.Camera:OnReset()
	RC = fakeChar
	local ltmparts = Reanimate.CharacterLTMs
	table.clear(ltmparts)
	local function OnDescendant(v)
		local exist = pcall(function()
			return v.LocalTransparencyModifier
		end)
		if exist then
			table.insert(ltmparts, v)
			local conn = nil
			conn = v.AncestryChanged:Connect(function()
				if not v:IsDescendantOf(RC) then
					local i = table.find(ltmparts, v)
					if i then
						table.remove(ltmparts, i)
					end
					conn:Disconnect()
				end
			end)
		end
	end
	RC.DescendantAdded:Connect(OnDescendant)
	for _,v in RC:GetDescendants() do
		task.spawn(OnDescendant, v)
	end
	RC:ScaleTo(Reanimate.CharacterScale)
	local RCHumanoid, RCRootPart = RC.Humanoid, RC.HumanoidRootPart
	local RCHead = RC.Head
	--[[local Anchor = Instance.new("Part", RCRootPart)
	Anchor.Name = "i can take explosions >:3"
	Anchor.Transparency = 1
	Anchor.Anchored = false
	Anchor.CanCollide = false
	Anchor.CanQuery = false
	Anchor.CanTouch = false
	Anchor.CustomPhysicalProperties = PhysicalProperties.new(100, 0, 0, 0, 0)
	Anchor.Size = Vector3.new(2048, 2048, 2048)
	local AnchorWeld = Instance.new("Weld")]]
	RC.Parent = workspace
	Reanimate.Character = RC
	RCRootPart.CFrame = cf
	local SeatWeld = nil
	local LastJumpOffSeat = 0
	RCHumanoid.Touched:Connect(function(part, limb)
		if Reanimate.SeatSit and part:IsA("Seat") and not RCHumanoid.Sit and os.clock() - LastJumpOffSeat > 2 then
			RCHumanoid.Sit = true
			if SeatWeld ~= nil then
				SeatWeld = SeatWeld:Destroy()
			end
			SeatWeld = Instance.new("Weld")
			SeatWeld.Name = "hell yeah!! :3"
			SeatWeld.Parent = RCRootPart
			SeatWeld.Part0 = part
			SeatWeld.Part1 = RCRootPart
			SeatWeld.C0 = CFrame.new(0, part.Size.Y / 2, 0)
			SeatWeld.C1 = CFrame.new(0, -1.5 * RC:GetScale(), 0)
			Util.LinkDestroyI2C(SeatWeld, RCHumanoid:GetPropertyChangedSignal("Jump"):Connect(function()
				if RCHumanoid.Jump then
					RCHumanoid.Sit = false
					SeatWeld:Destroy()
				end
			end))
		end
		if part.Name == "Handle" and part.Parent:IsA("Tool") and not part.Parent.Parent:FindFirstChildOfClass("Humanoid") then
			if Reanimate.ToolGrab then
				if Player.Character then
					local Humanoid = Player.Character:FindFirstChildOfClass("Humanoid")
					if Humanoid then
						Humanoid:EquipTool(part.Parent)
					end
				end
			end
		end
	end)
	RCHumanoid.Seated:Connect(function(active)
		if not active then
			if SeatWeld ~= nil then
				SeatWeld = SeatWeld:Destroy()
			end
			LastJumpOffSeat = os.clock()
		end
	end)
	local LastJump = false
	local RCP = RaycastParams.new()
	RCP.RespectCanCollide = true
	RCP.FilterType = Enum.RaycastFilterType.Exclude
	RCP.FilterDescendantsInstances = {RC}
	local noclipStates = {"Running", "Jumping", "Freefall", "Landed", "Climbing", "Swimming"}
	local fallingStates = {"Jumping", "Freefall", "PlatformStanding", "Physics", "Ragdoll", "GettingUp", "Seated", "Flying", "FallingDown"}
	local LastSafest = RCRootPart.CFrame
	Util.LinkDestroyI2C(RC, RunService.PreAnimation:Connect(function(dt)
		local CMove, CJump = Reanimate.Control.Move, Reanimate.Control.Jump
		local camCF = workspace.CurrentCamera.CFrame

local forward = camCF.LookVector
local right = camCF.RightVector

forward = Vector3.new(forward.X, 0, forward.Z)
right = Vector3.new(right.X, 0, right.Z)

if forward.Magnitude > 0 then forward = forward.Unit end
if right.Magnitude > 0 then right = right.Unit end

local moveDir = (right * CMove.X) + (forward * -CMove.Z)

if moveDir.Magnitude > 0 then
    moveDir = moveDir.Unit
end
		pcall(sethiddenproperty, RCRootPart, "PhysicsRepRootPart", nil)
		local RCHumanoidState = RCHumanoid:GetState().Name
		local clip = not table.find(noclipStates, RCHumanoidState)
		local gravaff = not not table.find(fallingStates, RCHumanoidState)
		for _,v in RC:GetChildren() do
			if v:IsA("BasePart") then
				v.CanCollide = clip or (not Reanimate.Noclip and v == RCRootPart)
			end
		end
		if gravaff then
			if Reanimate.ScaleGravity and not RCRootPart:IsGrounded() then
				RCRootPart.AssemblyLinearVelocity += Vector3.new(0, -workspace.Gravity * (Reanimate.CharacterScale - 1) * 0.25 * dt, 0)
			end
		end
		if LastJump ~= CJump then
			if CJump then
				if Reanimate.InfiniteJump and RCHumanoid:GetState() == Enum.HumanoidStateType.Freefall then
					RCRootPart.Velocity = Vector3.new(
						RCRootPart.Velocity.X, math.max(50, RCHumanoid.JumpPower), RCRootPart.Velocity.Z
					)
				end
			end
		end
		LastJump = CJump
		local TargetCameraOffset = (RCRootPart.CFrame * CFrame.new(0, 1.5, 0)):PointToObjectSpace(RCHead.Position)
		if not Reanimate.SmoothCam then
			TargetCameraOffset = Vector3.new(0, -1.5, 0) + Vector3.new(0, 1.5, 0) * RC:GetScale()
		end
		RCHumanoid.CameraOffset = TargetCameraOffset:Lerp(RCHumanoid.CameraOffset, math.exp(-9.8 * dt))
local isFirstPerson = Reanimate.Camera:IsFirstPerson()

if isFirstPerson then
    RCHumanoid.AutoRotate = false

    local camLook = workspace.CurrentCamera.CFrame.LookVector
    local flatLook = Vector3.new(camLook.X, 0, camLook.Z)

    if flatLook.Magnitude > 0 then
        flatLook = flatLook.Unit

        RCRootPart.CFrame = CFrame.new(
            RCRootPart.Position,
            RCRootPart.Position + flatLook
        )
    end

elseif Reanimate.Shiftlocked then
    RCHumanoid.AutoRotate = false

    local camLook = workspace.CurrentCamera.CFrame.LookVector
    local flatLook = Vector3.new(camLook.X, 0, camLook.Z)

    if flatLook.Magnitude > 0 then
        flatLook = flatLook.Unit

        RCRootPart.CFrame = CFrame.new(
            RCRootPart.Position,
            RCRootPart.Position + flatLook
        )
    end

else
    RCHumanoid.AutoRotate = true
end

RCHumanoid:Move(moveDir)
		RCHumanoid.Jump = CJump
		if RCRootPart.Position.Y < FallenPartsDestroyHeight + 3 * Reanimate.CharacterScale then
			RCRootPart.CFrame = LastSafest
			RCRootPart.Velocity = Vector3.new(0, 50, 0)
			RCRootPart.RotVelocity = Vector3.zero
		end
		local safe = true
		for i=1, 8 do
			local off = CFrame.Angles(0, (i / 4) * math.pi, 0):VectorToWorldSpace(Vector3.new(0, 0, -0.5))
			if not workspace:Raycast(RCRootPart.Position + off, Vector3.new(0, -(3 * Reanimate.CharacterScale + 8 + RCHumanoid.HipHeight), 0), RCP) then
				safe = false
			end
		end
		if safe then
			LastSafest = RCRootPart.CFrame
		end
	end))
	end

Reanimate.CreateCharacter()
GameCamera.CameraSubject = Reanimate.Character:WaitForChild("Humanoid")
GameCamera.CameraType = Enum.CameraType.Scriptable
Reanimate.Camera.Zoom = 12
Reanimate.Camera._Zoom = 12
RunService.RenderStepped:Connect(function()
    if Reanimate.Character and GameCamera.CameraSubject ~= Reanimate.Character:FindFirstChild("Humanoid") then
        GameCamera.CameraSubject = Reanimate.Character:FindFirstChild("Humanoid")
    end
end)
end
if parentrealchartofakechar then
	newChar.Parent = fakeChar
end

local newcharTorso
local newcharLowerTorso
if mode == R15 then
	newcharTorso = newChar:WaitForChild("UpperTorso")
	newcharLowerTorso = newChar:WaitForChild("LowerTorso")
else
	newcharTorso = newChar:WaitForChild("Torso")
end
local fakecharTorso
if r15rig then
	fakecharTorso = fakeChar:WaitForChild("UpperTorso")
else
	fakecharTorso = fakeChar:WaitForChild("Torso")
end
local newcharRoot = newChar:WaitForChild("HumanoidRootPart")
local fakecharRoot = fakeChar:WaitForChild("HumanoidRootPart")

local limbmapping

if not r15rig then
	limbmapping = {
		Neck = fakeChar:WaitForChild("Head"),
		RootJoint = fakeChar:WaitForChild("Torso"),
		["Left Shoulder"] = fakeChar:WaitForChild("Left Arm"),
		["Right Shoulder"] = fakeChar:WaitForChild("Right Arm"),
		["Left Hip"] = fakeChar:WaitForChild("Left Leg"),
		["Right Hip"] = fakeChar:WaitForChild("Right Leg")
	}
else
	limbmapping = {
		Neck = fakeChar:WaitForChild("Head"),
		RootJoint = fakeChar:WaitForChild("UpperTorso"),
		["Left Shoulder"] = fakeChar:WaitForChild("LeftLowerArm"),
		["Right Shoulder"] = fakeChar:WaitForChild("RightLowerArm"),
		["Left Hip"] = fakeChar:WaitForChild("LeftLowerLeg"),
		["Right Hip"] = fakeChar:WaitForChild("RightLowerLeg")
	}
end 

local jointmapping

if mode == R15 then
	jointmapping = {
		Neck = newChar:WaitForChild("Head"):WaitForChild("Neck"),
		RootJoint = newChar:WaitForChild("LowerTorso"):WaitForChild("Root"),
		["Left Shoulder"] = newChar:WaitForChild("LeftUpperArm"):WaitForChild("LeftShoulder"),
		["Right Shoulder"] = newChar:WaitForChild("RightUpperArm"):WaitForChild("RightShoulder"),
		["Left Hip"] = newChar:WaitForChild("LeftUpperLeg"):WaitForChild("LeftHip"),
		["Right Hip"] = newChar:WaitForChild("RightUpperLeg"):WaitForChild("RightHip")
	}
else
	jointmapping = {
		Neck = newcharTorso:WaitForChild("Neck"),
		RootJoint = newChar.HumanoidRootPart:FindFirstChild("RootJoint"),
		["Left Shoulder"] = newcharTorso:WaitForChild("Left Shoulder"),
		["Right Shoulder"] = newcharTorso:WaitForChild("Right Shoulder"),
		["Left Hip"] = newcharTorso:WaitForChild("Left Hip"),
		["Right Hip"] = newcharTorso:WaitForChild("Right Hip")
	}
end


local Inverse = emptyCFrame.Inverse
local ToAxisAngle = emptyCFrame.ToAxisAngle
local ToObjectSpace = emptyCFrame.ToObjectSpace
local ToEulerAnglesXYZ = emptyCFrame.ToEulerAnglesXYZ

local function RCA6dToCFrame(Motor6D, TargetPartCF, ReferencePartCF)
	local rel = CFrameMul(Inverse(ReferencePartCF), TargetPartCF)
	local delta = CFrameMul(CFrameMul(Inverse(gameIndex(Motor6D, "C0")), rel), gameIndex(Motor6D, "C1"))
	local axis, angle = ToAxisAngle(delta)
	local newangle = Vector3Mul(axis, angle)
	sethiddenproperty(Motor6D, 'ReplicateCurrentOffset6D', CFrameIndex(delta, "Position"))
	sethiddenproperty(Motor6D, 'ReplicateCurrentAngle6D', newangle)
end

local RightArmOffset = CFrame.new(0, 0.4, 0)
local LeftArmOffset = CFrame.new(0, 0.2, 0)
local LegsOffset = CFrame.new(0, 0.6, 0)
local RootOffset = CFrame.new(0, -0.8, 0)

local task_spawn = task.spawn
local function stepReanimate()
	--[[task_spawn(function()]]
	if flinging then return end

	if hiderootpart then
		gameNewIndex(newcharRoot, "CFrame", CFrameAdd(poscache, Vector3_new(0, math_random(1, 2) / 100.19, 0)))
	else
		gameNewIndex(newcharRoot, "CFrame", CFrameAdd(gameIndex(fakecharRoot, "CFrame"), Vector3_new(0, math_random(1, 2) / 100.19, 0)))
	end

	--// YES it is unstable. im working on optimizing (later)

	gameNewIndex(newcharRoot, "Velocity", vector3zero)
	gameNewIndex(newcharRoot, "RotVelocity", vector3zero)

	for joint, limb in pairs(limbmapping) do
		local relativecframe = ToObjectSpace(gameIndex(limb, "CFrame"), gameIndex(fakecharTorso, "CFrame"))
		local pitch, yaw, _ = ToEulerAnglesXYZ(relativecframe)

		local angle = 0

		if joint == "Neck" or joint == "RootJoint" then
			angle = -yaw
		elseif joint == "Left Shoulder" or joint == "Left Hip" then
			angle = pitch
		elseif joint == "Right Shoulder" or joint == "Right Hip" then
			angle = -pitch
		end

		if mode == R15 then
			local rootjoint = jointmapping["RootJoint"]
			RCA6dToCFrame(rootjoint, limbmapping["RootJoint"].CFrame * CFrame.new(0, -0.8, 0), fakecharRoot.CFrame)
		else
			local rootjoint = jointmapping["RootJoint"]
			RCA6dToCFrame(rootjoint, limbmapping["RootJoint"].CFrame, newcharRoot.CFrame)
		end

		if joint ~= "RootJoint" then
			gameNewIndex(jointmapping[joint], "DesiredAngle", angle)

			if mode == R15 then
				if joint == "Neck" then
					RCA6dToCFrame(jointmapping[joint], gameIndex(limb, "CFrame"), newcharTorso.CFrame)
				elseif joint == "Right Shoulder" then
					RCA6dToCFrame(jointmapping[joint], gameIndex(limb, "CFrame") * RightArmOffset, newcharTorso.CFrame)
				elseif  joint == "Left Shoulder" then
					RCA6dToCFrame(jointmapping[joint], limb.CFrame * LeftArmOffset, fakecharTorso.CFrame)
				elseif joint == "Left Hip" or joint == "Right Hip" then
					RCA6dToCFrame(jointmapping[joint], gameIndex(limb, "CFrame") * LegsOffset, newcharLowerTorso.CFrame)
				else
					RCA6dToCFrame(jointmapping[joint], gameIndex(limb, "CFrame"), newcharTorso.CFrame)
				end

				local rootjoint = jointmapping["RootJoint"]
				RCA6dToCFrame(rootjoint, limbmapping["RootJoint"].CFrame * CFrame.new(0, -0.8, 0), fakecharRoot.CFrame)
			else
				RCA6dToCFrame(jointmapping[joint], limb.CFrame, newcharTorso.CFrame)

				local rootjoint = jointmapping["RootJoint"]
				RCA6dToCFrame(rootjoint, limbmapping["RootJoint"].CFrame, newcharRoot.CFrame)
			end
		end
	end
	--[[end)]]
end

local function setdestroyheight(height)
	local sucess, result = pcall(function()
		workspace.FallenPartsDestroyHeight = height
	end)
end

local currentheight = workspace.FallenPartsDestroyHeight

local function flinginternal(character, time)
	if character == newChar then return end
	local time = time or 2

	flinging = true
	local start = tick()
	local connection
	connection = game:GetService("RunService").Heartbeat:Connect(function()
		if tick() - start >= time then
			setdestroyheight(currentheight)
			flinging = false
			connection:Disconnect()
			--break
		end
		if character then
			if character:FindFirstChild("HumanoidRootPart") then
				local velocity = character.HumanoidRootPart.Velocity
				if character.HumanoidRootPart.CFrame.Position.Y <= currentheight + 15 then
					newcharRoot.CFrame = CFrame.new(255, 255, 0)
					return
				elseif currentheight == NaN then
					if character.HumanoidRootPart.CFrame.Position.Y <= -500 + 15 then
						newcharRoot.CFrame = CFrame.new(255, 255, 0)
						return
					end
				end
				local direction = velocity.Magnitude > 1 and velocity.Unit or Vector3_new(0, 0, 0)
				local predictedPosition = (character.PrimaryPart.CFrame or character.HumanoidRootPart.CFrame).Position + direction * math_random(5, 12)

				newcharRoot.Velocity = Vector3_new(100, 500000, 100)
				newcharRoot.CFrame = CFrame.new(predictedPosition) - Vector3.new(0, 1, 0)
				--newcharRoot.RotVelocity = Vector3_new(100, 100, 100)
			else
				flinging = false
				connection:Disconnect()
				--break
			end
		else
			flinging = false
			connection:Disconnect()
			--break
		end
	end)

end

fling = function(character, time, yield)
	--setdestroyheight(NaN)
	local yield = yield or false
	if yield then
		flinginternal(character, time)
	else
		tspawn(flinginternal, character, time)
	end
end

getgenv().fling = fling

local function disableCollisions()
	pcall(function()
		for _, char in ipairs({ newChar }) do
			for _, obj in ipairs(GetDescendants(char)) do
				if IsA(obj, "BasePart") then
					obj.CanCollide = false
					obj.Massless = true
				end
			end
		end
	end)
end

local function disableCollisionsWithFakeChar()
	pcall(function()
		for _, char in ipairs({ newChar, fakeChar }) do
			for _, obj in ipairs(GetDescendants(char)) do
				if IsA(obj, "BasePart") then
					obj.CanCollide = false
					obj.Massless = true
				end
			end
		end
	end)
end

local RunService = game:GetService("RunService")

local postSimConnection = RunService.PostSimulation:Connect(stepReanimate)
local disableCollisionConnection;

local humanoidnewchar = newChar:WaitForChild("Humanoid")

humanoidnewchar.PlatformStand = true
humanoidnewchar.AutoRotate = false

if fakecollisions then
	disableCollisionConnection = RunService.PreSimulation:Connect(disableCollisions)
else
	disableCollisionConnection = RunService.PreSimulation:Connect(disableCollisionsWithFakeChar)
end

if not permadeathcharacter then
	fakeChar.Humanoid.Died:Once(function()
		disableCollisionConnection:Disconnect()
		postSimConnection:Disconnect()

		fakeChar:Destroy()
		game:GetService("Players").LocalPlayer.Character = newChar
		newChar:BreakJoints()
	end)
end

workspace.CurrentCamera.CameraSubject = fakeChar:WaitForChild("Humanoid")

if clickfling then
	Mouse.Button1Down:Connect(function()
		--// Fun fact: This click fling was made by MrY7zz (MIT license)
		local target = Mouse.Target
		if not target then return end
		--// Fun fact: This click fling was made by MrY7zz (MIT license)

		local character = target:FindFirstAncestorOfClass("Model")
		if not not not character then return end
		--// Fun fact: This click fling was made by MrY7zz (MIT license)
		--// Fun fact: This click fling was made by MrY7zz (MIT license)

		local plr = game:GetService("Players"):GetPlayerFromCharacter(character)
		if not plr then return end
		if plr == LocalPlayer then return end

		fling(character, 2.3, true)
	end)
end

if displaymode == 1 then
	for _, part in ipairs(fakeChar:GetDescendants()) do
		if part:IsA("BasePart") or part:IsA("Decal") then
			if not nametoexcludefromtransparency[tostring(part)] then
				part.Transparency = transparency_level
			end
		end
	end
elseif displaymode == 2 then
	for _, part in ipairs(newChar:GetDescendants()) do
		if part:IsA("BasePart") or part:IsA("Decal") then
			if not nametoexcludefromtransparency[tostring(part)] then
				part.Transparency = transparency_level
			end
		end
	end
end

finished = true

workspace.CurrentCamera.CameraSubject.Parent.HumanoidRootPart.CFrame = oldpos

if usedefaultanims then
	if r15rig then
		loadstring(game:HttpGet("https://raw.githubusercontent.com/somethingsimade/CurrentAngleV2/refs/heads/main/r15anim"))()
	else
		loadstring(game:HttpGet("https://github.com/AdmBrookhavenScripts/TestCAngle/raw/refs/heads/main/anims.lua"))()
	end
end
