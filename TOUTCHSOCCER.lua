local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Touch Football | WEEXPLOIT.XYZ ", DarkTheme)

local Tab = Window:NewTab("Main")
local Tab2 = Window:NewTab("Defending")

local Section = Tab:NewSection("Auto Goal")
local Section3 = Tab:NewSection("Movement")
local Section4 = Tab2:NewSection("Defending")

Section:NewToggle("Goal A", "Enables auto goal on Goal A", function(state)
    if state then
        _G.kickA = true
        while _G.kickA == true do
            wait()
            if _G.infiniteRange == true then
                local ball = game.Workspace.FootballField:WaitForChild("SoccerBall")
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(ball.CFrame.X + 5, ball.CFrame.Y, ball.CFrame.Z)
            end
            local ball = workspace.FootballField:WaitForChild("SoccerBall")

            local A_1 = game.Players.LocalPlayer.Name
            local A_2 = game.Players.LocalPlayer.UserId
            local A_3 = ""
            local A_4 = Vector3.new(-281.58966064453125, 5.465750694274902, 92.93141174316406)
            local A_5 = Vector3.new(-79.95317077636719, 36, 2.7396087646484375)
            local A_6 = Vector3.new(0, 0, 0)
            local A_7 = 3.6512224674224854
            local A_8 = "98348766567321"
            local Event = game:GetService("ReplicatedStorage").KickBall
            Event:FireServer(A_1, A_2, A_3, A_4, A_5, A_6, A_7, A_8)
        end
    else
        _G.kickA = false
    end
end)

Section:NewToggle("Goal B", "Enables auto goal on Goal B", function(state)
    if state then
        _G.kickB = true
        while _G.kickB == true do
            wait()
            if _G.infiniteRange == true then
                local ball = game.Workspace.FootballField:WaitForChild("SoccerBall")
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(ball.CFrame.X + 5, ball.CFrame.Y, ball.CFrame.Z)
            end
            local ball = workspace.FootballField:WaitForChild("SoccerBall")

            local A_1 = game.Players.LocalPlayer.Name
            local A_2 = game.Players.LocalPlayer.UserId
            local A_3 = ""
            local A_4 = Vector3.new(-154.07484436035156, 5.474004745483398, 102.59715270996094)
            local A_5 = Vector3.new(75.42424011230469, 36, -26.726070404052734)
            local A_6 = Vector3.new(0, 0, 0)
            local A_7 = 3.6512224674224854
            local A_8 = "98348766567321"
            local Event = game:GetService("ReplicatedStorage").KickBall
            Event:FireServer(A_1, A_2, A_3, A_4, A_5, A_6, A_7, A_8)
        end
    else
        _G.kickB = false
    end
end)

Section3:NewToggle("Boost WalkSpeed", "Gives your humanoid a slight boost in WalkSpeed", function(state)
    if state then
        _G.speed = true
        while _G.speed == true do
            wait()
            local A_1 = game.Players.LocalPlayer.Name
            local A_2 = 30
            local Event = game:GetService("ReplicatedStorage").UpdateWalkSpeed
            Event:FireServer(A_1, A_2)
        end
    else
        _G.speed = false
    end
end)

Section:NewToggle("Infinite Range", "Enables infinite range for auto goal", function(state)
    if state then
        _G.infiniteRange = true
    else
        _G.infiniteRange = false
    end
end)

local distance = 5

Section4:NewToggle("Auto Block (Keybind - F)", "Automatically assists in defending", function(state)
    if state then
        enabledMag2 = true
        local UIS = game:GetService('UserInputService')
        local insertKey = 'F'
        UIS.InputBegan:Connect(function(Input, IsTyping)
            if IsTyping then return end
            local KeyPressed = Input.KeyCode
            if KeyPressed == Enum.KeyCode[insertKey] and enabledMag2 == true then

                local ball = workspace.FootballField.SoccerBall -- Replace "Ball" with the actual name of your soccer ball

                local player = game.Players.LocalPlayer
                local character = player.Character or player.CharacterAdded:Wait()

                local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

                local teleportOffset = distance -- Adjust this value to set the distance in front of the ball to teleport the character
                print(teleportOffset)

                local function blockBall()
                    local ballPosition = ball.Position
                    local ballVelocity = ball.Velocity

                    local teleportPosition = ballPosition + ballVelocity.Unit * teleportOffset
                    local lookVector = (ballPosition - teleportPosition).Unit

                    humanoidRootPart.CFrame = CFrame.new(teleportPosition, ballPosition) + Vector3.new(0, humanoidRootPart.Size.Y / 2, 0)
                end

                blockBall()
            end
        end)
    else
        enabledMag2 = false
    end
end)

Section4:NewSlider("Distance", "Changes block distance (how far you'll teleport)", 25, 5, function(v) -- 500 (MaxValue) | 0 (MinValue)
    distance = v
    print(distance)
end)