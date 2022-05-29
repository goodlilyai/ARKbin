package.path = Fun_GetCureentPath() .. "?.lua;" .. package.path


if (SwapGold()>0) then
	Fun_SetConfigValue(99)
end