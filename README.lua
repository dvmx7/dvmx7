local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("MRX Project [Mining Clicker Simulator]", "DarkTheme")

local Tab = Window:NewTab("Main")
local Section = Tab:NewSection("Auto Farm")

Section:NewButton("Auto Clicks", "Faster Clicks than the game", function()
    while true do
        game:GetService("ReplicatedStorage").Remotes.Click:InvokeServer()
        end 
        
end)

Section:NewButton("Auto Rebirth", "Free Auto Rebirth", function()
    while true do
        wait(3)
        game:GetService("ReplicatedStorage").Remotes.Rebirth:FireServer()
    end
end)

Section:NewButton("Auto Upgrades", "It will Auto Upgrade for you", function()
    while true do
        wait(60)
            local args = {
            [1] = "Ore Pay"
        }
        
        game:GetService("ReplicatedStorage").Remotes.upgradePlr:FireServer(unpack(args))
            local args = {
            [1] = "Pet Storage"
        }
        
        game:GetService("ReplicatedStorage").Remotes.upgradePlr:FireServer(unpack(args))
            local args = {
            [1] = "Player Speed"
        }
        
        game:GetService("ReplicatedStorage").Remotes.upgradePlr:FireServer(unpack(args))
            local args = {
            [1] = "Auto Click Speed"
        }
        
        game:GetService("ReplicatedStorage").Remotes.upgradePlr:FireServer(unpack(args))
            local args = {
            [1] = "Pets Equipped"
        }
        
        game:GetService("ReplicatedStorage").Remotes.upgradePlr:FireServer(unpack(args))
            local args = {
            [1] = "Drill Speed"
        }
        
        game:GetService("ReplicatedStorage").Remotes.upgradePlr:FireServer(unpack(args))
            local args = {
            [1] = "Pet Storage2"
        }
        
        game:GetService("ReplicatedStorage").Remotes.upgradePlr:FireServer(unpack(args))
            local args = {
            [1] = "Gem Pay"
        }
        
        game:GetService("ReplicatedStorage").Remotes.upgradePlr:FireServer(unpack(args))
            local args = {
            [1] = "Pet Luck"
        }
        
        game:GetService("ReplicatedStorage").Remotes.upgradePlr:FireServer(unpack(args))
           local args = {
            [1] = "Hatch Speed"
        }
        
        game:GetService("ReplicatedStorage").Remotes.upgradePlr:FireServer(unpack(args))
        
    end
end)

--Misc Tab

local Tab = Window:NewTab("Misc")

local Section = Tab:NewSection("Player")

Section:NewSlider("WalkSpeed", "Change your Character Walk Speed", 250, 0, function(s) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)
Section:NewSlider("Jump Power", "Change your Character Jump Power", 250, 0, function(s) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.JumpHeight = s
end)

Section:NewButton("Infinite Jump", "Makes you jump to Whatever Hight you want (Like Flying)", function()local Player = game:GetService'Players'.LocalPlayer;
    local UIS = game:GetService'UserInputService';
    
    _G.JumpHeight = 50;
    
    function Action(Object, Function) if Object ~= nil then Function(Object); end end
    
    UIS.InputBegan:connect(function(UserInput)
        if UserInput.UserInputType == Enum.UserInputType.Keyboard and UserInput.KeyCode == Enum.KeyCode.Space then
            Action(Player.Character.Humanoid, function(self)
                if self:GetState() == Enum.HumanoidStateType.Jumping or self:GetState() == Enum.HumanoidStateType.Freefall then
                    Action(self.Parent.HumanoidRootPart, function(self)
                        self.Velocity = Vector3.new(0, _G.JumpHeight, 0);
                    end)
                end
            end)
        end
    end)
end)

local Section = Tab:NewSection("Visuals")

Section:NewButton("ESP", "Normal Simple ESP with Outlines", function()

--ESP

local start = tick()

_G.TeamLine = true

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local localplayer = Players.LocalPlayer
local cam = workspace.CurrentCamera

function esp(plr)
	local Lines = Drawing.new("Line")
	Lines.Color = Color3.new(1, 1, 1)
	Lines.Visible = false
	Lines.Thickness = 1
	Lines.Transparency = 1

	local Names = Drawing.new("Text")
	Names.Text = plr.Name
	Names.Color = Color3.new(1, 1, 1)	
	Names.Outline = true
	Names.OutlineColor = Color3.new(0, 0, 0)
	Names.Size = 20
	Names.Visible = false

	RunService.RenderStepped:Connect(function()
		if plr ~= localplayer and plr.Character ~= nil and plr.Character:FindFirstChild("HumanoidRootPart") then
			local headPos = plr.Character:FindFirstChild("Head").Position
			local primaryPos = plr.Character.PrimaryPart.Position

			local nameVector, nameSeen = cam:WorldToViewportPoint(headPos)
			local lineVector, lineSeen = cam:WorldToViewportPoint(primaryPos)

			if lineSeen then
				Lines.From = Vector2.new(cam.ViewportSize.X/2, cam.ViewportSize.Y)
				Lines.To = Vector2.new(lineVector.X, lineVector.Y)
				Names.Position = Vector2.new(nameVector.X-2, nameVector.Y)

				Lines.Visible = true
				Names.Visible = true

				if plr.TeamColor then
					Lines.Color = plr.TeamColor.Color
					Names.Color = plr.TeamColor.Color
				else
					Lines.Color = Color3.new(1, 1, 1)
					Names.Color = Color3.new(1, 1, 1)
				end

				if not _G.TeamLine then
					if plr.TeamColor == localplayer.TeamColor then
						Lines.Visible = false
						Names.Visible = false
					else
						Lines.Visible = true
						Names.Visible = true
					end
				end
			else
				Lines.Visible = false
				Names.Visible = false
			end
		end
	end)
end

for i,v in pairs(Players:GetChildren()) do
	esp(v)
end

Players.PlayerAdded:Connect(function(v)
	v.CharacterAdded:Connect(function()
		esp(v)
	end)
end)

print(("esp inititalized in %s seconds"):format(tick()-start))
end)

