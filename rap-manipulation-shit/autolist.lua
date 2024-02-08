local ReplicatedStorage1 = game:GetService("ReplicatedStorage")
local args1 = {
    [1] = "9eb22c204a3b46f8a4ab5fb51e919c17",
    [2] = 120765468,
    [3] = 1
}
for i = 1, 100000, 1 do
    task.wait(5)
    ReplicatedStorage1.Network.Booths_CreateListing:InvokeServer(unpack(args1))
end
