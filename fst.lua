    _G.rob = true

				noclip = true
				game:GetService('RunService').Stepped:connect(function()
					if noclip then
						game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
					end
				end)
				plr = game.Players.LocalPlayer
				mouse = plr:GetMouse()
				mouse.KeyDown:connect(function(key)

					if key == "b" then
						noclip = not noclip
						game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
					end
				end)
				print('Loaded')

				local a = game.Workspace.Cashiers:GetChildren()
				for b = 1, #a do
					local c = a[b]
					c.Name = "CASHIER" .. b
				end
				for d, e in pairs(game.Workspace:GetDescendants()) do
					if e:IsA("Seat") then
						e:Destroy()
					end
				end
				for f, g in pairs(game.Workspace.MAP.Map["Da Furniture"]:GetChildren()) do
					if g then
						if g.Name == "Part" then
							g.CanCollide = false
						end
					end
				end
				for h, i in pairs(game.Workspace.MAP.Map["Ubi's Resturant"]:GetChildren()) do
					if i then
						if i.Name == "Part" then
							if i.Size ~= Vector3.new(48, 3.25, 80) then
								i.CanCollide = false
							end
						end
					end
				end
				for j, k in pairs(game.Workspace.MAP.Map["Gas Station"]["Gas Station"]:GetChildren()) do
					if k then
						if k.Name == "Part" then
							if k.Size ~= Vector3.new(68, 1, 56) then
								k.CanCollide = false
							end
						end
					end
				end
				function toTarget(l, m, n)
					local o = game:service "TweenService"
					local p = TweenInfo.new((m - l).Magnitude / 170, Enum.EasingStyle.Quad)
					local q = tick()
					local r, s =
						pcall(
							function()
							local r = o:Create(game.Players.LocalPlayer.Character["HumanoidRootPart"], p, {CFrame = n})
							r:Play()
						end
						)
					if not r then
						return s
					end
					for i, v in pairs(workspace.Cashiers:GetChildren()) do
						if v:WaitForChild("Humanoid").Health > 0 then
							local cf = v.Open.CFrame
							local lv = cf.lookVector
							game.workspace.Players[game.Players.LocalPlayer.Name].HumanoidRootPart.CFrame = cf + (lv * Vector3.new(-1, 0, 0))
							return v
						end
					end
				end
				local function t(u, v)
					local w = (u.Position - v.Position).magnitude
					if w <= 50 then
						fireclickdetector(v:FindFirstChild("ClickDetector"))
						return w
					end
				end
				while _G.rob == true do
					wait()
					repeat
						for x, y in pairs(game.Workspace.Ignored.Drop:GetChildren()) do
							if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - y.Position).Magnitude <= 50 then
								local z = y
								t(game.Players.LocalPlayer.Character.HumanoidRootPart, y)
								wait()
							end
						end
						if not game.Players.LocalPlayer.Character:FindFirstChild("Combat") then
							local A = game.Players.LocalPlayer.Backpack:FindFirstChild("Combat")
							A.Parent = game.Players.LocalPlayer.Character
						end
						wait()
						for b, B in pairs(game.Workspace.Cashiers:GetChildren()) do
							wait()
							if B:FindFirstChild("Humanoid") then
								if B.Humanoid.Health > 0 then
									wait()
									if B.Name ~= "CASHIER5" then
										B.Open.Orientation = Vector3.new(0, 90, 0)
										B.Open.CanCollide = false
									end
									if B.Name == "CASHIER5" then
										--B.Open.Orientation = Vector3.new(0, 180, 0)
										B.Open.Position = B.Open.Position - Vector3.new(0,0,0)
										B.Open.CanCollide = false
									end
									wait()
									poss = B.Open.Position - Vector3.new(0, 0, 0)
									posc = B.Open.CFrame - Vector3.new(-1, 0, 0)
									toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position, poss, posc)
									repeat
										wait()
									until (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - poss).Magnitude <
										50 or
										_G.rob == false or
										B.Humanoid.Health <= 0
									repeat
										if not game.Players.LocalPlayer.Character:FindFirstChild("Combat") then
											local A = game.Players.LocalPlayer.Backpack:FindFirstChild("Combat")
											A.Parent = game.Players.LocalPlayer.Character
										end
										toTarget(
											game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position,
											poss,
											posc
										)
										wait(0)
										game:GetService("VirtualUser"):Button1Down(Vector2.new())
									until B.Humanoid.Health <= 0 or _G.rob == false
									wait(0)
									for C = 5, 50 do
										wait()
										for x, y in pairs(game.Workspace.Ignored.Drop:GetChildren()) do
											if
												(game.Players.LocalPlayer.Character.HumanoidRootPart.Position - y.Position).Magnitude <=
													50
											then
												if y:IsA("Part") then
													local z = y
													t(game.Players.LocalPlayer.Character.HumanoidRootPart, y)
													wait()
												end
											end
										end
									end
								end
							end
						end
					until _G.rob == false
				end
end);
