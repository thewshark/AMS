------------------------------[[ SCRIPT: Page: Page1, Object: ListBoxTimeZones, Event: On Select Script ]]------------------------------
zoneId = ListBox.GetItemText("ListBoxTimeZones", ListBox.GetSelected("ListBoxTimeZones")[1]);
tzd = tzi:GetTimeZoneInfoFromZoneId(zoneId);

Input.SetText("InputStandardName", tzd.StandardName);
Input.SetText("InputDisplayName", tzd.DisplayName);
Input.SetText("InputDaylightName", tzd.DaylightName);

Input.SetText("InputDaylightDate", tzd.DaylightDate);
Input.SetText("InputStandardDate", tzd.StandardDate);

Input.SetText("InputSupportsDaylightSavingTime", tostring(tzd.SupportsDaylightSavingTime));
Input.SetText("InputIsDaylightSavingTime", tostring(tzd.IsDaylightSavingTime));
Input.SetText("InputIsDynamicDaylightSavingTime", tostring(tzd.IsDynamicDaylightSavingTime));

Input.SetText("InputBaseUtcOffset", tzd.BaseUtcOffset);
Input.SetText("InputCurrentUtcOffset", tzd.CurrentUtcOffset);

Input.SetText("InputLocalTime", tzd.LocalTime);

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonUnregisterActiveX, Event: On Click Script ]]------------------------------
System.UnregisterActiveX(Folder.GetCurrent().."\\AutoPlay\\Docs\\TimeZoneInfo.dll");

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetSystemTimeZonesIdList, Event: On Click Script ]]------------------------------
ListBox.DeleteItem("ListBoxTimeZones", -1);

tzIdList = tzi:GetSystemTimeZonesIdList();
for i, v in tzIdList do
	ListBox.AddItem("ListBoxTimeZones", v, "");
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetSystemTimeZones, Event: On Click Script ]]------------------------------
ListBox.DeleteItem("ListBoxTimeZones", -1);

tzList = tzi:GetSystemTimeZones();
for i, v in tzList do
	ListBox.AddItem("ListBoxTimeZones", v.Id, "");
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetTimeZoneInfoFromZoneId, Event: On Click Script ]]------------------------------
tzd = tzi:GetTimeZoneInfoFromZoneId("W. Europe Standard Time");

Input.SetText("InputStandardName", tzd.StandardName);
Input.SetText("InputDisplayName", tzd.DisplayName);
Input.SetText("InputDaylightName", tzd.DaylightName);

Input.SetText("InputDaylightDate", tzd.DaylightDate);
Input.SetText("InputStandardDate", tzd.StandardDate);

Input.SetText("InputSupportsDaylightSavingTime", tostring(tzd.SupportsDaylightSavingTime));
Input.SetText("InputIsDaylightSavingTime", tostring(tzd.IsDaylightSavingTime));
Input.SetText("InputIsDynamicDaylightSavingTime", tostring(tzd.IsDynamicDaylightSavingTime));

Input.SetText("InputBaseUtcOffset", tzd.BaseUtcOffset);
Input.SetText("InputCurrentUtcOffset", tzd.CurrentUtcOffset);

Input.SetText("InputLocalTime", tzd.LocalTime);

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetLocalTimeZoneInfo, Event: On Click Script ]]------------------------------
tzd = tzi:GetLocalTimeZoneInfo();

Input.SetText("InputStandardName", tzd.StandardName);
Input.SetText("InputDisplayName", tzd.DisplayName);
Input.SetText("InputDaylightName", tzd.DaylightName);

Input.SetText("InputDaylightDate", tzd.DaylightDate);
Input.SetText("InputStandardDate", tzd.StandardDate);

Input.SetText("InputSupportsDaylightSavingTime", tostring(tzd.SupportsDaylightSavingTime));
Input.SetText("InputIsDaylightSavingTime", tostring(tzd.IsDaylightSavingTime));
Input.SetText("InputIsDynamicDaylightSavingTime", tostring(tzd.IsDynamicDaylightSavingTime));

Input.SetText("InputBaseUtcOffset", tzd.BaseUtcOffset);
Input.SetText("InputCurrentUtcOffset", tzd.CurrentUtcOffset);

Input.SetText("InputLocalTime", tzd.LocalTime);

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonCreate, Event: On Click Script ]]------------------------------
tzi = luacom.CreateObject("TimeZoneInfo.TimeZoneInfoClass");

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonRegisterActiveX, Event: On Click Script ]]------------------------------
System.RegisterActiveX(Folder.GetCurrent().."\\AutoPlay\\Docs\\TimeZoneInfo.dll");

