﻿#language: ru

@tree

Функционал: тест отчетов

Как тестировщик я хочу
проверить отчетность

Контекст:
	Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: _0901 Подготовительный
	Когда экспорт документов закупок

Сценарий: _0902 Проверка отчета по номенклатуре
	И В командном интерфейсе я выбираю 'Отчеты' 'D0010 Информация по товарам'
	Тогда открылось окно 'D0010 Информация по товарам'
	И я нажимаю на кнопку с именем 'FormGenerate'
	И в табличном документе 'Result' я перехожу к ячейке "R5C1"
	Дано Табличный документ "Result" равен макету "ИнформацияПоТоварам1" по шаблону

Сценарий: _0903 Проверка отчета по закупкам
	И я закрываю все окна клиентского приложения
	И В командном интерфейсе я выбираю 'Отчеты' 'D1001 Закупки'
	Тогда открылось окно 'D1001 Закупки'
	И я нажимаю на кнопку с именем 'FormGenerate'
	И я жду когда в табличном документе "Result" заполнится ячейка "R8C2" в течение 20 секунд
	Дано Табличный документ "Result" равен макету "Закупки1" по шаблону
		
	

 	


