local bannedPpl = {}



game["Players"].PlayerAdded:Connect(function(player)
    if bannedPpl[player.UserID ] then player:Kick("server banned, ;< ") return end
    player.Chatted:Connect(function (message, event)
        if string.find( message,";") and string.sub(message,1,4) == "kick" then
            local argument = string.sub(message,6,string.len(message))
            print(argument)
            if game['Players'][argument] then
                print("KICKED")
                game['Players'][argument]:Kick()
                Chat:UnicastMessage("BE GONE! (player kicked)", player)
            else
                Chat:UnicastMessage("Player not found!", player)
            end
        elseif string.find( message,";") and string.sub(message,1,9) == "ban" then
            local argument = string.sub(message,11,string.len(message))
            print(argument)
            if game['Players'][argument] then
                print("KICKED")
                bannedPpl[game['Players'][argument].UserID ] = "evil"
                game['Players'][argument]:Kick("you got server banned! Mister chief is dissappointed (or the admins are evil)")
                Chat:UnicastMessage("plyaer, evicerated", player)
            else
                Chat:UnicastMessage("Player not found!", player)
            end
        else
            print("bruh")
        end
    end)
end)
--kick
