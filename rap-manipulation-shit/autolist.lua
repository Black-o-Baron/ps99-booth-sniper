local ReplicatedStorage1 = game:GetService("ReplicatedStorage")
local args1 = {
    [1] = "54e0db755d7c4219bd464f55407ea36a",
    [2] = 136870654,
    [3] = 1
}
for i = 1, 100000, 1 do
    task.wait(1)
    ReplicatedStorage1.Network.Booths_CreateListing:InvokeServer(unpack(args1))
end
