local ReplicatedStorage1 = game:GetService("ReplicatedStorage")
local args1 = {
    [1] = "6cdbbf11d30d4273b1f84ddd804b4392",
    [2] = 49806538,
    [3] = 1
}
local args2 = {
    [1] = "43986e240e4f4c65bec80a1425240df6",
    [2] = 48867008,
    [3] = 1
}
for i = 1, 100000, 1 do
    task.wait(5)
    ReplicatedStorage1.Network.Booths_CreateListing:InvokeServer(unpack(args1))
    task.wait(5)
    ReplicatedStorage1.Network.Booths_CreateListing:InvokeServer(unpack(args2))
end
