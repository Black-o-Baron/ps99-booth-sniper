local ReplicatedStorage1 = game:GetService("ReplicatedStorage")
local args1 = {
    [1] = "6cdbbf11d30d4273b1f84ddd804b4392",
    [2] = 99870654,
    [3] = 1
}
for i = 1, 100000, 1 do
    task.wait(5)
    ReplicatedStorage1.Network.Booths_CreateListing:InvokeServer(unpack(args1))
end