local Section = Tab:NewSection("Server")
Section:NewButton("Rejoin", "It will Reconnect you to the server", function()
    local ts = game:GetService("TeleportService")

    local p = game:GetService("Players").LocalPlayer
    
     
    
    ts:Teleport(game.PlaceId, p)
end)


--Islands Tab

local Tab = Window:NewTab("Islands")
--Spawn Island
local Section = Tab:NewSection("1-Spawn Island")

Section:NewButton("1-Buy Birch Pickaxe", "The First Pickaxe To Buy", function()
    local args = {
        [1] = "Birch Pickaxe"
    }
    
    game:GetService("ReplicatedStorage").Remotes.BuyPickaxe:InvokeServer(unpack(args))
end)

Section:NewButton("2-Buy Stone Pickaxe", "You Must Buy The Birch Pickaxe First!", function()
    local args = {
        [1] = "Stone Pickaxe"
    }
    
    game:GetService("ReplicatedStorage").Remotes.BuyPickaxe:InvokeServer(unpack(args))end)

Section:NewButton("3-Buy Bronze Pickaxe", "You Must Buy The Stone Pickaxe First!", function()
    local args = {
        [1] = "Bronze Pickaxe"
    }
    
    game:GetService("ReplicatedStorage").Remotes.BuyPickaxe:InvokeServer(unpack(args))
end)

Section:NewButton("4-Buy Iron Pickaxe (Final)", "You Must Buy The Bronze Pickaxe First!", function()
    local args = {
        [1] = "Iron Pickaxe"
    }
    
    game:GetService("ReplicatedStorage").Remotes.BuyPickaxe:InvokeServer(unpack(args))
end)

Section:NewButton("Unlock Desert", "You must unlock all the (Spawn) Pickaxes ", function()
    local args = {
        [1] = "1"
    }
    
    game:GetService("ReplicatedStorage").Remotes.BuyZone:FireServer(unpack(args))
end)

--Desert Island

local Section = Tab:NewSection("2-Desert Island")

Section:NewButton("1-Buy Gold Pickaxe", "The First Pickaxe To Buy", function()
    local args = {
        [1] = "Gold Pickaxe"
    }
    
    game:GetService("ReplicatedStorage").Remotes.BuyPickaxe:InvokeServer(unpack(args))
end)

Section:NewButton("2-Buy Platinum Pickaxe", "You Must Buy The Gold Pickaxe First!", function()
    local args = {
        [1] = "Platinum Pickaxe"
    }
    
    game:GetService("ReplicatedStorage").Remotes.BuyPickaxe:InvokeServer(unpack(args))
end)

Section:NewButton("3-Buy Sponge Pickaxe", "You Must Buy The Platinum Pickaxe First!", function()
    local args = {
        [1] = "Sponge Pickaxe"
    }
    
    game:GetService("ReplicatedStorage").Remotes.BuyPickaxe:InvokeServer(unpack(args))
end)

Section:NewButton("4-Buy Mushroom Pickaxe", "You Must Buy The Sponge Pickaxe First!", function()
    local args = {
        [1] = "Mushroom Pickaxe"
    }
    
    game:GetService("ReplicatedStorage").Remotes.BuyPickaxe:InvokeServer(unpack(args))
end)

Section:NewButton("5-Buy Heart Pickaxe (Final)", "You Must Buy The Mushroom Pickaxe First!", function()
    local args = {
        [1] = "Heart Pickaxe"
    }
    
    game:GetService("ReplicatedStorage").Remotes.BuyPickaxe:InvokeServer(unpack(args))
end)

Section:NewButton("Unlock Snow", "You must unlock all the (Desert) Pickaxes ", function()
    local args = {
        [1] = "2"
    }
    
    game:GetService("ReplicatedStorage").Remotes.BuyZone:FireServer(unpack(args))
end)

--Snow Island

local Section = Tab:NewSection("3-Snow Island")

Section:NewButton("1-Buy Gear Pickaxe", "The First Pickaxe To Buy", function()
    local args = {
        [1] = "Gear Pickaxe"
    }
    
    game:GetService("ReplicatedStorage").Remotes.BuyPickaxe:InvokeServer(unpack(args))
end)

Section:NewButton("2-Buy Cactus Pickaxe", "You Must Buy The Gear Pickaxe First!", function()
    local args = {
        [1] = "Cactus Pickaxe"
    }
    
    game:GetService("ReplicatedStorage").Remotes.BuyPickaxe:InvokeServer(unpack(args))
end)

