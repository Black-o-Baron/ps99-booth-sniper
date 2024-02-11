local ReplicatedStorage1 = game:GetService("ReplicatedStorage")
local args1 = {
    [1] = "cb8eda4d6593498e87e9901a5af48163",
    [2] = 117890564,
    [3] = 1
}
for i = 1, 100000, 1 do
    task.wait(5)
    ReplicatedStorage1.Network.Booths_CreateListing:InvokeServer(unpack(args1))
end
