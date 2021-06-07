local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/Squex01/PepperClicker/main/PepperClicker.lua')))()
local w = library:CreateWindow("Pepper Clicker")
local b = w:CreateFolder("AutoFarm")
local f = w:CreateFolder("AutoBuy")
local g = w:CreateFolder("Teleport")
local e = w:CreateFolder("Mix")
local u = w:CreateFolder("Credits")

b:Toggle("Auto Pepper",function(bool)
    shared.toggle = bool
    pepper = bool
end)

f:Toggle("Auto Buy Pepper",function(bool)
    shared.toggle = bool
    buypepper = bool
end)

f:Toggle("Auto Ruby Upgrades",function(bool)
    shared.toggle = bool
    autoruby = bool
end)

f:Toggle("Auto Diamond Upgrades",function(bool)
    shared.toggle = bool
    autodiamond = bool
end)

--f:Toggle("Buy Eggs",function(bool)
--    shared.toggle = bool
--    autoegg = bool
--end)

--f:Dropdown("Select Egg",{"Basig Egg","Nature Egg","Cracked Egg","Celebration Egg","Desert Egg","Frozen Egg","Crystal Egg","Lava Egg","Sand Egg","Toxic Egg","Monochrome Egg","Heavenly Egg","Slushie Egg","Ruby Egg","UFO Egg","Ocean Egg","Magic Egg","HoneyEgg"},function(bool)
--    EggName = bool
--end)

g:Dropdown("Select World",{"Spawn","Decaying Desert","Frozen Tundra","Crystal Cove","Lava Wasteland","Beach","Toxic Territories","Monochrome","Heaven","Slushy","Ruby","UFO","Ocean","Pumpkin Patch","Bee Hive"},true,function(blubb)
    world = blubb
end)

g:Button("Teleport to World",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Workspace").Portals[world].Destination.CFrame.Position + Vector3.new(0,0,0))
end)

e:Button("Claim Daily Rewards",function()
    for i,v in pairs(game:GetService("Workspace").RewardChests:GetDescendants()) do
        if v.Name == "BillboardGui" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Parent.CFrame.Position)
            wait(0.5)
        end
    end
end)

e:Toggle("AntiAfk",function(bool)
    shared.toggle = bool
    AntiAfk = bool
end)

e:Slider("WalkSpeed",{min = 10; max = 200; precise = true; },function(value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
end)

e:Slider("JumpPower",{min = 10; max = 200; precise = true; },function(value)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
end)

--Credits
u:Button("Relax",function()
    setclipboard("Relax")
end)

u:Button("Discrod Server",function()
    setclipboard("https://discord.gg/K4txdRSVfq")
end)


while wait() do
    
    if pepper == true then
        game:GetService("ReplicatedStorage").Events.Click:FireServer()
    end

    if buypepper == true then
        game:GetService("ReplicatedStorage").Events.BuyPepper:FireServer()
    end

    if autoruby == true then
        game:GetService("ReplicatedStorage").Events.UpgradeRuby:InvokeServer("Jumps")
        game:GetService("ReplicatedStorage").Events.UpgradeRuby:InvokeServer("AutoClickerSpeed")
        game:GetService("ReplicatedStorage").Events.UpgradeRuby:InvokeServer("PetStorage")
        game:GetService("ReplicatedStorage").Events.UpgradeRuby:InvokeServer("PetsEquipped")
        wait(0.2)
    end

    if autodiamond == true then
        game:GetService("ReplicatedStorage").Events.UpgradeUpgrade:InvokeServer("AutoClickerSpeed")
        game:GetService("ReplicatedStorage").Events.UpgradeUpgrade:InvokeServer("LuckBonus")
        game:GetService("ReplicatedStorage").Events.UpgradeUpgrade:InvokeServer("RebirthMultiplier")
        game:GetService("ReplicatedStorage").Events.UpgradeUpgrade:InvokeServer("PetStorage")
        game:GetService("ReplicatedStorage").Events.UpgradeUpgrade:InvokeServer("WalkSpeed")
        wait(0.2)
    end

    if AntiAfk == true then
        local bb=game:service'VirtualUser'
        bb:CaptureController()
        bb:ClickButton2(Vector2.new())
    end
end