Section:NewButton("3-Buy Bone Pickaxe", "You Must Buy The Cactus Pickaxe First!", function()
    local args = {
        [1] = "Bone Pickaxe"
    }
    
    game:GetService("ReplicatedStorage").Remotes.BuyPickaxe:InvokeServer(unpack(args))
end)

Section:NewButton("4-Buy Bedrock Pickaxe", "You Must Buy The Bone Pickaxe First!", function()
    local args = {
        [1] = "Bedrock Pickaxe"
    }
    
    game:GetService("ReplicatedStorage").Remotes.BuyPickaxe:InvokeServer(unpack(args))
end)

Section:NewButton("5-Buy Sapphire Pickaxe (Final)", "You Must Buy The Bedrock Pickaxe First!", function()
    local args = {
        [1] = "Sapphire Pickaxe"
    }
    
    game:GetService("ReplicatedStorage").Remotes.BuyPickaxe:InvokeServer(unpack(args))
end)

Section:NewButton("Unlock Cave", "You must unlock all the (Snow) Pickaxes", function()
    local args = {
        [1] = "3"
    }
    
    game:GetService("ReplicatedStorage").Remotes.BuyZone:FireServer(unpack(args))
end)

--Cave Island

local Section = Tab:NewSection("4-Cave Island")

Section:NewButton("1-Buy Diamond Pickaxe", "The First Pickaxe To Buy", function()
    local args = {
        [1] = "Diamond Pickaxe"
    }
    
    game:GetService("ReplicatedStorage").Remotes.BuyPickaxe:InvokeServer(unpack(args))
end)

Section:NewButton("2-Buy Emerald Pickaxe", "You Must Buy The Diamond Pickaxe First!", function()
    local args = {
        [1] = "Emerald Pickaxe"
    }
    
    game:GetService("ReplicatedStorage").Remotes.BuyPickaxe:InvokeServer(unpack(args))
end)

Section:NewButton("3-Buy Amber Pickaxe", "You Must Buy The Emerald Pickaxe First!", function()
    local args = {
        [1] = "Amber Pickaxe"
    }
    
    game:GetService("ReplicatedStorage").Remotes.BuyPickaxe:InvokeServer(unpack(args))
end)

Section:NewButton("4-Buy Ruby Pickaxe", "You Must Buy The Amber Pickaxe First!", function()
    local args = {
        [1] = "Ruby Pickaxe"
    }
    
    game:GetService("ReplicatedStorage").Remotes.BuyPickaxe:InvokeServer(unpack(args))
end)

Section:NewButton("5-Buy Amethyst Pickaxe (Final)", "You Must Buy The Ruby Pickaxe First!", function()
    local args = {
        [1] = "Amethyst Pickaxe"
    }
    
    game:GetService("ReplicatedStorage").Remotes.BuyPickaxe:InvokeServer(unpack(args))
end)

Section:NewButton("Unlock Ocean", "You must unlock all the (Cave) Pickaxes", function()
    local args = {
        [1] = "4"
    }
    
    game:GetService("ReplicatedStorage").Remotes.BuyZone:FireServer(unpack(args))
end)

--Ocean Island

local Section = Tab:NewSection("5-Ocean Island")

Section:NewButton("1-Buy Opal Pickaxe", "The First Pickaxe To Buy", function()
    local args = {
        [1] = "Opal Pickaxe"
    }
    
    game:GetService("ReplicatedStorage").Remotes.BuyPickaxe:InvokeServer(unpack(args))
end)

Section:NewButton("2-Buy Pearl Pickaxe", "You Must Buy The Opal Pickaxe First!", function()
    local args = {
        [1] = "Pearl Pickaxe"
    }
    
    game:GetService("ReplicatedStorage").Remotes.BuyPickaxe:InvokeServer(unpack(args))
end)

Section:NewButton("3-Buy Anchor Pickaxe", "You Must Buy The Pearl Pickaxe First!", function()
    local args = {
        [1] = "Anchor Pickaxe"
    }
    
    game:GetService("ReplicatedStorage").Remotes.BuyPickaxe:InvokeServer(unpack(args))
end)

Section:NewButton("4-Buy Coral Pickaxe", "You Must Buy The Anchor Pickaxe First!", function()
    local args = {
        [1] = "Coral Pickaxe"
    }
    
    game:GetService("ReplicatedStorage").Remotes.BuyPickaxe:InvokeServer(unpack(args))
end)

Section:NewButton("5-Buy Trident Pickaxe (Final)", "You Must Buy The Coral Pickaxe First!", function()
    local args = {
        [1] = "Trident Pickaxe"
    }
    
    game:GetService("ReplicatedStorage").Remotes.BuyPickaxe:InvokeServer(unpack(args))
end)

Section:NewButton("Unlock Jungle", "You must unlock all the (Ocean) Pickaxes", function()
    local args = {
        [1] = "5"
    }
    
    game:GetService("ReplicatedStorage").Remotes.BuyZone:FireServer(unpack(args)) 
end)

--Jungle Island

local Section = Tab:NewSection("6-Jungle Island")

