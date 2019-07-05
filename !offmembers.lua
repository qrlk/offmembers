--������ �������� �� ������ ����� ����� � ������ ��: http://vk.com/qrlk.mods
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
------------------------������ �� �������� ���������----------------------------
rangprobel = " 	"
dataloginprobel = " "
actprobel = " 	"
patternforom = "(%d+)"..rangprobel.."(%d+)/(%d+)/(%d+)"..dataloginprobel.."(%d+):(%d+):(%d+)"..actprobel.."(%d+) / (%d+) �����"
function gsub()
  member = string.sub(DialogTextLog, index, index2 - 1)
  last = string.match(member, "((%d+)/(%d+)/(%d+) (%d+):(%d+):(%d+))")
  kolvo = kolvo + 1
  rank = string.match(member, "(%d+) 	")
  act = string.match(member, "((%d+) / (%d+))")
  member = string.gsub(member, "(%d+) / (%d+) �����", "")
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
  --������ ���, ���� �� ������ ���������������
	update("http://qrlk.me/dev/moonloader/om/stats.php", '['..string.upper(thisScript().name)..']: ', "http://qrlk.me/sampvk", "omchangelog")
	openchangelog("omchangelog", "http://qrlk.me/changelog/om")
  --������ ���, ���� �� ������ ���������������
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
--��������� OMID
function omlog()
  sampSendChat("/offmembers")
  Enable = true
  sampAddChatMessage("["..chatTag.."]: ������ �����������. ���� ����� ��������� �� 3-15 ������, �� ���������. ��� ������ �����...", - 1)
