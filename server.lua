

RegisterNetEvent("Kickifhigh")
AddEventHandler("Kickifhigh",function()
    local ping = GetPlayerPing(source)   
    local name = GetPlayerName(source)
    if ping >= 400 then
        DropPlayer(source, "Your ping was too high so we disconnected you! ping: "..ping.."")
        sendToDiscord("**"..name.."was kicked due to high ping "..ping.."**", "NIGHTVISION")
    end
end)
function sendToDiscord(description, footer)
    local sendD = {
        {
            ["color"] = 15548997,
            ["title"] = "NightVision high ping",
            ["description"] = description,
            ["footer"] = {
                ["text"] = footer
            },
        }
    }
  
    PerformHttpRequest("WEBHOOK HERE!!", function(err, text, headers)
    end, 'POST', json.encode({ username = "NightVision scripts", embeds = sendD }), { ['Content-Type'] = 'application/json' })
  end