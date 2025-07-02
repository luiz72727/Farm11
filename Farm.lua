local ReplicatedStorage = game:GetService("ReplicatedStorage")
local remote = ReplicatedStorage:WaitForChild("RemoteEvent")

local towers = {"Scientist Cameraguy", "Mech Cameraguy", "Titan Upgrade TV Guy"}

local positions = {
    Vector3.new(0, 5, 0),
    Vector3.new(10, 5, 10),
    Vector3.new(-10, 5, -10),
}

for i, towerName in ipairs(towers) do
    local pos = positions[i] or Vector3.new(0, 5, 0)

    remote:FireServer({
        ["CFrame"] = CFrame.new(pos),
        ["Rotation"] = 0,
        ["Tower"] = towerName
    })
end
