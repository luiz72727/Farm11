-- Referência ao RemoteEvent (ajuste conforme seu jogo)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local SpawnTowerEvent = ReplicatedStorage:WaitForChild("RemoteEvent"):WaitForChild("SpawnTower")
local UpgradeTowerEvent = ReplicatedStorage:WaitForChild("RemoteEvent"):WaitForChild("UpgradeTower")

-- Função para spawnar torre
local function spawnTower(towerName, positionVector3)
    local cf = CFrame.new(positionVector3)
    local args = {
        Tower = towerName,
        CFrame = cf,
        Rotation = 0
    }
    SpawnTowerEvent:FireServer(args)
end

-- Função para upar torre
local function upgradeTower(tower)
    for i = 1, 5 do
        UpgradeTowerEvent:FireServer({Tower = tower})
        wait(0.1)
    end
end

-- Função para encontrar a torre por nome
local function findTowerByName(towerName)
    for _, tower in ipairs(workspace.Towers:GetChildren()) do
        if tower.Name == towerName then
            return tower
        end
    end
    return nil
end

-- ⬇️ Spawnar 3 Scientist rápido
spawnTower("Scientist", Vector3.new(-50, -81.4, -40))
spawnTower("Scientist", Vector3.new(-44, -81.4, -42))
spawnTower("Scientist", Vector3.new(-53, -81.4, -44))

-- ⏳ Espera um pouco até conseguir dinheiro para Mech
repeat
    wait(1)
until game.Players.LocalPlayer.leaderstats.Cash.Value >= 2500 -- ajuste o valor necessário

-- ⬇️ Spawnar Mech
spawnTower("Mech", Vector3.new(-39.3, -81.4, -43.1))

-- Esperar Mech aparecer no workspace
local mechTower = nil
repeat
    mechTower = findTowerByName("Mech")
    wait(0.5)
until mechTower

-- ⬆️ Upar Mech até o máximo
for i = 1, 5 do
    UpgradeTowerEvent:FireServer({Tower = mechTower})
    wait(0.2)
end

-- ⏳ Espera dinheiro para Titan
repeat
    wait(1)
until game.Players.LocalPlayer.leaderstats.Cash.Value >= 3500 -- ajuste o valor necessário

-- ⬇️ Spawnar Titan TV
spawnTower("Titan", Vector3.new(-43, -81.4, -55.6))

-- Esperar Titan aparecer no workspace
local titanTower = nil
repeat
    titanTower = findTowerByName("Titan")
    wait(0.5)
until titanTower

-- ⬆️ Upar Titan até nível 4
for i = 1, 4 do
    UpgradeTowerEvent:FireServer({Tower = titanTower})
    wait(0.2)
end

print("✅ Script finalizado!")