Section:NewButton("1-Buy Glowrock Pickaxe", "The First Pickaxe To Buy", function()
    local args = {
        [1] = "Glowrock Pickaxe"
    }
    
    game:GetService("ReplicatedStorage").Remotes.BuyPickaxe:InvokeServer(unpack(args))
end)

Section:NewButton("2-Buy Solar Pickaxe", "You Must Buy The Glowrock Pickaxe First!", function()
    local args = {
        [1] = "Solar Pickaxe"
    }
    
    game:GetService("ReplicatedStorage").Remotes.BuyPickaxe:InvokeServer(unpack(args))
end)

Section:NewButton("3-Buy Alien Pickaxe", "You Must Buy The Solar Pickaxe First!", function()
    local args = {
        [1] = "Alien Pickaxe"
    }
    
    game:GetService("ReplicatedStorage").Remotes.BuyPickaxe:InvokeServer(unpack(args))
end)

Section:NewButton("4-Buy Obsidian Pickaxe", "You Must Buy The Alien Pickaxe First!", function()
    local args = {
        [1] = "Obsidian Pickaxe"
    }
    
    game:GetService("ReplicatedStorage").Remotes.BuyPickaxe:InvokeServer(unpack(args))
end)

Section:NewButton("5-Buy Molten Pickaxe (Final)", "You Must Buy The Obsidian Pickaxe First!", function()
    local args = {
        [1] = "Molten Pickaxe"
    }
    
    game:GetService("ReplicatedStorage").Remotes.BuyPickaxe:InvokeServer(unpack(args))
end)

Section:NewButton("Unlock Volcano", "You must unlock all the (Jungle) Pickaxes", function()
    local args = {
        [1] = "6"
    }
    
    game:GetService("ReplicatedStorage").Remotes.BuyZone:FireServer(unpack(args))
end)

--Volcano Island

local Section = Tab:NewSection("7-Volcano Island")

Section:NewButton("1-Buy Slime Pickaxe", "The First Pickaxe To Buy", function()
    local args = {
        [1] = "Slime Pickaxe"
    }
    
    game:GetService("ReplicatedStorage").Remotes.BuyPickaxe:InvokeServer(unpack(args))
    
end)

Section:NewButton("2-Buy Meteor Pickaxe", "You Must Buy The Slime Pickaxe First!", function()
    local args = {
        [1] = "Meteor Pickaxe"
    }
    
    game:GetService("ReplicatedStorage").Remotes.BuyPickaxe:InvokeServer(unpack(args))
    
end)

Section:NewButton("3-Buy Moonrock Pickaxe", "You Must Buy The Meteor Pickaxe First!", function()
    local args = {
        [1] = "Moonrock Pickaxe"
    }
    
    game:GetService("ReplicatedStorage").Remotes.BuyPickaxe:InvokeServer(unpack(args))
    
end)

Section:NewButton("4-Buy Omega Trident Pickaxe", "You Must Buy The Moonrock Pickaxe First!", function()
    local args = {
        [1] = "Omega Trident Pickaxe"
    }
    
    game:GetService("ReplicatedStorage").Remotes.BuyPickaxe:InvokeServer(unpack(args))
    
end)

Section:NewButton("5-Buy Spider Pickaxe (Final)", "You Must Buy The Omega Trident Pickaxe First!", function()
    local args = {
        [1] = "Spider Pickaxe"
    }
    
    game:GetService("ReplicatedStorage").Remotes.BuyPickaxe:InvokeServer(unpack(args))
    
end)

Section:NewButton("Unlock Space", "You must unlock all the (Volcano) Pickaxes", function()
    local args = {
        [1] = "7"
    }
    
    game:GetService("ReplicatedStorage").Remotes.BuyZone:FireServer(unpack(args))
end)

--Space Island

local Section = Tab:NewSection("8-Space Island")

Section:NewButton("1-Buy Martian Pickaxe", "The First Pickaxe To Buy", function()
    local args = {
        [1] = "Martian Pickaxe"
    }
    
    game:GetService("ReplicatedStorage").Remotes.BuyPickaxe:InvokeServer(unpack(args))
    
    
end)

Section:NewButton("2-Buy Zeus Pickaxe", "You Must Buy The Martian Pickaxe First!", function()
    local args = {
        [1] = "Zeus Pickaxe"
    }
    
    game:GetService("ReplicatedStorage").Remotes.BuyPickaxe:InvokeServer(unpack(args))
    
    
end)

Section:NewButton("3-Buy Laser Pickaxe", "You Must Buy The Zeus Pickaxe First!", function()
    local args = {
        [1] = "Laser Pickaxe"
    }
    
    game:GetService("ReplicatedStorage").Remotes.BuyPickaxe:InvokeServer(unpack(args))
    
    
end)

Section:NewButton("4-Buy Plasma Pickaxe", "You Must Buy The Laser Pickaxe First!", function()
    local args = {
        [1] = "Plasma Pickaxe"
    }
    
    game:GetService("ReplicatedStorage").Remotes.BuyPickaxe:InvokeServer(unpack(args))
    
    
end)

Section:NewButton("5-Buy Darkmatter Pickaxe (Final)", "You Must Buy The Plasma Pickaxe First!", function()
    local args = {
        [1] = "Darkmatter Pickaxe"
    }
    
    game:GetService("ReplicatedStorage").Remotes.BuyPickaxe:InvokeServer(unpack(args))
    
    
end)

