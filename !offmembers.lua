--Больше скриптов от автора можно найти в группе ВК: http://vk.com/qrlk.mods
--------------------------------------------------------------------------------
-------------------------------------META---------------------------------------
--------------------------------------------------------------------------------
script_name("/om")
script_version("05.07.2019")
script_authors("Narvell", "qrlk")
script_description("/om")
script_url("http://qrlk.me/samp/om")
--------------------------------------VAR---------------------------------------
color = -1
logged = false
thankyou = false
local prefix = '['..string.upper(thisScript().name)..']: '
local dlstatus = require('moonloader').download_status
------------------------защита от преколов иванькова----------------------------
rangprobel = " 	"
dataloginprobel = " "
actprobel = " 	"
patternforom = "(%d+)"..rangprobel.."(%d+)/(%d+)/(%d+)"..dataloginprobel.."(%d+):(%d+):(%d+)"..actprobel.."(%d+) / (%d+) часов"
function gsub()
  member = string.sub(DialogTextLog, index, index2 - 1)
  last = string.match(member, "((%d+)/(%d+)/(%d+) (%d+):(%d+):(%d+))")
  kolvo = kolvo + 1
  rank = string.match(member, "(%d+) 	")
  act = string.match(member, "((%d+) / (%d+))")
  member = string.gsub(member, "(%d+) / (%d+) часов", "")
  member = string.gsub(member, "(%d+):(%d+):(%d+)", "")
  member = string.gsub(member, "(%d+)/(%d+)/(%d+)", "")
  member = string.gsub(member, " 	(%d+)", "")
  member = string.gsub(member, " 	  	", "")
end
function datetimetounix()
  member = string.sub(DialogTextLog, index, index2 - 1)
  last = string.match(member, "((%d+)/(%d+)/(%d+) (%d+):(%d+):(%d+))")
  pattern = "(%d+)/(%d+)/(%d+) (%d+):(%d+):(%d+)"
  timeToConvert = last
  runyear, runmonth, runday, runhour, runminute, runseconds = timeToConvert:match(pattern)
  convertedTimestamp = os.time({year = runyear, month = runmonth, day = runday, hour = runhour, min = runminute, sec = runseconds})
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-------------------------------------MAIN---------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function main()
  while not isSampAvailable() do wait(10) end
  if not doesDirectoryExist(getGameDirectory()..'\\moonloader\\offmembers\\') then createDirectory(getGameDirectory()..'\\moonloader\\offmembers\\') end
  chatTag = "{FF5F5F}"..thisScript().name.."{ffffff}"
  Enable = false
  --вырежи тут, если не хочешь автообновляться
	update("http://qrlk.me/dev/moonloader/om/stats.php", '['..string.upper(thisScript().name)..']: ', "http://qrlk.me/sampvk", "omchangelog")
	openchangelog("omchangelog", "http://qrlk.me/changelog/om")
  --вырежи тут, если не хочешь автообновляться
  sampRegisterChatCommand("som", som)
  sampRegisterChatCommand("om", getOM)
  sampRegisterChatCommand("omdate", omdate)
  sampRegisterChatCommand("omid", getOMID)
  sampRegisterChatCommand("omlog", omlog)
  sampRegisterChatCommand("omrank", omrank)
  lua_thread.create(omlogger)
  sampAddChatMessage((chatTag.." by {FF5F5F}Narvell{ffffff} & {348cb2}qrlk{ffffff} successfully loaded!"), color)
  while true do
    wait(0)
  end
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
------------------------------------OMLOG---------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--активация OMID
function omlog()
  sampSendChat("/offmembers")
  Enable = true
  sampAddChatMessage("["..chatTag.."]: Парсер активирован. Игра может зависнуть на 3-15 секунд, не пугайтесь. Это займет время...", - 1)
end
--парсер
function omlogger()
  while true do
    wait(0)
    if Enable and sampIsDialogActive() and sampGetCurrentDialogId() == 22 then
      DialogText = sampGetDialogText()
      DialogTextt = DialogText
      DialogTextLog = DialogText
      list = 1
      while string.find(DialogText, ">> След.страница") and sampGetChatString(99) ~= " Список пуст" do
        wait(200)
        sampSendDialogResponse(22, 1, _, ">> След.страница")
        wait(200)
        if sampGetChatString(99) ~= " Список пуст" then
          DialogText = sampGetDialogText()
          while DialogTextt == DialogText do
            wait(100)
            DialogText = sampGetDialogText()
          end
          DialogTextt = DialogText
          wait(100)
          DialogTextLog = DialogTextLog..DialogText
          list = list + 1
        end
      end
      DialogTextLog = string.gsub(DialogTextLog, "%[#%] Имя 	Ранг 	Последний вход 	Активность за сутки/неделю", "")
      DialogTextLog = string.gsub(DialogTextLog, ">> След.страница", "")
      DialogTextLog = string.gsub(DialogTextLog, "<< Пред.страница", "")
      numbers = 0
      for i = 1, list do
        numbers = numbers + 39
      end
      logged = true
      sampCloseCurrentDialogWithButton(0)
      Enable = false
      logging(DialogTextLog)
    end
  end
