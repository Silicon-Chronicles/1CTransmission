
&НаКлиенте
Процедура ОтправитьЗапрос(Команда)
	ОтправитьЗапросНаСервере();
КонецПроцедуры

&НаСервере
Процедура ОтправитьЗапросНаСервере()
	Результат = Торрент.TorrentGet();
КонецПроцедуры

&НаКлиенте
Процедура Обновить(Команда)
	ОбновитьНаСервере();
КонецПроцедуры

&НаСервере
Процедура ОбновитьНаСервере()
	Результат = Торрент.TorrentGet();
	СписокТоррентов.Очистить();
	Для Каждого стр Из Результат Цикл
		НоваяСтрока = СписокТоррентов.Добавить();
		ЗаполнитьЗначенияСвойств(НоваяСтрока, стр);
	КонецЦикла;
	
	Статистика = Торрент.SessionStats();
	UploadSpeed = Статистика["uploadSpeed"];
	DownloadSpeed = Статистика["downloadSpeed"];
	
КонецПроцедуры

#Область ОбработчикиКомандФормы

&НаКлиенте
Процедура КонтекстноеМенюАнонсировать(Команда)
	КонтекстноеМенюАнонсироватьНаСервере();
КонецПроцедуры

&НаКлиенте
Процедура КонтекстноеМенюЗапустить(Команда)
	КонтекстноеМенюЗапуститьНаСервере();
КонецПроцедуры

&НаКлиенте
Процедура КонтекстноеМенюЗапуститьПринудительно(Команда)
	КонтекстноеМенюЗапуститьПринудительноНаСервере();
КонецПроцедуры

&НаКлиенте
Процедура КонтекстноеМенюОстановить(Команда)
	КонтекстноеМенюОстановитьНаСервере();
КонецПроцедуры

&НаКлиенте
Процедура КонтекстноеМенюПроверить(Команда)
	КонтекстноеМенюПроверитьНаСервере();
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаСервере
Процедура КонтекстноеМенюЗапуститьНаСервере()
	МассивИдентификаторов = ПолучитьМассивИдентификаторовВыделенныхСтрок();
	Торрент.TorrentStart(МассивИдентификаторов);
КонецПроцедуры

&НаСервере
Процедура КонтекстноеМенюЗапуститьПринудительноНаСервере()
	МассивИдентификаторов = ПолучитьМассивИдентификаторовВыделенныхСтрок();
	Торрент.TorrentStartNow(МассивИдентификаторов);
КонецПроцедуры

&НаСервере
Процедура КонтекстноеМенюОстановитьНаСервере()
	МассивИдентификаторов = ПолучитьМассивИдентификаторовВыделенныхСтрок();
	Торрент.TorrentStop(МассивИдентификаторов);
КонецПроцедуры

&НаСервере
Процедура КонтекстноеМенюПроверитьНаСервере()
	МассивИдентификаторов = ПолучитьМассивИдентификаторовВыделенныхСтрок();
	Торрент.TorrentVerify(МассивИдентификаторов);
КонецПроцедуры

&НаСервере
Процедура КонтекстноеМенюАнонсироватьНаСервере()
	МассивИдентификаторов = ПолучитьМассивИдентификаторовВыделенныхСтрок();
	Торрент.TorrentReannounce(МассивИдентификаторов);
КонецПроцедуры

&НаСервере
Функция ПолучитьМассивИдентификаторовВыделенныхСтрок()
	МассивИдентификаторов = Новый Массив;
	
	Для Каждого ИдСтроки Из Элементы.СписокТоррентов.ВыделенныеСтроки Цикл
		МассивИдентификаторов.Добавить(СписокТоррентов.НайтиПоИдентификатору(ИдСтроки).id);
	КонецЦикла;
	
	Возврат МассивИдентификаторов;
КонецФункции

#КонецОбласти