Section:NewButton("Unlock Undead Forest", "You must unlock all the (Space) Pickaxes", function()
    local args = {
        [1] = "8"
    }
    
    game:GetService("ReplicatedStorage").Remotes.BuyZone:FireServer(unpack(args))
end)

--Undead Forest Island

local Section = Tab:NewSection("9-Undead Forest Island")

Section:NewButton("1-Buy Broom Pickaxe", "The First Pickaxe To Buy", function()
    local args = {
        [1] = "Broom Pickaxe"
    }
    
    game:GetService("ReplicatedStorage").Remotes.BuyPickaxe:InvokeServer(unpack(args))
    
end)

Section:NewButton("2-Buy Zombie Pickaxe", "You Must Buy The Broom Pickaxe First!", function()
    local args = {
        [1] = "Zombie Pickaxe"
    }
    
    game:GetService("ReplicatedStorage").Remotes.BuyPickaxe:InvokeServer(unpack(args))
    
end)

Section:NewButton("3-Buy Scarecrow Pickaxe", "You Must Buy The Zombie Pickaxe First!", function()
    local args = {
        [1] = "Scarecrow Pickaxe"
    }
    
    game:GetService("ReplicatedStorage").Remotes.BuyPickaxe:InvokeServer(unpack(args))
    
end)

Section:NewButton("4-Buy Lantern Pickaxe", "You Must Buy The Scarecrow Pickaxe First!", function()
    local args = {
        [1] = "Lantern Pickaxe"
    }
    
    game:GetService("ReplicatedStorage").Remotes.BuyPickaxe:InvokeServer(unpack(args))
    
end)

Section:NewButton("5-Buy Scythe Pickaxe (Final)", "You Must Buy The Lantern Pickaxe First!", function()
    local args = {
        [1] = "Scythe Pickaxe"
    }
    
    game:GetService("ReplicatedStorage").Remotes.BuyPickaxe:InvokeServer(unpack(args))
    
end)

Section:NewButton("Unlock Heaven", "You must unlock all the (Undead Forest) Pickaxes", function()
    local args = {
        [1] = "9"
    }
    
    game:GetService("ReplicatedStorage").Remotes.BuyZone:FireServer(unpack(args))
end)

--Heaven Island

local Section = Tab:NewSection("10-Heaven Island")

Section:NewButton("1-Buy Key Pickaxe", "The First Pickaxe To Buy", function()
    local args = {
        [1] = "Key Pickaxe"
    }
    
    game:GetService("ReplicatedStorage").Remotes.BuyPickaxe:InvokeServer(unpack(args))
    
end)

Section:NewButton("2-Buy Cupid's Pickaxe", "You Must Buy The Key Pickaxe First!", function()
    local args = {
        [1] = "Cupid's Pickaxe"
    }
    
    game:GetService("ReplicatedStorage").Remotes.BuyPickaxe:InvokeServer(unpack(args))
    
end)

Section:NewButton("3-Buy Scroll Pickaxe", "You Must Buy The Cupid's Pickaxe First!", function()
    local args = {
        [1] = "Scroll Pickaxe"
    }
    
    game:GetService("ReplicatedStorage").Remotes.BuyPickaxe:InvokeServer(unpack(args))
    
end)

Section:NewButton("4-Buy Chronos Pickaxe", "You Must Buy The Scroll Pickaxe First!", function()
    local args = {
        [1] = "Chronos Pickaxe"
    }
    
    game:GetService("ReplicatedStorage").Remotes.BuyPickaxe:InvokeServer(unpack(args))
    
end)

Section:NewButton("5-Buy Rainbow Pickaxe (Final)", "You Must Buy The Chronos Pickaxe First!", function()
    local args = {
        [1] = "Rainbow Pickaxe"
    }
    
    game:GetService("ReplicatedStorage").Remotes.BuyPickaxe:InvokeServer(unpack(args))
    
end)

Section:NewButton("Unlock Hell Dungeon", "You must unlock all the (Heaven) Pickaxes", function()
    local args = {
        [1] = "10"
    }
    
    game:GetService("ReplicatedStorage").Remotes.BuyZone:FireServer(unpack(args))
end)

--Hell Dungeon (Final)

local Section = Tab:NewSection("11-Hell Dungeon Island")

Section:NewButton("1-Buy Eye Pickaxe", "The First Pickaxe To Buy", function()
    local args = {
        [1] = "Eye Pickaxe"
    }
    
    game:GetService("ReplicatedStorage").Remotes.BuyPickaxe:InvokeServer(unpack(args))
    
end)

Section:NewButton("2-Buy Skull Pickaxe", "You Must Buy The Eye Pickaxe First!", function()
    local args = {
        [1] = "Skull Pickaxe"
    }
    
    game:GetService("ReplicatedStorage").Remotes.BuyPickaxe:InvokeServer(unpack(args))
    
end)

Section:NewButton("3-Buy Sceptor Pickaxe", "You Must Buy The Skull Pickaxe First!", function()
    local args = {
        [1] = "Sceptor Pickaxe"
    }
    
    game:GetService("ReplicatedStorage").Remotes.BuyPickaxe:InvokeServer(unpack(args))
    
end)