end
--������
function omlogger()
  while true do
    wait(0)
    if Enable and sampIsDialogActive() and sampGetCurrentDialogId() == 22 then
      DialogText = sampGetDialogText()
      DialogTextt = DialogText
      DialogTextLog = DialogText
      list = 1
      while string.find(DialogText, ">> ����.��������") and sampGetChatString(99) ~= " ������ ����" do
        wait(200)
        sampSendDialogResponse(22, 1, _, ">> ����.��������")
        wait(200)
        if sampGetChatString(99) ~= " ������ ����" then
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
      DialogTextLog = string.gsub(DialogTextLog, "%[#%] ��� 	���� 	��������� ���� 	���������� �� �����/������", "")
      DialogTextLog = string.gsub(DialogTextLog, ">> ����.��������", "")
      DialogTextLog = string.gsub(DialogTextLog, "<< ����.��������", "")
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
--�������������� � ���������� �����������, � ��� �� ��� ����� � ���
function logging(text, type1)
  if type1 == nil then
    local x = os.clock()
    date = os.date("%d.%m.%Y")
    time = os.date("%H.%M.%S")
    meta = "OFFMEMBERS LOG "..date.." "..os.date("%H:%M:%S").."\n\nLogged with "..thisScript().name.." "..thisScript().version.." by "..thisScript().authors[1].." & "..thisScript().authors[2].."\n\n�����: Narvell (Neax_Wayne) - http://narvell.pw/\n�����: qrlk (James_Bond Phil_Coulson) - http://qrlk.me/samp\n\n1. �������� �����.\n2. �������������� \"��������\" (���������� �� ����������� ������).\n3. �������������� \"��������\" (���������� �� ���������� �� �����).\n4. �������������� \"��������\" (���������� �� ���������� �� ������).\n5. �������������� \"��������\" (���������� �� ���� ���������� ������).\n6. �������������� \"��������\" (���������� �� �����, ���� �� ����������� ������).\n7. �������������� \"��������\" (���������� �� �����, ���� �� ���������� �� �����).\n8. �������������� \"��������\" (���������� �� �����, ���� �� ���������� �� ������).\n9. �������������� \"��������\" (���������� �� �����, ���� �� ���� ���������� ������).\n\n"
    f = io.open(getGameDirectory()..'\\moonloader\\offmembers\\'..date..' '..time..'.log', "w+")
    if not f then
			f = io.open(getGameDirectory()..'\\moonloader\\offmembers\\'..date..' '..time..'.log', "w")
    end
    textt = ""
    for w in string.gmatch(text, "(.-)\n") do -- ���������� ���� ����� � ���������� textt, ������ ������ ������ � ���������� w.
      if #w > 0 then -- ���� ����� ������ "w" ������ 0.
        textt = textt..(w .. "\n")
      end
    end
    text = textt
    text2 = text
    --������ �� ������
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
        coollog = coollog.."\n"..member..". ����: "..rank..". �������: "..last..". �����: "..act..".", - 1
      end
    end
    -----�� ���������� �� ������
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
        sortrang[kolvo] = string.match(act, "(%d+)", string.find(act, "/"))..member.. ". ����: "..rank..". �������: "..last..". �����: "..act.."."
      end
    end
    if #sortrang > 0 then table.sort(sortrang, sort) end
    for i = 1, #sortrang do
      if i < 10 then place = "00"..i elseif i < 100 then place = "0"..i elseif i < 1000 then place = i end
      sortrang[i] = string.sub(sortrang[i], string.find(sortrang[i], "%["), #sortrang[i])
      coollograngact1 = coollograngact1.."\n"..place..". "..sortrang[i]
      sortrang[i] = nil
    end
    --�� ���������� �� ����
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
        sortrang[kolvo] = string.match(act, "(%d+)")..member.. ". ����: "..rank..". �������: "..last..". �����: "..act.."."
      end
    end
    if #sortrang > 0 then table.sort(sortrang, sort) end
    for i = 1, #sortrang do
      if i < 10 then place = "00"..i elseif i < 100 then place = "0"..i elseif i < 1000 then place = i end
      sortrang[i] = string.sub(sortrang[i], string.find(sortrang[i], "%["), #sortrang[i])
      coollograngactday1 = coollograngactday1.."\n"..place..". "..sortrang[i]
      sortrang[i] = nil
    end
    --�� ���� ������
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
        sortrang[kolvo] = convertedTimestamp..member..". ����: "..rank..". �������: "..last..". �����: "..act.."."
      end
    end
    if #sortrang > 0 then table.sort(sortrang, sort) end
    for i = 1, #sortrang do
      if i < 10 then place = "00"..i elseif i < 100 then place = "0"..i elseif i < 1000 then place = i end
      sortrang[i] = string.sub(sortrang[i], string.find(sortrang[i], "%["), #sortrang[i])
      coollograngDATE = coollograngDATE.."\n"..place..". "..sortrang[i]
      sortrang[i] = nil
    end
    -----�� ����� � ������
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
            sortrang[kolvo] = member..". ����: "..rank..". �������: "..last..". �����: "..act.."."
          end
        end
      end
      if #sortrang > 0 then coollograng = coollograng.."\n����: "..rank end
      for i = 1, #sortrang do
        sortrang[i] = string.sub(sortrang[i], string.find(sortrang[i], "%["), #sortrang[i])
        coollograng = coollograng.."\n"..sortrang[i]
        sortrang[i] = nil
      end
    end
    -----�� ����� � ���������� �� ����
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
            sortrang[kolvo] = string.match(act, "(%d+)")..member.. ". ����: "..rank..". �������: "..last..". �����: "..act.."."
          end
        end
      end
      if #sortrang > 0 then table.sort(sortrang, sort) coollograngactday = coollograngactday.."\n����: "..rang end
      for i = 1, #sortrang do
        if i < 10 then place = "00"..i elseif i < 100 then place = "0"..i elseif i < 1000 then place = i end
        sortrang[i] = string.sub(sortrang[i], string.find(sortrang[i], "%["), #sortrang[i])
        coollograngactday = coollograngactday.."\n"..place..". "..sortrang[i]
        sortrang[i] = nil
      end
    end
    -----�� ����� � ���������� �� ������
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
            sortrang[kolvo] = string.match(act, "(%d+)", string.find(act, "/"))..member..". ����: "..rank..". �������: "..last..". �����: "..act.."."
          end
        end
      end
      if #sortrang > 0 then table.sort(sortrang, sort) coollograngact = coollograngact.."\n����: "..rank end
      for i = 1, #sortrang do
        if i < 10 then place = "00"..i elseif i < 100 then place = "0"..i elseif i < 1000 then place = i end
        sortrang[i] = string.sub(sortrang[i], string.find(sortrang[i], "%["), #sortrang[i])
        coollograngact = coollograngact.."\n"..place..". "..sortrang[i]
        sortrang[i] = nil
      end
    end
    -----�� ����� � ���� ������
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
            sortrang[kolvo] = convertedTimestamp..member..". ����: "..rank..". �������: "..last..". �����: "..act.."."
          end
        end
      end
      if #sortrang > 0 then table.sort(sortrang, sort) coollogranglogin = coollogranglogin.."\n����: "..rang end
      for i = 1, #sortrang do
        if i < 10 then place = "00"..i elseif i < 100 then place = "0"..i elseif i < 1000 then place = i end
        sortrang[i] = string.sub(sortrang[i], string.find(sortrang[i], "%["), #sortrang[i])
        coollogranglogin = coollogranglogin.."\n"..place..". "..sortrang[i]
        sortrang[i] = nil
      end
    end
    --------------------------------------------------------
    f:write(
    meta.."\n1. �������� �����:\n"..text.."\n\n\n\n2. �������������� \"��������\" (���������� �� ����������� ������):"..coollog.."\n\n\n\n3. �������������� \"��������\" (���������� �� ���������� �� �����):"..coollograngactday1.."\n\n\n\n4. �������������� \"��������\" (���������� �� ���������� �� ������):"..coollograngact1.."\n\n\n\n5. �������������� \"��������\" (���������� �� ���� ���������� ������):"..coollograngDATE.."\n\n\n\n6. �������������� \"��������\" (���������� �� �����, ���� �� ����������� ������):"..coollograng.."\n\n\n\n7. �������������� \"��������\" (���������� �� �����, ���� �� ���������� �� �����):"..coollograngactday.."\n\n\n\n8. �������������� \"��������\" (���������� �� �����, ���� �� ���������� �� ������):"..coollograngact.."\n\n\n\n9. �������������� \"��������\" (���������� �� �����, ���� �� ���� ���������� ������):"..coollogranglogin)
    f:flush()
    f:close()
    local s = "{348cb2}������ ������� �������� � ������������ {ffffff}"..list.." �������!{348cb2}\n��� ������� �:{ffffff} moonloader/offmembers/"..date.." "..time..".log\n{348cb2}"..string.format("�� ���������� /offmembers ���� ���������:{ffffff} %.2f ������.\n{348cb2}��� ��������� .log {ffffff}������������� Notepad++.", os.clock() - x)
    sampShowDialog(5555, "{348cb2}"..thisScript().name.." v"..thisScript().version, s, "OK", "�����", 0)
  end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
----------------------------------OM & OMID-------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--��������� OM
function getOM(nickname)
  lua_thread.create(getMEM, nickname)
  Enableom = true
end
--��������� OMID
function getOMID(id)
  local id = tonumber(id)
  if id ~= nil and id >= 0 and id <= 1000 and sampIsPlayerConnected(id) then
    lua_thread.create(getMEM, sampGetPlayerNickname(id))
    Enableom = true
  end
end
--������, �����, ����� � ��� � ��������� ������.
--����� ��� �� ���������� � ������� - /om
function getMEM(nickname)
  paramnomer = tonumber(nickname)
  if paramnomer ~= nil and paramnomer >= 0 and paramnomer < 10000 then
    sampSendChat("/offmembers")
    while not sampIsDialogActive() do wait(100) end
    if Enableom and sampIsDialogActive() and sampGetCurrentDialogId() == 22 then
      DialogText = sampGetDialogText()
      while string.find(DialogText, "%["..paramnomer.."%]") == nil and sampGetChatString(99) ~= " ������ ����" do
        wait(0)
        if string.find(DialogText, ">> ����.��������") and sampGetChatString(99) ~= " ������ ����" then
          wait(400)
          if sampGetChatString(99) ~= " ������ ����" then
            sampSendDialogResponse(22, 1, _, ">> ����.��������")
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
      Member = string.gsub(Member, "���: ", "")
      while string.find(Member, "\n") do
        wait(0)
        Member = string.gsub(Member, "\n", "")
      end
      Member = string.gsub(Member, "����: ", ". ����: ")
      Member = string.gsub(Member, "���� ����������: ", ". ������: ")
      Member = string.gsub(Member, "���� ����.�����: ", ". �������: ")
      Member = string.gsub(Member, "����������. ����� �� �����/������: ", ". �����: ")
      sampAddChatMessage("["..chatTag.."]: "..Member, - 1)
      Enableom = false
    end
  else
    param = tostring(nickname)
    if param == "" then
      sampShowDialog(5557, "\t"..chatTag.." by {FF5F5F}Narvell (Neax_Wayne){ffffff}, {348cb2}qrlk (James_Bond, Phil_Coulson)", "{ffffff}["..chatTag.."]: ������� {348cb2}/omlog{ffffff}, ����� �������� {348cb2}/offmembers{ffffff} � ��������� ����.\n\n["..chatTag.."]: ������� {348cb2}/om NICK{ffffff}, ����� ����� ������ {348cb2}NICK{ffffff} � /offmembers.\n["..chatTag.."]: ������� {348cb2}/om 0-9999{ffffff}, ����� ����� ������ � ������� {348cb2}0-9999{ffffff} � /offmembers.\n["..chatTag.."]: ������� {348cb2}/omid 0-999{ffffff}, ����� ����� ������ � id {348cb2}0-999{ffffff} � /offmembers.\n\n["..chatTag.."]: ������� {348cb2}/omrank 0-14{ffffff}, ����� ������� ���� ������� � ������ {348cb2}0-14{ffffff} � /offmembers.\n["..chatTag.."]: ������� {348cb2}/omdate 1-999{ffffff}, ����� ������� ���� �������, ����������� {348cb2}1-999{ffffff}+ ����.\n["..chatTag.."]: ������� {348cb2}/som TEXT{ffffff}, ����� ������� ���� ������� � {348cb2}TEXT{ffffff} � ������� /offmembers.\n\n["..chatTag.."]: ������� {348cb2}/omchangelog{ffffff}, ����� ������, ��� ������.", "OK")
    else
      sampSendChat("/offmembers")
      wait(500)
      if Enableom and sampIsDialogActive() and sampGetCurrentDialogId() == 22 then
        DialogText = sampGetDialogText()
        while string.find(DialogText, nickname) == nil and sampGetChatString(99) ~= " ������ ����" do
          wait(0)
          if string.find(DialogText, ">> ����.��������") and sampGetChatString(99) ~= " ������ ����" then
            wait(200)
            if sampGetChatString(99) ~= " ������ ����" then
              sampSendDialogResponse(22, 1, _, ">> ����.��������")
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
          Member = string.gsub(Member, "���: ", "")
          while string.find(Member, "\n") do
            wait(0)
            Member = string.gsub(Member, "\n", "")
          end
          Member = string.gsub(Member, "����: ", ". ����: ")
          Member = string.gsub(Member, "���� ����������: ", ". ������: ")
          Member = string.gsub(Member, "���� ����.�����: ", ". �������: ")
          Member = string.gsub(Member, "����������. ����� �� �����/������: ", ". �����: ")
          sampAddChatMessage("["..chatTag.."]: "..Member, - 1)
          Enableom = false
        else
          sampAddChatMessage("["..chatTag.."]: ��� "..nickname.. " �� ������.", - 1)
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
--��������� SOM
function som(nickname)
  if nickname ~= "" then
    lua_thread.create(somm, nickname)
    Enableom = true
  end
end
--������, ����� ������ � ����� ���
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
        while string.find(DialogText, ">> ����.��������") and sampGetChatString(99) ~= " ������ ����" do
          wait(200)
          sampSendDialogResponse(22, 1, _, ">> ����.��������")
          wait(200)
          if sampGetChatString(99) ~= " ������ ����" then DialogText = sampGetDialogText()
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
      DialogTextLog = string.gsub(DialogTextLog, "%[#%] ��� 	���� 	��������� ���� 	���������� �� �����/������", "")
      DialogTextLog = string.gsub(DialogTextLog, ">> ����.��������", "")
      DialogTextLog = string.gsub(DialogTextLog, "<< ����.��������", "")
      numbers = 0
      for i = 1, list do
        numbers = numbers + 39
      end
      logged = true
    end
    kolvo = 0
    kount = 0
    dialog = "{348cb2}��� ��, ��� ������ ����� � ������������ �� �����: {ffffff}"
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
              sortrang[kolvo] = member..". ����: "..rank..". �������: "..last..". �����: "..act.."."
            end
          end
        end
      end
      if #sortrang > 0 then dialog = dialog.."\n{348cb2}����: "..rang.."{ffffff}" end
      for i = 1, #sortrang do
        sortrang[i] = string.sub(sortrang[i], string.find(sortrang[i], "%["), #sortrang[i])
        dialog = dialog.."\n"..i..". "..sortrang[i]
        kount = kount + 1
        sortrang[i] = nil
      end
    end
    dialog = dialog.."\n{348cb2}������� "..kount.." ����������."
    sampCloseCurrentDialogWithButton(0)
    Enableom = false
    sampShowDialog(5555, "{348cb2}"..thisScript().name.." v"..thisScript().version, dialog, "�����")
    while sampIsDialogActive(5555) do wait(100) end
  end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
------------------------------------OMRANK--------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--��������� OMRANK
function omrank(rang)
  lua_thread.create(omrankk, rang)
  Enableom = true
end
--������, ������, ����� � ������/���
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
      while string.find(DialogText, ">> ����.��������") and sampGetChatString(99) ~= " ������ ����" do
        wait(200)
        sampSendDialogResponse(22, 1, _, ">> ����.��������")
        wait(200)
        if sampGetChatString(99) ~= " ������ ����" then DialogText = sampGetDialogText()
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
    DialogTextLog = string.gsub(DialogTextLog, "%[#%] ��� 	���� 	��������� ���� 	���������� �� �����/������", "")
    DialogTextLog = string.gsub(DialogTextLog, ">> ����.��������", "")
    DialogTextLog = string.gsub(DialogTextLog, "<< ����.��������", "")
    numbers = 0
    for i = 1, list do
      numbers = numbers + 39
    end
    logged = true
  end
  kolvo = 0
  dialog = "{348cb2}��� ��, ��� ������ ����� � ������������ �� ���������� �� ������: {ffffff}"
  sortrang = {}
  rang = rang..rangprobel
  for i = 0, numbers do
    index = string.find(DialogTextLog, "%["..i.."%]")
    index2 = string.find(DialogTextLog, "\n", index)
    if index ~= nil and index2 ~= nil then
      if string.find(string.lower(string.sub(DialogTextLog, index, index2 - 1)), rang.."(%d+)/(%d+)/(%d+) (%d+):(%d+):(%d+)", 1, false) then
        gsub()
        sortrang[kolvo] = string.match(act, "(%d+)", string.find(act, "/"))..member..". ����: "..rank..". �������: "..last..". �����: "..act.."."
        table.sort(sortrang, sort)
      end
    end
  end
  for i = 1, #sortrang do
    sortrang[i] = string.sub(sortrang[i], string.find(sortrang[i], "%["), #sortrang[i])
    dialog = dialog.."\n"..i..". "..sortrang[i]
  end
  dialog = dialog.."\n{348cb2}������� "..kolvo.." ����������."
  sampCloseCurrentDialogWithButton(0)
  Enableom = false
  if string.len(dialog) < 3500 then
    sampShowDialog(5555, "{348cb2}"..thisScript().name.." v"..thisScript().version, dialog, "� ���", "�����", 0)
    while sampIsDialogActive(5555) do wait(100) end
    sfdsfds, buttonMain5555, sdfsdfsd = sampHasDialogRespond(5555)
  else
    buttonMain5555 = 1
  end
  if buttonMain5555 == 1 then
    for i = 1, #sortrang do
      sampAddChatMessage("["..chatTag.."]: "..i..". "..sortrang[i], color)
    end
    sampAddChatMessage("["..chatTag.."]: ������� "..kolvo.." ����������.", - 1)
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
--��������� OMDATE
function omdate(days)
  lua_thread.create(omdatee, days)
  Enableom = true
end
--������, ������, ����� � ������/���
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
        while string.find(DialogText, ">> ����.��������") and sampGetChatString(99) ~= " ������ ����" do
          wait(200)
          sampSendDialogResponse(22, 1, _, ">> ����.��������")
          wait(200)
          if sampGetChatString(99) ~= " ������ ����" then DialogText = sampGetDialogText()
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
      DialogTextLog = string.gsub(DialogTextLog, "%[#%] ��� 	���� 	��������� ���� 	���������� �� �����/������", "")
      DialogTextLog = string.gsub(DialogTextLog, ">> ����.��������", "")
      DialogTextLog = string.gsub(DialogTextLog, "<< ����.��������", "")
      numbers = 0
      for i = 1, list do
        numbers = numbers + 39
      end
      logged = true
    end
    dialog = "{348cb2}��� ��, ��� ������ ����� � ������������ �� ���� ���������� ������: {ffffff}"
    kolvo = 0
    sortrang = {}
    for i = 0, numbers do
      index = string.find(DialogTextLog, "%["..i.."%]")
      index2 = string.find(DialogTextLog, "\n", index)
      if index ~= nil and index2 ~= nil then
        datetimetounix()
        if convertedTimestamp - os.time() + timeomdate < 0 then
          gsub()
          sortrang[kolvo] = string.match(convertedTimestamp, "(%d+)", string.find(act, "/"))..member..". ����: "..rank..". �������: "..last..". �����: "..act.."."
          table.sort(sortrang, sort1)
        end
      end
    end
    for i = 1, #sortrang do
      sortrang[i] = string.sub(sortrang[i], string.find(sortrang[i], "%["), #sortrang[i])
      dialog = dialog.."\n"..i..". "..sortrang[i]
    end
    dialog = dialog.."\n{348cb2}������� "..kolvo.." �������, ����������� "..param.."+ ����."
    sampCloseCurrentDialogWithButton(0)
    Enableom = false
    if string.len(dialog) < 3500 then
      sampShowDialog(5555, "{348cb2}"..thisScript().name.." v"..thisScript().version, dialog, "� ���", "�����", 0)
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
      sampAddChatMessage("["..chatTag.."]: ������� "..kolvo.." �������, ����������� "..param.."+ ����.", - 1)
    end
  else
    sampAddChatMessage("["..chatTag.."]: ������� {348cb2}/omdate 1-999{ffffff}, ������� �������, ����������� {348cb2}1-999{ffffff}+ ����.", - 1)
    for i = 1, #sortrang do
      sortrang[i] = nil
    end
  end
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
------------------------------------������--------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--���������� �� ����������� (� ����� ��������)
function sort(a, b)
  test1 = a
  test2 = b
  return tonumber(string.match(test1, "(%d+)")) > tonumber(string.match(test2, "(%d+)"))
end
--���������� �� �������� (� ����� ��������)
function sort1(a, b)
  test1 = a
  test2 = b
  return tonumber(string.match(test1, "(%d+)")) < tonumber(string.match(test2, "(%d+)"))
end
--------------------------------------------------------------------------------
------------------------------------UPDATE--------------------------------------
--------------------------------------------------------------------------------
--�������������� � ����� �� ���������� �������������
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
                sampAddChatMessage((prefix..'���������� ����������. ������� ���������� c '..thisScript().version..' �� '..updateversion), color)
                wait(250)
                downloadUrlToFile(updatelink, thisScript().path,
                  function(id3, status1, p13, p23)
                    if status1 == dlstatus.STATUS_DOWNLOADINGDATA then
                      print(string.format('��������� %d �� %d.', p13, p23))
                    elseif status1 == dlstatus.STATUS_ENDDOWNLOADDATA then
                      print('�������� ���������� ���������.')
                      if komandaA ~= nil then
                        sampAddChatMessage((prefix..'���������� ���������! ��������� �� ���������� - /'..komandaA..'.'), color)
                      end
                      goupdatestatus = true
                      lua_thread.create(function() wait(500) thisScript():reload() end)
                    end
                    if status1 == dlstatus.STATUSEX_ENDDOWNLOAD then
                      if goupdatestatus == nil then
                        sampAddChatMessage((prefix..'���������� ������ ��������. �������� ���������� ������..'), color)
                        update = false
                      end
                    end
                  end
                )
                end, prefix
              )
            else
              update = false
              print('v'..thisScript().version..': ���������� �� ���������.')
            end
          end
        else
          print('v'..thisScript().version..': �� ���� ��������� ����������. ��������� ��� ��������� �������������� �� '..url)
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
          sampShowDialog(222228, "{ff0000}���������� �� ����������", "{ffffff}"..thisScript().name.." {ffe600}���������� ������� ���� changelog ��� ���.\n���� �� ������� {ffffff}�������{ffe600}, ������ ���������� ������� ������:\n        {ffffff}"..changelogurl.."\n{ffe600}���� ���� ���� ���������, �� ������ ������� ��� ������ ����.", "�������", "��������")
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
