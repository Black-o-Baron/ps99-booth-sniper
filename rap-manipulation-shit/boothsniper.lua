if not game:IsLoaded() then
    game.Loaded:Wait()
end

task.wait(15)
game.Players.LocalPlayer.PlayerScripts.Scripts.Core["Idle Tracking"].Enabled = false
local Booths_Broadcast = game:GetService("ReplicatedStorage").Network:WaitForChild("Booths_Broadcast")
local Players = game:GetService('Players')
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local signal

local vu = game:GetService("VirtualUser")
Players.LocalPlayer.Idled:connect(function()
    vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    task.wait(1)
    vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
end)

local function tryPurchase(uid, playerid, buytimestamp)
    signal = game:GetService("RunService").Heartbeat:Connect(function()
        if buytimestamp < workspace:GetServerTimeNow() then
            signal:Disconnect()
            signal = nil
        end
    end)
    repeat task.wait() until signal == nil
    ReplicatedStorage.Network.Booths_RequestPurchase:InvokeServer(playerid, uid)
end

--=======================================================================================================
local PURCHASE_PRICE1 = 45678800
local PURCHASE_PRICE2 = 45592980
local PURCHASE_PRICE3 = 45764250
--=======================================================================================================
local function listHuge1()
    local args = {
        [1] = "cb8eda4d6593498e87e9901a5af48163", -- axolotl
        [2] = PURCHASE_PRICE1,
        [3] = 1
    }
    ReplicatedStorage.Network.Booths_CreateListing:InvokeServer(unpack(args))
end
local function listHuge2()
    local args = {
        [1] = "e23961d8fb554bfdb6a4419352994eea", -- skeleton
        [2] = PURCHASE_PRICE2,
        [3] = 1
    }
    ReplicatedStorage.Network.Booths_CreateListing:InvokeServer(unpack(args))
end
local function listHuge3()
    local args = {
        [1] = "ef4239db53904f0b9ff211c3dd330558", -- mascot
        [2] = PURCHASE_PRICE3,
        [3] = 1
    }
    ReplicatedStorage.Network.Booths_CreateListing:InvokeServer(unpack(args))
end
--=======================================================================================================

Booths_Broadcast.OnClientEvent:Connect(function(username, message)
    if type(message) == "table" then
        local highestTimestamp = -math.huge -- Initialize with the smallest possible number
        local key = nil
        local listing = nil
        for v, value in pairs(message["Listings"] or {}) do
            if type(value) == "table" and value["ItemData"] and value["ItemData"]["data"] then
                local timestamp = value["Timestamp"]
                if timestamp > highestTimestamp then
                    highestTimestamp = timestamp
                    key = v
                    listing = value
                end
            end
        end
        if listing then
            local buytimestamp = listing["ReadyTimestamp"]
            local data = listing["ItemData"]["data"]
            local gems = tonumber(listing["DiamondCost"])
            local uid = key
            local item = data["id"]
            local amount = tonumber(data["_am"]) or 1
            local playerid = message['PlayerID']
            local unitGems = gems / amount

            print("ITEM NAME: " .. item)

            if string.find(item, "Huge Hologram Axolotl") and unitGems == PURCHASE_PRICE1 then
                coroutine.wrap(tryPurchase)(uid, playerid, buytimestamp)
                task.wait(2)
                coroutine.wrap(listHuge2)()
                return
            elseif string.find(item, "Huge Skeleton") and unitGems == PURCHASE_PRICE2 then
                coroutine.wrap(tryPurchase)(uid, playerid, buytimestamp)
                task.wait(2)
                coroutine.wrap(listHuge3)()
                return
            elseif string.find(item, "Huge BIG Maskot") and unitGems == PURCHASE_PRICE3 then
                coroutine.wrap(tryPurchase)(uid, playerid, buytimestamp)
                task.wait(2)
                coroutine.wrap(listHuge1)()
                return
            end
        end
    end
end)