Section:NewButton("4-Buy Pitchfork Pickaxe", "You Must Buy The Sceptor Pickaxe First!", function()
    local args = {
        [1] = "Pitchfork Pickaxe"
    }
    
    game:GetService("ReplicatedStorage").Remotes.BuyPickaxe:InvokeServer(unpack(args))
    
end)

Section:NewButton("5-Buy Evil Scythe Pickaxe (Final)", "You Must Buy The Pitchfork Pickaxe First!", function()
    local args = {
        [1] = "Evil Scythe Pickaxe"
    }
    
    game:GetService("ReplicatedStorage").Remotes.BuyPickaxe:InvokeServer(unpack(args))
    
end)

--Jurassic

local Section = Tab:NewSection("Zone 2 (Time Travel World)")

local Section = Tab:NewSection("Soon!")

--Eggs Tab

local Tab = Window:NewTab("Eggs")

local Section = Tab:NewSection("Zone 1 Eggs")

Section:NewButton("Starter Egg 1", "Price:320 Coins", function()
    local args = {
        [1] = "Starter Egg",
        [2] = 1
    }
    
    game:GetService("ReplicatedStorage").Remotes.buyEgg:InvokeServer(unpack(args))
    
end)

Section:NewButton("Starter Egg 2", "Price:1.2K Coins", function()
    local args = {
        [1] = "Spotted Egg",
        [2] = 1
    }
    
    game:GetService("ReplicatedStorage").Remotes.buyEgg:InvokeServer(unpack(args))
    
end)

Section:NewButton("Starter Egg 3", "Price:10K Coins", function()
    local args = {
        [1] = "Floral Egg",
        [2] = 1
    }
    
    game:GetService("ReplicatedStorage").Remotes.buyEgg:InvokeServer(unpack(args))
    
end)

Section:NewButton("30M Egg", "Price:100qb Gems", function()
    local args = {
        [1] = "30M Egg",
        [2] = 1
    }
    
    game:GetService("ReplicatedStorage").Remotes.buyEgg:InvokeServer(unpack(args))
end)


Section:NewButton("Desert Egg", "Price:100k Coins", function()
    local args = {
        [1] = "Desert Egg",
        [2] = 1
    }
    
    game:GetService("ReplicatedStorage").Remotes.buyEgg:InvokeServer(unpack(args))
    
end)

Section:NewButton("Snow Egg", "Price:1M Coins", function()
    local args = {
        [1] = "Snow Egg",
        [2] = 1
    }
    
    game:GetService("ReplicatedStorage").Remotes.buyEgg:InvokeServer(unpack(args))
    
end)

Section:NewButton("Cave Egg", "Price:7.5M Coins", function()
    local args = {
        [1] = "Cave Egg",
        [2] = 1
    }
    
    game:GetService("ReplicatedStorage").Remotes.buyEgg:InvokeServer(unpack(args))
    
end)

Section:NewButton("Ocean Egg", "Price:20M Coins", function()
    local args = {
        [1] = "Ocean Egg",
        [2] = 1
    }
    
    game:GetService("ReplicatedStorage").Remotes.buyEgg:InvokeServer(unpack(args))
    
end)

Section:NewButton("Jungle Egg", "Price:120M Coins", function()
    local args = {
        [1] = "Jungle Egg",
        [2] = 1
    }
    
    game:GetService("ReplicatedStorage").Remotes.buyEgg:InvokeServer(unpack(args))
    
end)

Section:NewButton("Volcano Egg", "Price:400M Coins", function()
    local args = {
        [1] = "Volcano Egg",
        [2] = 1
    }
    
    game:GetService("ReplicatedStorage").Remotes.buyEgg:InvokeServer(unpack(args))
    
end)

Section:NewButton("Space Egg", "Price:1.8B Coins", function()
    local args = {
        [1] = "Space Egg",
        [2] = 1
    }
    
    game:GetService("ReplicatedStorage").Remotes.buyEgg:InvokeServer(unpack(args))
    
end)

Section:NewButton("Undead Egg", "Price:15B Coins", function()
    local args = {
        [1] = "Undead Egg",
        [2] = 1
    }
    
    game:GetService("ReplicatedStorage").Remotes.buyEgg:InvokeServer(unpack(args))
    
end)

Section:NewButton("Heavenly Egg", "Price:150B Coins", function()
    local args = {
        [1] = "Heavenly Egg",
        [2] = 1
    }
    
    game:GetService("ReplicatedStorage").Remotes.buyEgg:InvokeServer(unpack(args))
    
end)

Section:NewButton("Devil Egg", "Price:500B Coins", function()
    local args = {
        [1] = "Devil Egg",
        [2] = 1
    }
    
    game:GetService("ReplicatedStorage").Remotes.buyEgg:InvokeServer(unpack(args))
    
end)

--Zone 2 Eggs

local Section = Tab:NewSection("Zone 2 Eggs")
local Section = Tab:NewSection("Soon!")

--Upgrades Tab

local Tab = Window:NewTab("Upgrades")

--Zone 1 Upgrades

local Section = Tab:NewSection("Zone 1 Upgrades")

