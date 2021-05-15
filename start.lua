for i,v in pairs(game.Players:GetPlayers()) do
	v.Chatted:Connect(function(msg)
	    local msg = msg:gsub(" ", "+")
	    print(msg)
	    local xd = game:HttpGet('https://some-random-api.ml/chatbot?message='..msg..'&key=')
	    local data = game.HttpService:JSONDecode(xd)
	    local res = data.response
	    
        
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(res,"All")
	end)
end
game.Players.PlayerAdded:Connect(function(v)
	v.Chatted:Connect(function(msg)
	    
	    local xd = game:HttpGet('https://some-random-api.ml/chatbot?message='..msg..'&key=')
	    local data = game.HttpService:JSONDecode(xd)
	    local res = data.response
        
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(res,"All")
	end)
end)



