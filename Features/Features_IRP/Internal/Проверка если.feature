﻿#language: ru

@tree

Функционал: <описание фичи>

Как <Роль> я хочу
<описание функционала> 
чтобы <бизнес-эффект> 

Сценарий: <описание сценария>
	* Проверка видимости элементов
		Если элемент формы с именем "Company" присутствует на форме Тогда
			И я нажимаю кнопку выбора у поля с именем "Company"
		И я нажимаю кнопку выбора у поля с именем "PriceType"
	* Проверка макета когда не совпадают строки
		Если Табличный документ "ResultTable" равен макету "Закупки1" Тогда
		ИначеЕсли Табличный документ "ResultTable" равен макету "Закупки2" Тогда
		Иначе
			Тогда я вызываю исключение "Макет не совпал" 	
			