Section:NewButton("Ore Pay", "Price Change Every Upgrade", function()
    local args = {
        [1] = "Ore Pay"
    }
    
    game:GetService("ReplicatedStorage").Remotes.upgradePlr:FireServer(unpack(args))
    
end)

Section:NewButton("Pet Storage", "Price Change Every Upgrade", function()
    local args = {
        [1] = "Pet Storage"
    }
    
    game:GetService("ReplicatedStorage").Remotes.upgradePlr:FireServer(unpack(args))
end)

Section:NewButton("Player Speed", "Price Change Every Upgrade", function()
    local args = {
        [1] = "Player Speed"
    }
    
    game:GetService("ReplicatedStorage").Remotes.upgradePlr:FireServer(unpack(args))
    
end)

Section:NewButton("Auto Click Speed", "Price Change Every Upgrade", function()
    local args = {
        [1] = "Auto Click Speed"
    }
    
    game:GetService("ReplicatedStorage").Remotes.upgradePlr:FireServer(unpack(args))
    
end)

Section:NewButton("Pet Equipped", "Price: 1B Gems", function()
    local args = {
        [1] = "Pets Equipped"
    }
    
    game:GetService("ReplicatedStorage").Remotes.upgradePlr:FireServer(unpack(args))
    
end)

Section:NewButton("Drill Speed", "Price Change Every Upgrade", function()
    local args = {
        [1] = "Drill Speed"
    }
    
    game:GetService("ReplicatedStorage").Remotes.upgradePlr:FireServer(unpack(args))
    
end)

-- Zone 2 Upgrades

local Section = Tab:NewSection("Zone 2 Upgrades")

Section:NewButton("Pet Storage", "Price Change Every Upgrade", function()
    local args = {
        [1] = "Pet Storage2"
    }
    
    game:GetService("ReplicatedStorage").Remotes.upgradePlr:FireServer(unpack(args))
    
end)

Section:NewButton("Gem Pay", "Price Change Every Upgrade", function()
    local args = {
        [1] = "Gem Pay"
    }
    
    game:GetService("ReplicatedStorage").Remotes.upgradePlr:FireServer(unpack(args))
    
end)

Section:NewButton("Hatch Luck", "Price Change Every Upgrade", function()
    local args = {
        [1] = "Pet Luck"
    }
    
    game:GetService("ReplicatedStorage").Remotes.upgradePlr:FireServer(unpack(args))
    
end)

Section:NewButton("Hatch Speed", "Price Change Every Upgrade", function()
    local args = {
        [1] = "Hatch Speed"
    }
    
    game:GetService("ReplicatedStorage").Remotes.upgradePlr:FireServer(unpack(args))
    
end)

--Teleports Tab

local Tab = Window:NewTab("Teleports")

local Section = Tab:NewSection("Teleport to Specific Player")

Section:NewTextBox("Player Full Name", "Type his Full Roblox Name not The Nickname!", function(txt)
local p1 = game.Players.LocalPlayer.Character.HumanoidRootPart
local p2 = txt
local pos = p1.CFrame

p1.CFrame = game.Players[p2].Character.HumanoidRootPart.CFrame
end)

--Islands TP

local Section = Tab:NewSection("Islands TP (Zone 1,2)")

Section:NewButton("Spawn", "TP to Spawn", function()
    local args = {
        [1] = "Spawn"
    }
    
    game:GetService("ReplicatedStorage").Remotes.TeleportToPlace:InvokeServer(unpack(args))
    
end)

Section:NewButton("Desert", "TP to Desert", function()
    local args = {
        [1] = "Desert"
    }
    
    game:GetService("ReplicatedStorage").Remotes.TeleportToPlace:InvokeServer(unpack(args))
    
end)

Section:NewButton("Snow", "TP to Snow", function()
    local args = {
        [1] = "Snow"
    }
    
    game:GetService("ReplicatedStorage").Remotes.TeleportToPlace:InvokeServer(unpack(args))
    
end)

Section:NewButton("Cave", "TP to Cave", function()
    local args = {
        [1] = "Cave"
    }
    
    game:GetService("ReplicatedStorage").Remotes.TeleportToPlace:InvokeServer(unpack(args))
    
end)

Section:NewButton("Ocean", "TP to Ocean", function()
    local args = {
        [1] = "Ocean"
    }
    
    game:GetService("ReplicatedStorage").Remotes.TeleportToPlace:InvokeServer(unpack(args))
    
end)

Section:NewButton("Jungle", "TP to Jungle", function()
    local args = {
        [1] = "Jungle"
    }
    
    game:GetService("ReplicatedStorage").Remotes.TeleportToPlace:InvokeServer(unpack(args))
    
end)

Section:NewButton("Volcano", "TP to Volcano", function()
    local args = {
        [1] = "Volcano"
    }
    
    game:GetService("ReplicatedStorage").Remotes.TeleportToPlace:InvokeServer(unpack(args))
    
end)

Section:NewButton("Space", "TP to Space", function()
    local args = {
        [1] = "Space"
    }
    
    game:GetService("ReplicatedStorage").Remotes.TeleportToPlace:InvokeServer(unpack(args))
    
end)

Section:NewButton("Undead Forest", "TP to Undead Forest", function()
    local args = {
        [1] = "Undead Forest"
    }
    
    game:GetService("ReplicatedStorage").Remotes.TeleportToPlace:InvokeServer(unpack(args))
    
end)

