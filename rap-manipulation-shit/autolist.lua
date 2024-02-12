local ReplicatedStorage1 = game:GetService("ReplicatedStorage")
local args1
for i = 1, 200, 1 do
    task.wait(5)
    args1 = {
        [1] = "cb8eda4d6593498e87e9901a5af48163",
        [2] = 46678800,
        [3] = 1
    }
    ReplicatedStorage1.Network.Booths_CreateListing:InvokeServer(unpack(args1))
    -- task.wait(5)
    -- args1 = {
    --     [1] = "e23961d8fb554bfdb6a4419352994eea",
    --     [2] = 46678800,
    --     [3] = 1
    -- }
    -- ReplicatedStorage1.Network.Booths_CreateListing:InvokeServer(unpack(args1))
    -- task.wait(5)
    -- args1 = {
    --     [1] = "ef4239db53904f0b9ff211c3dd330558",
    --     [2] = 46678800,
    --     [3] = 1
    -- }
    -- ReplicatedStorage1.Network.Booths_CreateListing:InvokeServer(unpack(args1))
end