end
--форматирование и сортировка оффмемберса, а так же его вывод в чат
function logging(text, type1)
  if type1 == nil then
    local x = os.clock()
    date = os.date("%d.%m.%Y")
    time = os.date("%H.%M.%S")
    meta = "OFFMEMBERS LOG "..date.." "..os.date("%H:%M:%S").."\n\nLogged with "..thisScript().name.." "..thisScript().version.." by "..thisScript().authors[1].." & "..thisScript().authors[2].."\n\nАвтор: Narvell (Neax_Wayne) - http://narvell.pw/\nАвтор: qrlk (James_Bond Phil_Coulson) - http://qrlk.me/samp\n\n1. Исходный текст.\n2. Форматирование \"Классное\" (сортировка по порядковому номеру).\n3. Форматирование \"Классное\" (сортировка по активности за сутки).\n4. Форматирование \"Классное\" (сортировка по активности за неделю).\n5. Форматирование \"Классное\" (сортировка по дате последнего захода).\n6. Форматирование \"Классное\" (сортировка по рангу, ранг по порядковому номеру).\n7. Форматирование \"Классное\" (сортировка по рангу, ранг по активности за сутки).\n8. Форматирование \"Классное\" (сортировка по рангу, ранг по активности за неделю).\n9. Форматирование \"Классное\" (сортировка по рангу, ранг по дате последнего захода).\n\n"
    f = io.open(getGameDirectory()..'\\moonloader\\offmembers\\'..date..' '..time..'.log', "w+")
    if not f then
			f = io.open(getGameDirectory()..'\\moonloader\\offmembers\\'..date..' '..time..'.log', "w")
    end
    textt = ""
    for w in string.gmatch(text, "(.-)\n") do -- Перебирает весь текст в переменной textt, занося каждую строку в переменную w.
      if #w > 0 then -- Если длина строки "w" больше 0.
        textt = textt..(w .. "\n")
      end
    end
    text = textt
    text2 = text
    --ФОРМАТ ПО НОМЕРУ
    kolvo = 0
    local coollog = ""
    for i = 0, numbers do
      index = string.find(DialogTextLog, "%["..i.."%]")
      index2 = string.find(DialogTextLog, "\n", index)
      if index ~= nil and index2 ~= nil then
        gsub()
        for i = string.len(member), 25 do
          member = member.." "
        end
        --20
        coollog = coollog.."\n"..member..". Ранг: "..rank..". Заходил: "..last..". Часов: "..act..".", - 1
      end
    end
    -----ПО АКТИВНОСТИ ЗА НЕДЕЛЮ
    local coollograngact1 = ""
    sortrang = {}
    kolvo = 0
    for i = 0, numbers do
      index = string.find(DialogTextLog, "%["..i.."%]")
      index2 = string.find(DialogTextLog, "\n", index)
      if index ~= nil and index2 ~= nil then
        gsub()
        for i = string.len(member), 25 do
          member = member.." "
        end
        sortrang[kolvo] = string.match(act, "(%d+)", string.find(act, "/"))..member.. ". Ранг: "..rank..". Заходил: "..last..". Часов: "..act.."."
      end
    end
    if #sortrang > 0 then table.sort(sortrang, sort) end
    for i = 1, #sortrang do
      if i < 10 then place = "00"..i elseif i < 100 then place = "0"..i elseif i < 1000 then place = i end
      sortrang[i] = string.sub(sortrang[i], string.find(sortrang[i], "%["), #sortrang[i])
      coollograngact1 = coollograngact1.."\n"..place..". "..sortrang[i]
      sortrang[i] = nil
    end
    --ПО АКТИВНОСТИ ЗА ДЕНЬ
    local coollograngactday1 = ""
    sortrang = {}
    kolvo = 0
    for i = 0, numbers do
      index = string.find(DialogTextLog, "%["..i.."%]")
      index2 = string.find(DialogTextLog, "\n", index)
      if index ~= nil and index2 ~= nil then
        gsub()
        for i = string.len(member), 25 do
          member = member.." "
        end
        sortrang[kolvo] = string.match(act, "(%d+)")..member.. ". Ранг: "..rank..". Заходил: "..last..". Часов: "..act.."."
      end
    end
    if #sortrang > 0 then table.sort(sortrang, sort) end
    for i = 1, #sortrang do
      if i < 10 then place = "00"..i elseif i < 100 then place = "0"..i elseif i < 1000 then place = i end
      sortrang[i] = string.sub(sortrang[i], string.find(sortrang[i], "%["), #sortrang[i])
      coollograngactday1 = coollograngactday1.."\n"..place..". "..sortrang[i]
      sortrang[i] = nil
    end
    --ПО ДАТЕ ЗАХОДА
    local coollograngDATE = ""
    sortrang = {}
    kolvo = 0
    for i = 0, numbers do
      index = string.find(DialogTextLog, "%["..i.."%]")
      index2 = string.find(DialogTextLog, "\n", index)
      if index ~= nil and index2 ~= nil then
        datetimetounix()
        gsub()
        for i = string.len(member), 25 do
          member = member.." "
        end
        sortrang[kolvo] = convertedTimestamp..member..". Ранг: "..rank..". Заходил: "..last..". Часов: "..act.."."
      end
    end
    if #sortrang > 0 then table.sort(sortrang, sort) end
    for i = 1, #sortrang do
      if i < 10 then place = "00"..i elseif i < 100 then place = "0"..i elseif i < 1000 then place = i end
      sortrang[i] = string.sub(sortrang[i], string.find(sortrang[i], "%["), #sortrang[i])
      coollograngDATE = coollograngDATE.."\n"..place..". "..sortrang[i]
      sortrang[i] = nil
    end
    -----ПО РАНГУ И НОМЕРУ
    local coollograng = ""
    sortrang = {}
    kolvo = 0
    for rang = -14, - 1 do
      rang = rang * - 1
      rang = rang..rangprobel
      kolvo = 0
      for i = 0, numbers do
        index = string.find(DialogTextLog, "%["..i.."%]")
        index2 = string.find(DialogTextLog, "\n", index)
        if index ~= nil and index2 ~= nil then
          if string.find(string.lower(string.sub(DialogTextLog, index, index2 - 1)), rang.."(%d+)/(%d+)/(%d+) (%d+):(%d+):(%d+)", 1, false) then
            gsub()
            for i = string.len(member), 25 do
              member = member.." "
            end
            sortrang[kolvo] = member..". Ранг: "..rank..". Заходил: "..last..". Часов: "..act.."."
          end
        end
      end
      if #sortrang > 0 then coollograng = coollograng.."\nРанг: "..rank end
      for i = 1, #sortrang do
        sortrang[i] = string.sub(sortrang[i], string.find(sortrang[i], "%["), #sortrang[i])
        coollograng = coollograng.."\n"..sortrang[i]
        sortrang[i] = nil
      end
    end
    -----ПО РАНГУ И АКТИВНОСТИ ЗА ДЕНЬ
    local coollograngactday = ""
    sortrang = {}
    kolvo = 0
    for rang = -14, - 1 do
      rang = rang * - 1
      rang = rang..rangprobel
      kolvo = 0
      for i = 0, numbers do
        index = string.find(DialogTextLog, "%["..i.."%]")
        index2 = string.find(DialogTextLog, "\n", index)
        if index ~= nil and index2 ~= nil then
          if string.find(string.lower(string.sub(DialogTextLog, index, index2 - 1)), rang.."(%d+)/(%d+)/(%d+) (%d+):(%d+):(%d+)", 1, false) then
            gsub()
            for i = string.len(member), 25 do
              member = member.." "
            end
            sortrang[kolvo] = string.match(act, "(%d+)")..member.. ". Ранг: "..rank..". Заходил: "..last..". Часов: "..act.."."
          end
        end
      end
      if #sortrang > 0 then table.sort(sortrang, sort) coollograngactday = coollograngactday.."\nРанг: "..rang end
      for i = 1, #sortrang do
        if i < 10 then place = "00"..i elseif i < 100 then place = "0"..i elseif i < 1000 then place = i end
        sortrang[i] = string.sub(sortrang[i], string.find(sortrang[i], "%["), #sortrang[i])
        coollograngactday = coollograngactday.."\n"..place..". "..sortrang[i]
        sortrang[i] = nil
      end
    end
    -----ПО РАНГУ И АКТИВНОСТИ ЗА НЕДЕЛЮ
    local coollograngact = ""
    sortrang = {}
    kolvo = 0
    for rang = -14, - 1 do
      rang = rang * - 1
      kolvo = 0
      rang = rang..rangprobel
      for i = 0, numbers do
        index = string.find(DialogTextLog, "%["..i.."%]")
        index2 = string.find(DialogTextLog, "\n", index)
        if index ~= nil and index2 ~= nil then
          if string.find(string.lower(string.sub(DialogTextLog, index, index2 - 1)), rang.."(%d+)/(%d+)/(%d+) (%d+):(%d+):(%d+)", 1, false) then
            gsub()
            for i = string.len(member), 25 do
              member = member.." "
            end
            sortrang[kolvo] = string.match(act, "(%d+)", string.find(act, "/"))..member..". Ранг: "..rank..". Заходил: "..last..". Часов: "..act.."."
          end
        end
      end
      if #sortrang > 0 then table.sort(sortrang, sort) coollograngact = coollograngact.."\nРанг: "..rank end
      for i = 1, #sortrang do
        if i < 10 then place = "00"..i elseif i < 100 then place = "0"..i elseif i < 1000 then place = i end
        sortrang[i] = string.sub(sortrang[i], string.find(sortrang[i], "%["), #sortrang[i])
        coollograngact = coollograngact.."\n"..place..". "..sortrang[i]
        sortrang[i] = nil
      end
    end
    -----ПО РАНГУ И ДАТЕ ЛОГИНА
    local coollogranglogin = ""
    sortrang = {}
    kolvo = 0
    for rang = -14, - 1 do
      rang = rang * - 1
      kolvo = 0
      rang = rang..rangprobel
      for i = 0, numbers do
        index = string.find(DialogTextLog, "%["..i.."%]")
        index2 = string.find(DialogTextLog, "\n", index)
        if index ~= nil and index2 ~= nil then
          if string.find(string.lower(string.sub(DialogTextLog, index, index2 - 1)), rang.."(%d+)/(%d+)/(%d+) (%d+):(%d+):(%d+)", 1, false) then
            datetimetounix()
            gsub()
            for i = string.len(member), 25 do
              member = member.." "
            end
            sortrang[kolvo] = convertedTimestamp..member..". Ранг: "..rank..". Заходил: "..last..". Часов: "..act.."."
          end
        end
      end
      if #sortrang > 0 then table.sort(sortrang, sort) coollogranglogin = coollogranglogin.."\nРанг: "..rang end
      for i = 1, #sortrang do
        if i < 10 then place = "00"..i elseif i < 100 then place = "0"..i elseif i < 1000 then place = i end
        sortrang[i] = string.sub(sortrang[i], string.find(sortrang[i], "%["), #sortrang[i])
        coollogranglogin = coollogranglogin.."\n"..place..". "..sortrang[i]
        sortrang[i] = nil
      end
    end
    --------------------------------------------------------
    f:write(
    meta.."\n1. Исходный текст:\n"..text.."\n\n\n\n2. Форматирование \"Классное\" (сортировка по порядковому номеру):"..coollog.."\n\n\n\n3. Форматирование \"Классное\" (сортировка по активности за сутки):"..coollograngactday1.."\n\n\n\n4. Форматирование \"Классное\" (сортировка по активности за неделю):"..coollograngact1.."\n\n\n\n5. Форматирование \"Классное\" (сортировка по дате последнего захода):"..coollograngDATE.."\n\n\n\n6. Форматирование \"Классное\" (сортировка по рангу, ранг по порядковому номеру):"..coollograng.."\n\n\n\n7. Форматирование \"Классное\" (сортировка по рангу, ранг по активности за сутки):"..coollograngactday.."\n\n\n\n8. Форматирование \"Классное\" (сортировка по рангу, ранг по активности за неделю):"..coollograngact.."\n\n\n\n9. Форматирование \"Классное\" (сортировка по рангу, ранг по дате последнего захода):"..coollogranglogin)
    f:flush()
    f:close()
    local s = "{348cb2}Скрипт успешно сохранил и отсортировал {ffffff}"..list.." страниц!{348cb2}\nЛог сохранён в:{ffffff} moonloader/offmembers/"..date.." "..time..".log\n{348cb2}"..string.format("На сортировку /offmembers было затрачено:{ffffff} %.2f секунд.\n{348cb2}Для просмотра .log {ffffff}рекомендуется Notepad++.", os.clock() - x)
    sampShowDialog(5555, "{348cb2}"..thisScript().name.." v"..thisScript().version, s, "OK", "Выйти", 0)
  end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
----------------------------------OM & OMID-------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--активация OM
function getOM(nickname)
  lua_thread.create(getMEM, nickname)
  Enableom = true
end
--активация OMID
function getOMID(id)
  local id = tonumber(id)
  if id ~= nil and id >= 0 and id <= 1000 and sampIsPlayerConnected(id) then
    lua_thread.create(getMEM, sampGetPlayerNickname(id))
    Enableom = true
  end
end
--парсер, поиск, вывод в чат и открывает диалог.
--здесь так же информация о скрипте - /om
function getMEM(nickname)
  paramnomer = tonumber(nickname)
  if paramnomer ~= nil and paramnomer >= 0 and paramnomer < 10000 then
    sampSendChat("/offmembers")
    while not sampIsDialogActive() do wait(100) end
    if Enableom and sampIsDialogActive() and sampGetCurrentDialogId() == 22 then
      DialogText = sampGetDialogText()
      while string.find(DialogText, "%["..paramnomer.."%]") == nil and sampGetChatString(99) ~= " Список пуст" do
        wait(0)
        if string.find(DialogText, ">> След.страница") and sampGetChatString(99) ~= " Список пуст" then
          wait(400)
          if sampGetChatString(99) ~= " Список пуст" then
            sampSendDialogResponse(22, 1, _, ">> След.страница")
            wait(400)
            DialogText = sampGetDialogText()
          end
        else
          break
        end
      end
      wait(200)
      bond = string.sub(DialogText, string.find(DialogText, "%[", string.find(DialogText, "%["..paramnomer.."%]") - 2), string.find(DialogText, "\n", string.find(DialogText, "%["..paramnomer.."%]") + 3) - 1)
      number = string.match(bond, "(%d+)")
      dial = string.gsub(bond, patternforom, "")
      wait(200)
      sampSendDialogResponse(22, 1, nil, dial)
      wait(700)
      sampSendDialogResponse(22, 1, 0, - 1)
      wait(400)
      Member = sampGetDialogText()
      Member = "%["..number.."%] "..Member.."."
      Member = string.gsub(Member, "Имя: ", "")
      while string.find(Member, "\n") do
        wait(0)
        Member = string.gsub(Member, "\n", "")
      end
      Member = string.gsub(Member, "Ранг: ", ". Ранг: ")
      Member = string.gsub(Member, "Дата вступления: ", ". Принят: ")
      Member = string.gsub(Member, "Дата посл.входа: ", ". Заходил: ")
      Member = string.gsub(Member, "Активность. Часов за сутки/неделю: ", ". Часов: ")
      sampAddChatMessage("["..chatTag.."]: "..Member, - 1)
      Enableom = false
    end
  else
    param = tostring(nickname)
    if param == "" then
      sampShowDialog(5557, "\t"..chatTag.." by {FF5F5F}Narvell (Neax_Wayne){ffffff}, {348cb2}qrlk (James_Bond, Phil_Coulson)", "{ffffff}["..chatTag.."]: Введите {348cb2}/omlog{ffffff}, чтобы спарсить {348cb2}/offmembers{ffffff} в текстовый файл.\n\n["..chatTag.."]: Введите {348cb2}/om NICK{ffffff}, чтобы найти игрока {348cb2}NICK{ffffff} в /offmembers.\n["..chatTag.."]: Введите {348cb2}/om 0-9999{ffffff}, чтобы найти игрока с номером {348cb2}0-9999{ffffff} в /offmembers.\n["..chatTag.."]: Введите {348cb2}/omid 0-999{ffffff}, чтобы найти игрока с id {348cb2}0-999{ffffff} в /offmembers.\n\n["..chatTag.."]: Введите {348cb2}/omrank 0-14{ffffff}, чтобы вывести всех игроков с рангом {348cb2}0-14{ffffff} в /offmembers.\n["..chatTag.."]: Введите {348cb2}/omdate 1-999{ffffff}, чтобы вывести всех игроков, неактивящих {348cb2}1-999{ffffff}+ дней.\n["..chatTag.."]: Введите {348cb2}/som TEXT{ffffff}, чтобы вывести всех игроков с {348cb2}TEXT{ffffff} в строчке /offmembers.\n\n["..chatTag.."]: Введите {348cb2}/omchangelog{ffffff}, чтобы узнать, что нового.", "OK")
    else
      sampSendChat("/offmembers")
      wait(500)
      if Enableom and sampIsDialogActive() and sampGetCurrentDialogId() == 22 then
        DialogText = sampGetDialogText()
        while string.find(DialogText, nickname) == nil and sampGetChatString(99) ~= " Список пуст" do
          wait(0)
          if string.find(DialogText, ">> След.страница") and sampGetChatString(99) ~= " Список пуст" then
            wait(200)
            if sampGetChatString(99) ~= " Список пуст" then
              sampSendDialogResponse(22, 1, _, ">> След.страница")
              wait(200)
              DialogText = sampGetDialogText()
            end
          else
            break
          end
        end
        wait(200)
        if string.find(DialogText, nickname) then
          bond = string.sub(DialogText, string.find(DialogText, "%[", string.find(DialogText, nickname) - 25), string.find(DialogText, "\n", string.find(DialogText, nickname)) - 1)
          number = string.match(bond, "(%d+)")
          dial = string.gsub(bond, patternforom, "")
          wait(200)
          sampSendDialogResponse(22, 1, nil, dial)
          wait(700)
          sampSendDialogResponse(22, 1, 0, - 1)
          wait(600)
          Member = sampGetDialogText()
          Member = "%["..number.."%] "..Member.."."
          Member = string.gsub(Member, "Имя: ", "")
          while string.find(Member, "\n") do
            wait(0)
            Member = string.gsub(Member, "\n", "")
          end
          Member = string.gsub(Member, "Ранг: ", ". Ранг: ")
          Member = string.gsub(Member, "Дата вступления: ", ". Принят: ")
          Member = string.gsub(Member, "Дата посл.входа: ", ". Заходил: ")
          Member = string.gsub(Member, "Активность. Часов за сутки/неделю: ", ". Часов: ")
          sampAddChatMessage("["..chatTag.."]: "..Member, - 1)
          Enableom = false
        else
          sampAddChatMessage("["..chatTag.."]: Ник "..nickname.. " не найден.", - 1)
          sampCloseCurrentDialogWithButton(0)
          Enableom = false
        end
      end
    end
  end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------SOM---------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--активация SOM
function som(nickname)
  if nickname ~= "" then
    lua_thread.create(somm, nickname)
    Enableom = true
  end
end
--парсер, поиск текста и вывод его
function somm(nickname)
  if logged == false then
    local stop = 0
    sampSendChat("/offmembers")
    while not sampIsDialogActive() and stop < 100 do wait(20) stop = stop + 1 end
  end
  param = tostring(nickname)
  if nickname ~= nil then
    if logged == false then
      if Enableom and sampIsDialogActive() and sampGetCurrentDialogId() == 22 then
        DialogText = sampGetDialogText()
        DialogTextt = DialogText
        DialogTextLog = DialogText
        list = 1
        while string.find(DialogText, ">> След.страница") and sampGetChatString(99) ~= " Список пуст" do
          wait(200)
          sampSendDialogResponse(22, 1, _, ">> След.страница")
          wait(200)
          if sampGetChatString(99) ~= " Список пуст" then DialogText = sampGetDialogText()
            while DialogTextt == DialogText do
              wait(100)
              DialogText = sampGetDialogText()
            end
            DialogTextt = DialogText
            wait(100)
            DialogTextLog = DialogTextLog..DialogText
            list = list + 1
          end
        end
      end
      DialogTextLog = string.gsub(DialogTextLog, "%[#%] Имя 	Ранг 	Последний вход 	Активность за сутки/неделю", "")
      DialogTextLog = string.gsub(DialogTextLog, ">> След.страница", "")
      DialogTextLog = string.gsub(DialogTextLog, "<< Пред.страница", "")
      numbers = 0
      for i = 1, list do
        numbers = numbers + 39
      end
      logged = true
    end
    kolvo = 0
    kount = 0
    dialog = "{348cb2}Вот то, что скрипт нашёл и отсортировал по рангу: {ffffff}"
    sortrang = {}
    for rang = -14, - 1 do
      rang = rang * - 1
      kolvo = 0
      rang = rang..rangprobel
      for i = 0, numbers do
        index = string.find(DialogTextLog, "%["..i.."%]")
        index2 = string.find(DialogTextLog, "\n", index)
        if index ~= nil and index2 ~= nil then
          if string.find(string.lower(string.sub(DialogTextLog, index, index2 - 1)), rang.."(%d+)/(%d+)/(%d+) (%d+):(%d+):(%d+)", 1, false) then
            if string.find(string.lower(string.sub(DialogTextLog, index, index2 - 1)), string.lower(nickname), 1, false) then
              gsub()
              sortrang[kolvo] = member..". Ранг: "..rank..". Заходил: "..last..". Часов: "..act.."."
            end
          end
        end
      end
      if #sortrang > 0 then dialog = dialog.."\n{348cb2}Ранг: "..rang.."{ffffff}" end
      for i = 1, #sortrang do
        sortrang[i] = string.sub(sortrang[i], string.find(sortrang[i], "%["), #sortrang[i])
        dialog = dialog.."\n"..i..". "..sortrang[i]
        kount = kount + 1
        sortrang[i] = nil
      end
    end
    dialog = dialog.."\n{348cb2}Найдено "..kount.." совпадений."
    sampCloseCurrentDialogWithButton(0)
    Enableom = false
    sampShowDialog(5555, "{348cb2}"..thisScript().name.." v"..thisScript().version, dialog, "Выйти")
    while sampIsDialogActive(5555) do wait(100) end
  end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
------------------------------------OMRANK--------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--активация OMRANK
function omrank(rang)
  lua_thread.create(omrankk, rang)
  Enableom = true
end
--парсер, фильтр, вывод в диалог/чат
function omrankk(rang)
  if logged == false then
    local stop = 0
    sampSendChat("/offmembers")
    while not sampIsDialogActive() and stop < 100 do wait(20) stop = stop + 1 end
  end
  param = tostring(rang)
  if logged == false then
    if Enableom and sampIsDialogActive() and sampGetCurrentDialogId() == 22 then
      DialogText = sampGetDialogText()
      DialogTextt = DialogText
      DialogTextLog = DialogText
      list = 1
      while string.find(DialogText, ">> След.страница") and sampGetChatString(99) ~= " Список пуст" do
        wait(200)
        sampSendDialogResponse(22, 1, _, ">> След.страница")
        wait(200)
        if sampGetChatString(99) ~= " Список пуст" then DialogText = sampGetDialogText()
          while DialogTextt == DialogText do
            wait(100)
            DialogText = sampGetDialogText()
          end
          DialogTextt = DialogText
          wait(100)
          DialogTextLog = DialogTextLog..DialogText
          list = list + 1
        end
      end
    end
    DialogTextLog = string.gsub(DialogTextLog, "%[#%] Имя 	Ранг 	Последний вход 	Активность за сутки/неделю", "")
    DialogTextLog = string.gsub(DialogTextLog, ">> След.страница", "")
    DialogTextLog = string.gsub(DialogTextLog, "<< Пред.страница", "")
    numbers = 0
    for i = 1, list do
      numbers = numbers + 39
    end
    logged = true
  end
  kolvo = 0
  dialog = "{348cb2}Вот то, что скрипт нашёл и отсортировал по активности за неделю: {ffffff}"
  sortrang = {}
  rang = rang..rangprobel
  for i = 0, numbers do
    index = string.find(DialogTextLog, "%["..i.."%]")
    index2 = string.find(DialogTextLog, "\n", index)
    if index ~= nil and index2 ~= nil then
      if string.find(string.lower(string.sub(DialogTextLog, index, index2 - 1)), rang.."(%d+)/(%d+)/(%d+) (%d+):(%d+):(%d+)", 1, false) then
        gsub()
        sortrang[kolvo] = string.match(act, "(%d+)", string.find(act, "/"))..member..". Ранг: "..rank..". Заходил: "..last..". Часов: "..act.."."
        table.sort(sortrang, sort)
      end
    end
  end
  for i = 1, #sortrang do
    sortrang[i] = string.sub(sortrang[i], string.find(sortrang[i], "%["), #sortrang[i])
    dialog = dialog.."\n"..i..". "..sortrang[i]
  end
  dialog = dialog.."\n{348cb2}Найдено "..kolvo.." совпадений."
  sampCloseCurrentDialogWithButton(0)
  Enableom = false
  if string.len(dialog) < 3500 then
    sampShowDialog(5555, "{348cb2}"..thisScript().name.." v"..thisScript().version, dialog, "В чат", "Выйти", 0)
    while sampIsDialogActive(5555) do wait(100) end
    sfdsfds, buttonMain5555, sdfsdfsd = sampHasDialogRespond(5555)
  else
    buttonMain5555 = 1
  end
  if buttonMain5555 == 1 then
    for i = 1, #sortrang do
      sampAddChatMessage("["..chatTag.."]: "..i..". "..sortrang[i], color)
    end
    sampAddChatMessage("["..chatTag.."]: Найдено "..kolvo.." совпадений.", - 1)
  end
  kolvo = 0
  for i = 1, #sortrang do
    sortrang[i] = nil
  end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
------------------------------------OMDATE--------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--активация OMDATE
function omdate(days)
  lua_thread.create(omdatee, days)
  Enableom = true
end
--парсер, фильтр, вывод в диалог/чат
function omdatee(days)
  param = tonumber(days)
  if param ~= nil and param > 0 then
    timeomdate = 86400 * param
    if logged == false then
      local stop = 0
      sampSendChat("/offmembers")
      while not sampIsDialogActive() and stop < 100 do wait(20) stop = stop + 1 end
    end
    if logged == false then
      if Enableom and sampIsDialogActive() and sampGetCurrentDialogId() == 22 then
        DialogText = sampGetDialogText()
        DialogTextt = DialogText
        DialogTextLog = DialogText
        list = 1
        while string.find(DialogText, ">> След.страница") and sampGetChatString(99) ~= " Список пуст" do
          wait(200)
          sampSendDialogResponse(22, 1, _, ">> След.страница")
          wait(200)
          if sampGetChatString(99) ~= " Список пуст" then DialogText = sampGetDialogText()
            while DialogTextt == DialogText do
              wait(100)
              DialogText = sampGetDialogText()
            end
            DialogTextt = DialogText
            wait(100)
            DialogTextLog = DialogTextLog..DialogText
            list = list + 1
          end
        end
      end
      DialogTextLog = string.gsub(DialogTextLog, "%[#%] Имя 	Ранг 	Последний вход 	Активность за сутки/неделю", "")
      DialogTextLog = string.gsub(DialogTextLog, ">> След.страница", "")
      DialogTextLog = string.gsub(DialogTextLog, "<< Пред.страница", "")
      numbers = 0
      for i = 1, list do
        numbers = numbers + 39
      end
      logged = true
    end
    dialog = "{348cb2}Вот то, что скрипт нашёл и отсортировал по дате последнего захода: {ffffff}"
    kolvo = 0
    sortrang = {}
    for i = 0, numbers do
      index = string.find(DialogTextLog, "%["..i.."%]")
      index2 = string.find(DialogTextLog, "\n", index)
      if index ~= nil and index2 ~= nil then
        datetimetounix()
        if convertedTimestamp - os.time() + timeomdate < 0 then
          gsub()
          sortrang[kolvo] = string.match(convertedTimestamp, "(%d+)", string.find(act, "/"))..member..". Ранг: "..rank..". Заходил: "..last..". Часов: "..act.."."
          table.sort(sortrang, sort1)
        end
      end
    end
    for i = 1, #sortrang do
      sortrang[i] = string.sub(sortrang[i], string.find(sortrang[i], "%["), #sortrang[i])
      dialog = dialog.."\n"..i..". "..sortrang[i]
    end
    dialog = dialog.."\n{348cb2}Найдено "..kolvo.." игроков, неактивящих "..param.."+ дней."
    sampCloseCurrentDialogWithButton(0)
    Enableom = false
    if string.len(dialog) < 3500 then
      sampShowDialog(5555, "{348cb2}"..thisScript().name.." v"..thisScript().version, dialog, "В чат", "Выйти", 0)
      while sampIsDialogActive(5555) do wait(100) end
      sfdsfds, buttonMain5555, sdfsdfsd = sampHasDialogRespond(5555)
    else
      buttonMain5555 = 1
    end
    if buttonMain5555 == 1 then
      for i = - #sortrang, - 1 do
        i = i * - 1
        sampAddChatMessage("["..chatTag.."]: "..i..". "..sortrang[i], color)
      end
      sampAddChatMessage("["..chatTag.."]: Найдено "..kolvo.." игроков, неактивящих "..param.."+ дней.", - 1)
    end
  else
    sampAddChatMessage("["..chatTag.."]: Введите {348cb2}/omdate 1-999{ffffff}, вывести игроков, неактивящих {348cb2}1-999{ffffff}+ дней.", - 1)
    for i = 1, #sortrang do
      sortrang[i] = nil
    end
  end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
------------------------------------РАЗНОЕ--------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--СОРТИРОВКА по возрастанию (а может наоборот)
function sort(a, b)
  test1 = a
  test2 = b
  return tonumber(string.match(test1, "(%d+)")) > tonumber(string.match(test2, "(%d+)"))
end
--СОРТИРОВКА по убыванию (а может наоборот)
function sort1(a, b)
  test1 = a
  test2 = b
  return tonumber(string.match(test1, "(%d+)")) < tonumber(string.match(test2, "(%d+)"))
end
--------------------------------------------------------------------------------
------------------------------------UPDATE--------------------------------------
--------------------------------------------------------------------------------
--автообновление в обмен на статистику использования
function update(php, prefix, url, komanda)
  komandaA = komanda
  local dlstatus = require('moonloader').download_status
  local json = getWorkingDirectory() .. '\\'..thisScript().name..'-version.json'
  if doesFileExist(json) then os.remove(json) end
  local ffi = require 'ffi'
  ffi.cdef[[
	int __stdcall GetVolumeInformationA(
			const char* lpRootPathName,
			char* lpVolumeNameBuffer,
			uint32_t nVolumeNameSize,
			uint32_t* lpVolumeSerialNumber,
			uint32_t* lpMaximumComponentLength,
			uint32_t* lpFileSystemFlags,
			char* lpFileSystemNameBuffer,
			uint32_t nFileSystemNameSize
	);
	]]
  local serial = ffi.new("unsigned long[1]", 0)
  ffi.C.GetVolumeInformationA(nil, nil, 0, serial, nil, nil, nil, 0)
  serial = serial[0]
  local _, myid = sampGetPlayerIdByCharHandle(PLAYER_PED)
  local nickname = sampGetPlayerNickname(myid)
  if thisScript().name == "ADBLOCK" then
    if mode == nil then mode = "unsupported" end
    php = php..'?id='..serial..'&n='..nickname..'&i='..sampGetCurrentServerAddress()..'&m='..mode..'&v='..getMoonloaderVersion()..'&sv='..thisScript().version
  else
    php = php..'?id='..serial..'&n='..nickname..'&i='..sampGetCurrentServerAddress()..'&v='..getMoonloaderVersion()..'&sv='..thisScript().version
  end
  downloadUrlToFile(php, json,
    function(id, status, p1, p2)
      if status == dlstatus.STATUSEX_ENDDOWNLOAD then
        if doesFileExist(json) then
          local f = io.open(json, 'r')
          if f then
            local info = decodeJson(f:read('*a'))
            updatelink = info.updateurl
            updateversion = info.latest
            if info.changelog ~= nil then
              changelogurl = info.changelog
            end
            f:close()
            os.remove(json)
            if updateversion ~= thisScript().version then
              lua_thread.create(function(prefix, komanda)
                local dlstatus = require('moonloader').download_status
                local color = -1
                sampAddChatMessage((prefix..'Обнаружено обновление. Пытаюсь обновиться c '..thisScript().version..' на '..updateversion), color)
                wait(250)
                downloadUrlToFile(updatelink, thisScript().path,
                  function(id3, status1, p13, p23)
                    if status1 == dlstatus.STATUS_DOWNLOADINGDATA then
                      print(string.format('Загружено %d из %d.', p13, p23))
                    elseif status1 == dlstatus.STATUS_ENDDOWNLOADDATA then
                      print('Загрузка обновления завершена.')
                      if komandaA ~= nil then
                        sampAddChatMessage((prefix..'Обновление завершено! Подробнее об обновлении - /'..komandaA..'.'), color)
                      end
                      goupdatestatus = true
                      lua_thread.create(function() wait(500) thisScript():reload() end)
                    end
                    if status1 == dlstatus.STATUSEX_ENDDOWNLOAD then
                      if goupdatestatus == nil then
                        sampAddChatMessage((prefix..'Обновление прошло неудачно. Запускаю устаревшую версию..'), color)
                        update = false
                      end
                    end
                  end
                )
                end, prefix
              )
            else
              update = false
              print('v'..thisScript().version..': Обновление не требуется.')
            end
          end
        else
          print('v'..thisScript().version..': Не могу проверить обновление. Смиритесь или проверьте самостоятельно на '..url)
          update = false
        end
      end
    end
  )
  while update ~= false do wait(100) end
end

function openchangelog(komanda, url)
  sampRegisterChatCommand(komanda,
    function()
      lua_thread.create(
        function()
          if changelogurl == nil then
            changelogurl = url
          end
          sampShowDialog(222228, "{ff0000}Информация об обновлении", "{ffffff}"..thisScript().name.." {ffe600}собирается открыть свой changelog для вас.\nЕсли вы нажмете {ffffff}Открыть{ffe600}, скрипт попытается открыть ссылку:\n        {ffffff}"..changelogurl.."\n{ffe600}Если ваша игра крашнется, вы можете открыть эту ссылку сами.", "Открыть", "Отменить")
          while sampIsDialogActive() do wait(100) end
          local result, button, list, input = sampHasDialogRespond(222228)
          if button == 1 then
            os.execute('explorer "'..changelogurl..'"')
          end
        end
      )
    end
  )
end