Section:NewButton("Heaven", "TP to Heaven", function()
    local args = {
        [1] = "Heaven"
    }
    
    game:GetService("ReplicatedStorage").Remotes.TeleportToPlace:InvokeServer(unpack(args))
    
end)

Section:NewButton("Hell Dungeon", "TP to Hell Dungeon", function()
    local args = {
        [1] = "Hell Dungeon"
    }
    
    game:GetService("ReplicatedStorage").Remotes.TeleportToPlace:InvokeServer(unpack(args))
    
end)

Section:NewButton("Jurassic", "TP to Jurassic", function()
    local args = {
        [1] = "Jurassic"
    }
    
    game:GetService("ReplicatedStorage").Remotes.TeleportToPlace:InvokeServer(unpack(args))
    
end)

Section:NewButton("Atlantis", "TP to Atlantis", function()
    local args = {
        [1] = "Atlantis"
    }
    
    game:GetService("ReplicatedStorage").Remotes.TeleportToPlace:InvokeServer(unpack(args))
    
end)

Section:NewButton("Egypt", "TP to Egypt", function()
    local args = {
        [1] = "Egypt"
    }
    
    game:GetService("ReplicatedStorage").Remotes.TeleportToPlace:InvokeServer(unpack(args))
    
end)

Section:NewButton("Olympus", "TP to Olympus", function()
    local args = {
        [1] = "Olympus"
    }
    
    game:GetService("ReplicatedStorage").Remotes.TeleportToPlace:InvokeServer(unpack(args))
    
end)

Section:NewButton("Dragon City", "TP to Dragon City", function()
    local args = {
        [1] = "Dragon City"
    }
    
    game:GetService("ReplicatedStorage").Remotes.TeleportToPlace:InvokeServer(unpack(args))
    
end)

Section:NewButton("Shinobi Village", "TP to Shinobi Village", function()
    local args = {
        [1] = "Shinobi Village"
    }
    
    game:GetService("ReplicatedStorage").Remotes.TeleportToPlace:InvokeServer(unpack(args))
    
end)

Section:NewButton("Pirate City", "TP to Pirate City", function()
    local args = {
        [1] = "Pirate City"
    }
    
    game:GetService("ReplicatedStorage").Remotes.TeleportToPlace:InvokeServer(unpack(args))
    
end)

Section:NewButton("Demon District", "TP to Demon District", function()
    local args = {
        [1] = "Demon District"
    }
    
    game:GetService("ReplicatedStorage").Remotes.TeleportToPlace:InvokeServer(unpack(args))
    
end)

Section:NewButton("Wall District", "TP to Wall District", function()
    local args = {
        [1] = "Wall District"
    }
    
    game:GetService("ReplicatedStorage").Remotes.TeleportToPlace:InvokeServer(unpack(args))
    
end)

Section:NewButton("Tokyo", "TP to Tokyo", function()
    local args = {
        [1] = "Tokyo"
    }
    
    game:GetService("ReplicatedStorage").Remotes.TeleportToPlace:InvokeServer(unpack(args))
    
end)

Section:NewButton("Hero Academy", "TP to Hero Academy", function()
    local args = {
        [1] = "Hero Academy"
    }
    
    game:GetService("ReplicatedStorage").Remotes.TeleportToPlace:InvokeServer(unpack(args))
    
end)

Section:NewButton("Hunter Palace", "TP to Hunter Palace", function()
    local args = {
        [1] = "Hunter Palace"
    }
    
    game:GetService("ReplicatedStorage").Remotes.TeleportToPlace:InvokeServer(unpack(args))
    
end)

Section:NewButton("Space Citadel", "TP to Space Citadel", function()
    local args = {
        [1] = "Space Citadel"
    }
    
    game:GetService("ReplicatedStorage").Remotes.TeleportToPlace:InvokeServer(unpack(args))
    
end)

--Settings Tab

local Tab = Window:NewTab("Settings")

local Section = Tab:NewSection("GUI Settings")
Section:NewKeybind("Toggle GUI Bind", "Choose a Keybind to Toggle the GUI with", Enum.KeyCode.F, function()
	Library:ToggleUI()
end)

local Tab = Window:NewTab("Credits")

local Section = Tab:NewSection("The Scripts Made By: Forever Knight#9138")
local Section = Tab:NewSection("The Gui Made By: RealKareem#9400")
local Section = Tab:NewSection("First Tester:AhmedX9999999")
local Section = Tab:NewSection("If You Want to Support us join our discord server :) ")

Section:NewButton("Our Discord Server", "Feel Free to join it :)", function()
    getgenv().InviteCode = "PTPJBKnKFh"

    --Example getgenv().InviteCode = "pATHmbedmh"
    
    loadstring(game:HttpGet("https://raw.githubusercontent.com/LuaQLeak/Scripts/main/Discord-Auto-Join.lua"))()
end)
--Discord Auto Join

getgenv().InviteCode = "PTPJBKnKFh"

--Example getgenv().InviteCode = "pATHmbedmh"

loadstring(game:HttpGet("https://raw.githubusercontent.com/LuaQLeak/Scripts/main/Discord-Auto-Join.lua"))()
